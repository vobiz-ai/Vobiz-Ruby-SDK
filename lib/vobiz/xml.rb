require 'cgi'

module Vobiz
  module XML
    module_function

    def play(audio_url, continue_url = nil)
      next_element = continue_url ? "\n  <Redirect>#{esc(continue_url)}</Redirect>" : ''
      wrap("<Play>#{esc(audio_url)}</Play>#{next_element}")
    end

    def wait(length: 1, silence: false, min_silence: 2000, beep: false, prompt: nil)
      attrs = [
        %(length="#{length}"),
        silence ? %(silence="#{silence}") : nil,
        (silence && min_silence) ? %(minSilence="#{min_silence}") : nil,
        beep ? %(beep="#{beep}") : nil
      ].compact.join(' ')
      prompt_xml = prompt ? "\n  <Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>" : ''
      wrap("#{prompt_xml}\n  <Wait #{attrs}/>")
    end

    def hangup(reason: nil, schedule: nil, prompt: 'Thank you for calling. Goodbye!')
      attrs = [
        reason ? %(reason="#{esc(reason)}") : nil,
        schedule ? %(schedule="#{esc(schedule)}") : nil
      ].compact.join(' ')
      attrs = attrs.empty? ? '' : " #{attrs}"
      wrap("<Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>\n  <Hangup#{attrs}/>")
    end

    def redirect(url)
      wrap("<Redirect>#{esc(url)}</Redirect>")
    end

    def dtmf(digits: '1234', async: true)
      wrap("<Speak voice=\"WOMAN\" language=\"en-US\">Sending tones: #{esc(digits)}</Speak>\n  <DTMF async=\"#{async}\">#{esc(digits)}</DTMF>")
    end

    def preanswer(audio_url: nil, prompt: 'Please hold while we process your call.')
      audio_content = if audio_url
                        "<Play>#{esc(audio_url)}</Play>"
                      else
                        "<Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>"
                      end
      wrap("<PreAnswer/>\n  #{audio_content}")
    end

    def stream(stream_url: 'wss://stream.example.com/audio', bidirectional: true, stream_timeout: 600,
               status_callback_url: nil)
      attrs = [
        %(bidirectional="#{bidirectional}"),
        %(streamTimeout="#{stream_timeout}"),
        status_callback_url ? %(statusCallbackUrl="#{esc(status_callback_url)}") : nil
      ].compact.join(' ')
      wrap("<Stream #{attrs}>#{esc(stream_url)}</Stream>")
    end

    def conference(conference_name: 'default-conference', action_url: nil, method: 'POST',
                   prompt: 'Connecting you to the conference room.')
      action_attr = action_url ? %( action="#{esc(action_url)}" method="#{method}") : ''
      wrap("<Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>\n  <Conference#{action_attr}>#{esc(conference_name)}</Conference>")
    end

    def dial(phone_number: '+14155551234', action_url: nil, method: 'POST', hangup_on_star: false,
             time_limit: 14_400, timeout: nil, caller_id: nil, caller_name: nil,
             confirm_sound: nil, confirm_key: nil, dial_music: 'real', callback_url: nil,
             callback_method: 'POST', redirect: true, send_digits: nil,
             prompt: nil, prompt_voice: 'WOMAN', prompt_language: 'en-US')
      attrs = [
        action_url ? %(action="#{esc(action_url)}") : nil,
        action_url ? %(method="#{method}") : nil,
        action_url ? %(redirect="#{redirect}") : nil,
        hangup_on_star ? %(hangupOnStar="#{hangup_on_star}") : nil,
        truthy_js?(time_limit) ? %(timeLimit="#{time_limit}") : nil,
        truthy_js?(timeout) ? %(timeout="#{timeout}") : nil,
        caller_id ? %(callerId="#{esc(caller_id)}") : nil,
        caller_name ? %(callerName="#{esc(caller_name)}") : nil,
        confirm_sound ? %(confirmSound="#{esc(confirm_sound)}") : nil,
        confirm_key ? %(confirmKey="#{esc(confirm_key)}") : nil,
        dial_music ? %(dialMusic="#{esc(dial_music)}") : nil,
        callback_url ? %(callbackUrl="#{esc(callback_url)}") : nil,
        callback_url ? %(callbackMethod="#{callback_method}") : nil
      ].compact.join(' ')

      number_attr = send_digits ? %( sendDigits="#{esc(send_digits)}") : ''
      prompt_xml = if prompt
                     "<Speak voice=\"#{esc(prompt_voice)}\" language=\"#{esc(prompt_language)}\">#{esc(prompt)}</Speak>\n  "
                   else
                     ''
                   end
      wrap("#{prompt_xml}<Dial #{attrs}>\n    <Number#{number_attr}>#{esc(phone_number)}</Number>\n  </Dial>")
    end

    def gather(action_url: nil, method: 'POST', input_type: 'dtmf', execution_timeout: 15,
               digit_end_timeout: 'auto', speech_end_timeout: 'auto', finish_on_key: '#',
               num_digits: 1, speech_model: 'default', language: 'en-US',
               interim_speech_results_callback: nil, log: true, redirect: true,
               profanity_filter: false, prompt: 'Please press a digit or speak your input.')
      attrs = [
        action_url ? %(action="#{esc(action_url)}") : nil,
        action_url ? %(method="#{method}") : nil,
        truthy_js?(input_type) ? %(inputType="#{input_type}") : nil,
        truthy_js?(execution_timeout) ? %(executionTimeout="#{execution_timeout}") : nil,
        truthy_js?(digit_end_timeout) ? %(digitEndTimeout="#{digit_end_timeout}") : nil,
        truthy_js?(speech_end_timeout) ? %(speechEndTimeout="#{speech_end_timeout}") : nil,
        !finish_on_key.nil? ? %(finishOnKey="#{esc(finish_on_key)}") : nil,
        truthy_js?(num_digits) ? %(numDigits="#{num_digits}") : nil,
        truthy_js?(speech_model) ? %(speechModel="#{speech_model}") : nil,
        truthy_js?(language) ? %(language="#{language}") : nil,
        %(log="#{log}"),
        %(redirect="#{redirect}"),
        %(profanityFilter="#{profanity_filter}"),
        interim_speech_results_callback ? %(interimSpeechResultsCallback="#{esc(interim_speech_results_callback)}") : nil
      ].compact.join(' ')

      wrap("<Gather #{attrs}>\n    <Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>\n  </Gather>")
    end

    def record(action_url: nil, method: 'POST', file_format: 'mp3', redirect: false, timeout: 60,
               max_length: 60, play_beep: true, finish_on_key: '#', record_session: false,
               start_on_dial_answer: false, transcription_type: 'auto', transcription_url: nil,
               transcription_method: 'POST', callback_url: nil, callback_method: 'POST',
               prompt: 'Please leave your message after the beep. Press hash when done.')
      attrs = [
        action_url ? %(action="#{esc(action_url)}") : nil,
        action_url ? %(method="#{method}") : nil,
        action_url ? %(redirect="#{redirect}") : nil,
        truthy_js?(file_format) ? %(fileFormat="#{file_format}") : nil,
        truthy_js?(timeout) ? %(timeout="#{timeout}") : nil,
        truthy_js?(max_length) ? %(maxLength="#{max_length}") : nil,
        %(playBeep="#{play_beep}"),
        truthy_js?(finish_on_key) ? %(finishOnKey="#{esc(finish_on_key)}") : nil,
        %(recordSession="#{record_session}"),
        %(startOnDialAnswer="#{start_on_dial_answer}"),
        truthy_js?(transcription_type) ? %(transcriptionType="#{transcription_type}") : nil,
        transcription_url ? %(transcriptionUrl="#{esc(transcription_url)}") : nil,
        transcription_url ? %(transcriptionMethod="#{transcription_method}") : nil,
        callback_url ? %(callbackUrl="#{esc(callback_url)}") : nil,
        callback_url ? %(callbackMethod="#{callback_method}") : nil
      ].compact.join(' ')

      wrap("<Speak voice=\"WOMAN\" language=\"en-US\">#{esc(prompt)}</Speak>\n  <Record #{attrs}/>")
    end

    def speak(text: 'Hello', voice: 'WOMAN', language: 'en-US', loop: 1, use_ssml: false, ssml_content: nil)
      content = use_ssml && ssml_content ? ssml_content : esc(text)
      loop_attr = if !loop.nil? && loop.to_i > 0
                    %( loop="#{loop}")
                  elsif loop == 0
                    ' loop="0"'
                  else
                    ''
                  end
      wrap("<Speak voice=\"#{voice}\" language=\"#{language}\"#{loop_attr}>#{content}</Speak>")
    end

    def ssml(text: 'Hello', rate: 'medium', breaks: 1, spell_out: false, voice: 'Polly.Amy')
      break_tags = Array.new(breaks, '<break/>').join
      content = spell_out ? %(<say-as interpret-as="spell-out">#{esc(text)}</say-as>) : esc(text)
      _ = voice
      %(<prosody rate="#{esc(rate)}">#{content}#{break_tags}</prosody>)
    end

    def speak_and_wait(text: 'Processing', voice: 'WOMAN', language: 'en-US', wait_length: 3,
                       silence: false, min_silence: 2000)
      wait_attrs = [
        %(length="#{wait_length}"),
        silence ? %(silence="#{silence}") : nil,
        (silence && min_silence) ? %(minSilence="#{min_silence}") : nil
      ].compact.join(' ')
      wrap("<Speak voice=\"#{voice}\" language=\"#{language}\">#{esc(text)}</Speak>\n  <Wait #{wait_attrs}/>")
    end

    def wrap(inner)
      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  #{inner}\n</Response>"
    end

    def esc(value)
      CGI.escapeHTML(value.to_s)
    end

    def truthy_js?(value)
      !value.nil? && value != false && value != '' && value != 0
    end
  end
end
