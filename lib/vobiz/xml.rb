# frozen_string_literal: true

# vobizxml - build VobizXML call-control documents in Ruby.
#
# Mirrors the Python (`vobiz.vobizxml`) and Node (`@vobiz/sdk` `vobizxml`) builders
# and emits XML byte-identical to them. Single self-contained file so it works as
# soon as it is injected into the published `vobiz` gem at release time (no
# dependency on the rest of the SDK), exposed as `require "vobiz/xml"`.
#
#   require "vobiz/xml"
#
#   r = Vobiz::XML::Response.new
#   g = r.add_gather(action: "https://yourapp.com/menu", input_type: "dtmf",
#                    num_digits: 1, execution_timeout: 10)
#   g.add_speak("Press 1 for sales, 2 for support.")
#   r.add_hangup
#   puts r.to_s              # pretty, with XML declaration
#   r.to_s(pretty: false)   # compact single line for webhook responses
#
# Ruby kwargs are snake_case and map to VobizXML's camelCase attributes
# (`input_type` -> `inputType`, `execution_timeout` -> `executionTimeout`, etc.).

module Vobiz
  module XML
    XML_DECLARATION = '<?xml version="1.0" encoding="UTF-8"?>'
    INDENT = "    " # 4 spaces, matching the xml/*.mdx reference style

    # Small serialization helpers shared by every element.
    module Helpers
      module_function

      # snake_case kwarg -> camelCase XML attribute. A single trailing underscore
      # is stripped (so a reserved word could be passed as `foo_`). Keys that are
      # already camelCase pass through unchanged.
      def to_camel(key)
        str = key.to_s
        str = str[0..-2] if str.end_with?("_")
        head, *rest = str.split("_")
        head.to_s + rest.map { |p| p.empty? ? "" : p[0].upcase + p[1..] }.join
      end

      # Render an attribute value: bools -> "true"/"false", everything else -> to_s.
      def attr_value(value)
        case value
        when true then "true"
        when false then "false"
        else value.to_s
        end
      end

      # Escape XML text content.
      def escape(text)
        text.to_s.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
      end

      # Escape an attribute value (text rules plus double quotes).
      def escape_attr(value)
        escape(value).gsub('"', "&quot;")
      end
    end

    # A single VobizXML element: ordered attribute map, optional text content, and
    # child elements. Subclasses set the tag name and expose `add_*` helpers.
    class Element
      attr_reader :name, :content, :raw, :children, :attributes

      def initialize(name, content: nil, raw: false, **attrs)
        @name = name
        @content = content
        @raw = raw # if true, content is inserted without escaping (e.g. SSML)
        @children = []
        @attributes = {}
        apply_attrs(attrs)
      end

      # Append a child element and return it (so callers can keep nesting).
      def add(element)
        @children << element
        element
      end

      # Set/override attributes after construction; returns self for chaining.
      def set(**attrs)
        apply_attrs(attrs)
        self
      end

      # Serialize to a VobizXML document string (with the XML declaration).
      # Pretty by default; pass `pretty: false` for a compact single line.
      def to_s(pretty: true)
        body = render(0, pretty)
        XML_DECLARATION + (pretty ? "\n" : "") + body
      end
      alias to_string to_s

      protected

      def render(level, pretty)
        pad = pretty ? INDENT * level : ""
        open_tag = open_tag_str

        # Empty element -> self-closing
        if @children.empty? && @content.nil?
          return "#{pad}<#{open_tag}/>"
        end

        # Text-content element -> single line
        if @children.empty?
          body = @raw ? @content.to_s : Helpers.escape(@content)
          return "#{pad}<#{open_tag}>#{body}</#{@name}>"
        end

        # Container element -> children indented (content, if any, is ignored)
        if pretty
          inner = @children.map { |c| c.render(level + 1, pretty) }.join("\n")
          "#{pad}<#{open_tag}>\n#{inner}\n#{pad}</#{@name}>"
        else
          inner = @children.map { |c| c.render(level + 1, pretty) }.join
          "<#{open_tag}>#{inner}</#{@name}>"
        end
      end

      private

      def apply_attrs(attrs)
        attrs.each do |key, value|
          next if value.nil?

          @attributes[Helpers.to_camel(key)] = Helpers.attr_value(value)
        end
      end

      def open_tag_str
        parts = [@name]
        @attributes.each do |key, value|
          parts << %(#{key}="#{Helpers.escape_attr(value)}")
        end
        parts.join(" ")
      end
    end

    # --- Leaf / content elements ---------------------------------------------

    # <Speak> text-to-speech. Pass `ssml:` to inject raw SSML unescaped.
    class Speak < Element
      def initialize(content = nil, ssml: nil, **attrs)
        if ssml.nil?
          super("Speak", content: content, **attrs)
        else
          super("Speak", content: ssml, raw: true, **attrs)
        end
      end
    end

    # <Play> a remote MP3/WAV URL (text content).
    class Play < Element
      def initialize(url = nil, **attrs)
        super("Play", content: url, **attrs)
      end
    end

    # <Wait/> silent pause (self-closing).
    class Wait < Element
      def initialize(**attrs)
        super("Wait", **attrs)
      end
    end

    # <Number> a PSTN number to dial (nested in <Dial>).
    class Number < Element
      def initialize(number = nil, **attrs)
        super("Number", content: number, **attrs)
      end
    end

    # <User> a SIP endpoint to dial (nested in <Dial>).
    class User < Element
      def initialize(sip_uri = nil, **attrs)
        super("User", content: sip_uri, **attrs)
      end
    end

    # <Record/> record the call/leg (self-closing; `action` required).
    class Record < Element
      def initialize(**attrs)
        super("Record", **attrs)
      end
    end

    # <Conference> join a room (room name is the text content).
    class Conference < Element
      def initialize(room = nil, **attrs)
        super("Conference", content: room, **attrs)
      end
    end

    # <DTMF> send digits on a live call (digits are the text content).
    class DTMF < Element
      def initialize(digits = nil, **attrs)
        super("DTMF", content: digits, **attrs)
      end
    end

    # <Redirect> transfer flow control to a URL (text content).
    class Redirect < Element
      def initialize(url = nil, **attrs)
        super("Redirect", content: url, **attrs)
      end
    end

    # <Hangup/> end/reject the call (self-closing).
    class Hangup < Element
      def initialize(**attrs)
        super("Hangup", **attrs)
      end
    end

    # <Stream> fork audio to a WebSocket (wss URL is the text content).
    class Stream < Element
      def initialize(url = nil, **attrs)
        super("Stream", content: url, **attrs)
      end
    end

    # --- Mixin for the containers that hold Speak/Play prompts ----------------

    module SpeakPlayHelpers
      def add_speak(content = nil, ssml: nil, **attrs)
        add(Speak.new(content, ssml: ssml, **attrs))
      end

      def add_play(url = nil, **attrs)
        add(Play.new(url, **attrs))
      end
    end

    # --- Container elements ---------------------------------------------------

    # <Gather> collect DTMF/speech input. Nest Speak/Play prompts inside.
    class Gather < Element
      include SpeakPlayHelpers

      def initialize(**attrs)
        super("Gather", **attrs)
      end
    end

    # <PreAnswer> early-media block. Nest Speak/Play/Wait inside.
    class PreAnswer < Element
      include SpeakPlayHelpers

      def initialize(**attrs)
        super("PreAnswer", **attrs)
      end

      def add_wait(**attrs)
        add(Wait.new(**attrs))
      end
    end

    # <Dial> bridge the caller to Number/User endpoints; may nest Record.
    class Dial < Element
      def initialize(number = nil, **attrs)
        super("Dial", content: number, **attrs)
      end

      def add_number(number = nil, **attrs)
        add(Number.new(number, **attrs))
      end

      def add_user(sip_uri = nil, **attrs)
        add(User.new(sip_uri, **attrs))
      end

      def add_record(**attrs)
        add(Record.new(**attrs))
      end
    end

    # <Response> root container. Use the `add_*` helpers to build the document.
    class Response < Element
      include SpeakPlayHelpers

      def initialize(**attrs)
        super("Response", **attrs)
      end

      def add_wait(**attrs)
        add(Wait.new(**attrs))
      end

      def add_gather(**attrs)
        add(Gather.new(**attrs))
      end

      # Plivo-parity aliases: GetDigits/GetInput both emit <Gather>.
      alias add_get_digits add_gather
      alias add_get_input add_gather

      def add_dial(number = nil, **attrs)
        add(Dial.new(number, **attrs))
      end

      def add_record(**attrs)
        add(Record.new(**attrs))
      end

      def add_conference(room = nil, **attrs)
        add(Conference.new(room, **attrs))
      end

      def add_dtmf(digits = nil, **attrs)
        add(DTMF.new(digits, **attrs))
      end

      def add_redirect(url = nil, **attrs)
        add(Redirect.new(url, **attrs))
      end

      def add_hangup(**attrs)
        add(Hangup.new(**attrs))
      end

      def add_preanswer(**attrs)
        add(PreAnswer.new(**attrs))
      end

      def add_stream(url = nil, **attrs)
        add(Stream.new(url, **attrs))
      end
    end
  end
end
