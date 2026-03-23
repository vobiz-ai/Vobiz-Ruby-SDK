require 'cgi'
require 'json'
require_relative 'request'
require_relative '../version'

module Vobiz
  module SDK
    class Client
      attr_reader :base_url, :legacy_base_url,
                  :calls, :recordings, :conferences, :cdr,
                  :numbers, :endpoints, :applications,
                  :trunks, :credentials, :ip_acl, :origination_uris,
                  :account, :subaccounts, :balance, :messages

      def initialize(auth_id = ENV['VOBIZ_AUTH_ID'], auth_token = ENV['VOBIZ_AUTH_TOKEN'], options = {})
        raise ArgumentError, 'Vobiz: authId is required (or set VOBIZ_AUTH_ID)' if auth_id.to_s.empty?
        raise ArgumentError, 'Vobiz: authToken is required (or set VOBIZ_AUTH_TOKEN)' if auth_token.to_s.empty?

        @auth_id = auth_id
        @base_url = options[:url] || "https://api.vobiz.ai/api/v1/account/#{auth_id}"
        @legacy_base_url = options[:legacy_url] || "https://api.vobiz.ai/api/v1/Account/#{auth_id}"
        @debug = options[:debug] || false

        @modern_request = Request.new(
          auth_id: auth_id,
          auth_token: auth_token,
          user_agent: "vobiz-ruby/#{Vobiz::VERSION} (Ruby: #{RUBY_VERSION})",
          timeout: options[:timeout] || 30,
          proxy: options[:proxy]
        )

        @legacy_request = Request.new(
          auth_id: auth_id,
          auth_token: auth_token,
          user_agent: "vobiz-ruby/#{Vobiz::VERSION} (Ruby: #{RUBY_VERSION})",
          timeout: options[:voice_timeout] || 10,
          proxy: options[:proxy]
        )

        @calls = Calls.new(self)
        @recordings = Recordings.new(self)
        @conferences = Conferences.new(self)
        @cdr = Cdr.new(self)

        @numbers = Numbers.new(self)
        @endpoints = Endpoints.new(self)
        @applications = Applications.new(self)
        @messages = Messages.new(self)

        @trunks = Trunks.new(self)
        @credentials = Credentials.new(self)
        @ip_acl = IpAcl.new(self)
        @origination_uris = OriginationUris.new(self)

        @account = Account.new(self)
        @subaccounts = Subaccounts.new(self)
        @balance = Balance.new(self)
      end

      def request(method, action, params = {}, base: :modern, override_url: nil)
        req = base == :legacy ? @legacy_request : @modern_request
        root = base == :legacy ? legacy_base_url : base_url
        url = override_url || join_url(root, action)
        req.call(method, url, params: normalize_params(params), debug: @debug)
      end

      def to_json(*args)
        JSON.generate(args.first || {})
      end

      private

      KEEP_DOUBLE_UNDERSCORE = %w[
        message_time__lt message_time__lte message_time__gt message_time__gte
        end_time__gt end_time__gte end_time__lt end_time__lte
        bill_duration__gt bill_duration__gte bill_duration__lt bill_duration__lte
        add_time__gt add_time__gte add_time__lt add_time__lte
        created__gte created__gt created__lte created__lt
        renewal_date__gte renewal_date__gt renewal_date__lte renewal_date__lt
        recording_storage_duration__gt recording_storage_duration__gte
        recording_storage_duration__lt recording_storage_duration__lte
      ].freeze

      def normalize_params(value)
        case value
        when Array
          value.map { |item| normalize_params(item) }
        when Hash
          value.each_with_object({}) do |(k, v), acc|
            key = k.to_s
            acc[snakeize(key)] = normalize_params(v)
          end
        else
          value
        end
      end

      def snakeize(key)
        return key if KEEP_DOUBLE_UNDERSCORE.include?(key)

        out = key
              .gsub(/([A-Z])/, '_\\1')
              .downcase
              .sub(/^_/, '')
              .gsub('_less_than', '__lt')
              .gsub('_greater_than', '__gt')
              .gsub('_greater_or_equal', '__gte')
              .gsub('_less_or_equal', '__lte')
              .gsub('_equal', '')
              .gsub('_equals', '')
              .gsub('priority_1', 'priority1')
              .gsub('priority_2', 'priority2')
              .gsub('priority_3', 'priority3')
              .gsub('sample_1', 'sample1')
              .gsub('sample_2', 'sample2')
              .gsub('country_iso_2', 'country_iso2')
        out
      end

      def join_url(root, action)
        return root if action.nil? || action.to_s.empty?

        "#{root.to_s.sub(%r{/+$}, '')}/#{action.to_s.sub(%r{^/+}, '')}"
      end
    end

    class Resource
      def initialize(client)
        @client = client
      end
    end

    class Account < Resource
      def get
        get_profile
      end

      def get_profile
        root_url = @client.base_url.sub(%r{/account/[^/]+$}, '')
        @client.request(:get, 'auth/me', {}, override_url: "#{root_url}/auth/me")
      end

      def get_transactions(params = {})
        @client.request(:get, 'transactions', params)
      end

      def get_balance(currency)
        raise ArgumentError, 'currency is required' if currency.to_s.empty?

        @client.request(:get, "balance/#{currency}")
      end

      def get_concurrency
        @client.request(:get, 'concurrency')
      end
    end

    class Balance < Resource
      def get(currency = 'INR')
        @client.request(:get, "balance/#{currency}")
      end

      def list_transactions(params = {})
        @client.request(:get, 'transactions', params)
      end

      def get_concurrency
        @client.request(:get, 'concurrency')
      end
    end

    class Cdr < Resource
      def get(params = {})
        @client.request(:get, 'cdr', params)
      end

      def list(params = {})
        get(params)
      end
    end

    class Trunks < Resource
      def create(params = {})
        @client.request(:post, 'trunks', params)
      end

      def get(id)
        @client.request(:get, "trunks/#{id}")
      end

      def list(params = {})
        @client.request(:get, 'trunks', params)
      end

      def update(id, params = {})
        @client.request(:put, "trunks/#{id}", params)
      end

      def delete(id)
        @client.request(:delete, "trunks/#{id}")
      end
    end

    class Credentials < Resource
      def create(params = {})
        @client.request(:post, 'credentials', params)
      end

      def list(params = {})
        @client.request(:get, 'trunks/credentials', params)
      end

      def get(id)
        @client.request(:get, "credentials/#{id}")
      end

      def update(id, params = {})
        @client.request(:put, "credentials/#{id}", params)
      end

      def delete(id)
        @client.request(:delete, "credentials/#{id}")
      end
    end

    class IpAcl < Resource
      def create(params = {})
        @client.request(:post, 'ip-acl', params)
      end

      def list(params = {})
        @client.request(:get, 'trunks/ip-acl', params)
      end

      def get(id)
        @client.request(:get, "ip-acl/#{id}")
      end

      def update(id, params = {})
        @client.request(:put, "ip-acl/#{id}", params)
      end

      def delete(id)
        @client.request(:delete, "ip-acl/#{id}")
      end
    end

    class OriginationUris < Resource
      def create(params = {})
        @client.request(:post, 'origination-uris', params)
      end

      def list(params = {})
        @client.request(:get, 'trunks/origination-uris', params)
      end

      def get(id)
        @client.request(:get, "origination-uris/#{id}")
      end

      def update(id, params = {})
        @client.request(:put, "origination-uris/#{id}", params)
      end

      def delete(id)
        @client.request(:delete, "origination-uris/#{id}")
      end
    end

    class Numbers < Resource
      def list(params = {})
        @client.request(:get, 'numbers', params)
      end

      def list_inventory(params = {})
        @client.request(:get, 'inventory/numbers', params)
      end

      def purchase_from_inventory(e164, currency = 'INR')
        @client.request(:post, 'numbers/purchase-from-inventory', { e164: e164, currency: currency })
      end

      def buy(number, app_id = nil, cnam_lookup = nil, ha_enable = nil)
        payload = {}
        payload[:app_id] = app_id if app_id
        payload[:cnam_lookup] = cnam_lookup unless cnam_lookup.nil?
        payload[:ha_enable] = ha_enable unless ha_enable.nil?
        @client.request(:post, "PhoneNumber/#{number}/", payload, base: :legacy)
      end

      def get(number)
        @client.request(:get, "Number/#{number}/", {}, base: :legacy)
      end

      def add_own_number(numbers, carrier, region, optional_params = {})
        payload = optional_params.merge(numbers: numbers, carrier: carrier, region: region)
        @client.request(:post, 'Number/', payload, base: :legacy)
      end

      def search(country_iso, optional_params = {})
        list_inventory(optional_params.merge(country: country_iso))
      end

      def update(number, params = {})
        payload = params.dup
        payload[:subaccount] = payload.delete(:sub_account) if payload.key?(:sub_account)
        payload[:subaccount] = payload.delete(:subAccount) if payload.key?(:subAccount)
        @client.request(:post, "Number/#{number}/", payload, base: :legacy)
      end

      def unrent(number)
        @client.request(:delete, "numbers/#{CGI.escape(number)}")
      end

      def link_application(number, application_id)
        @client.request(:post, "numbers/#{CGI.escape(number)}/application", { application_id: application_id })
      end

      def unlink_application(number)
        @client.request(:delete, "numbers/#{CGI.escape(number)}/application")
      end

      def assign(number, trunk_id)
        @client.request(:post, "numbers/#{CGI.escape(number)}/assign", { trunk_group_id: trunk_id })
      end

      def unassign(number)
        @client.request(:delete, "numbers/#{CGI.escape(number)}/assign")
      end
    end

    class Subaccounts < Resource
      def list(params = {})
        @client.request(:get, 'sub-accounts/', params, override_url: subaccounts_url)
      end

      def get(id)
        @client.request(:get, "sub-accounts/#{id}", {}, override_url: subaccounts_url(id))
      end

      def create(params = {})
        @client.request(:post, 'sub-accounts/', params, override_url: subaccounts_url)
      end

      def update(id, params = {})
        @client.request(:put, "sub-accounts/#{id}", params, override_url: subaccounts_url(id))
      end

      def delete(id)
        @client.request(:delete, "sub-accounts/#{id}", {}, override_url: subaccounts_url(id))
      end

      private

      def subaccounts_url(id = nil)
        base = @client.base_url.sub('/api/v1/account/', '/api/v1/accounts/')
        id ? "#{base}/sub-accounts/#{id}" : "#{base}/sub-accounts/"
      end
    end

    class Calls < Resource
      ACTION = 'Call'.freeze

      def create(from, to, answer_url, options = {})
        payload = options.merge(from: from, to: to, answer_url: answer_url)
        @client.request(:post, "#{ACTION}/", payload, base: :legacy)
      end

      def get(call_uuid)
        @client.request(:get, "#{ACTION}/#{call_uuid}/", {}, base: :legacy)
      end

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def list_live_calls
        list(status: 'live')
      end

      def list_queued_calls
        list(status: 'queued')
      end

      def get_live_call(call_uuid)
        @client.request(:get, "#{ACTION}/#{call_uuid}/", { status: 'live' }, base: :legacy)
      end

      def get_queued_call(call_uuid)
        @client.request(:get, "#{ACTION}/#{call_uuid}/", { status: 'queued' }, base: :legacy)
      end

      def cancel(request_uuid)
        @client.request(:delete, "#{ACTION}/#{request_uuid}/", { status: 'queued' }, base: :legacy)
      end

      def hangup(call_uuid)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/", {}, base: :legacy)
      end

      def transfer(call_uuid, params = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/", params, base: :legacy)
      end

      def record(call_uuid, params = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/Record/", params, base: :legacy)
      end

      def stop_recording(call_uuid)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/Record/", {}, base: :legacy)
      end

      def play_music(call_uuid, urls, options = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/Play/", options.merge(urls: urls), base: :legacy)
      end

      def stop_playing_music(call_uuid)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/Play/", {}, base: :legacy)
      end

      def speak_text(call_uuid, text, options = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/Speak/", options.merge(text: text), base: :legacy)
      end

      def stop_speaking_text(call_uuid)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/Speak/", {}, base: :legacy)
      end

      def send_digits(call_uuid, digits, options = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/DTMF/", options.merge(digits: digits), base: :legacy)
      end

      def stream(call_uuid, stream_url, options = {})
        @client.request(:post, "#{ACTION}/#{call_uuid}/Stream/", options.merge(service_url: stream_url), base: :legacy)
      end

      def stop_stream(call_uuid, stream_id)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/Stream/#{stream_id}/", {}, base: :legacy)
      end

      def stop_all_stream(call_uuid)
        @client.request(:delete, "#{ACTION}/#{call_uuid}/Stream/", {}, base: :legacy)
      end

      def get_stream(call_uuid, stream_id)
        @client.request(:get, "#{ACTION}/#{call_uuid}/Stream/#{stream_id}/", {}, base: :legacy)
      end

      def get_all_stream(call_uuid)
        @client.request(:get, "#{ACTION}/#{call_uuid}/Stream/", {}, base: :legacy)
      end
    end

    class Recordings < Resource
      ACTION = 'Recording'.freeze

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def get(recording_id)
        @client.request(:get, "#{ACTION}/#{recording_id}/", {}, base: :legacy)
      end

      def delete(recording_id)
        @client.request(:delete, "#{ACTION}/#{recording_id}/", {}, base: :legacy)
      end

      def export(params = {})
        @client.request(:post, 'export/recording/', params, base: :legacy)
      end

      def bulk_delete(params = {})
        @client.request(:delete, 'Recording/BulkDelete/', params, base: :legacy)
      end
    end

    class Conferences < Resource
      ACTION = 'Conference'.freeze

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def get(conference_name, params = {})
        @client.request(:get, "#{ACTION}/#{conference_name}/", params, base: :legacy)
      end

      def hangup(conference_name)
        @client.request(:delete, "#{ACTION}/#{conference_name}/", {}, base: :legacy)
      end

      def hangup_all
        @client.request(:delete, "#{ACTION}/", {}, base: :legacy)
      end

      def hangup_member(conference_name, member_id)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Member/#{member_id}/", {}, base: :legacy)
      end

      def mute_member(conference_name, member_id)
        @client.request(:post, "#{ACTION}/#{conference_name}/Member/#{member_id}/Mute/", {}, base: :legacy)
      end

      def unmute_member(conference_name, member_id)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Member/#{member_id}/Mute/", {}, base: :legacy)
      end

      def kick_member(conference_name, member_id)
        @client.request(:post, "#{ACTION}/#{conference_name}/Member/#{member_id}/Kick/", {}, base: :legacy)
      end

      def deaf_member(conference_name, member_id)
        @client.request(:post, "#{ACTION}/#{conference_name}/Member/#{member_id}/Deaf/", {}, base: :legacy)
      end

      def undeaf_member(conference_name, member_id)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Member/#{member_id}/Deaf/", {}, base: :legacy)
      end

      def play_audio_to_member(conference_name, member_id, url)
        @client.request(:post, "#{ACTION}/#{conference_name}/Member/#{member_id}/Play/", { url: url }, base: :legacy)
      end

      def stop_playing_audio_to_member(conference_name, member_id)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Member/#{member_id}/Play/", {}, base: :legacy)
      end

      def speak_text_to_member(conference_name, member_id, text, options = {})
        @client.request(:post, "#{ACTION}/#{conference_name}/Member/#{member_id}/Speak/", options.merge(text: text), base: :legacy)
      end

      def stop_speaking_text_to_member(conference_name, member_id)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Member/#{member_id}/Speak/", {}, base: :legacy)
      end

      def record(conference_name, params = {})
        start_recording(conference_name, params)
      end

      def start_recording(conference_name, params = {})
        @client.request(:post, "#{ACTION}/#{conference_name}/Record/", params, base: :legacy)
      end

      def stop_recording(conference_name)
        @client.request(:delete, "#{ACTION}/#{conference_name}/Record/", {}, base: :legacy)
      end
    end

    class Applications < Resource
      ACTION = 'Application'.freeze

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def get(id)
        @client.request(:get, "#{ACTION}/#{id}/", {}, base: :legacy)
      end

      def create(app_name, params = {})
        @client.request(:post, "#{ACTION}/", params.merge(app_name: app_name), base: :legacy)
      end

      def update(id, params = {})
        @client.request(:post, "#{ACTION}/#{id}/", params, base: :legacy)
      end

      def delete(id, params = {})
        @client.request(:delete, "#{ACTION}/#{id}/", params, base: :legacy)
      end
    end

    class Endpoints < Resource
      ACTION = 'Endpoint'.freeze

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def get(id)
        @client.request(:get, "#{ACTION}/#{id}/", {}, base: :legacy)
      end

      def create(username, password, alias_name, app_id = nil)
        payload = { username: username, password: password, alias: alias_name }
        payload[:app_id] = app_id if app_id
        @client.request(:post, "#{ACTION}/", payload, base: :legacy)
      end

      def update(id, params = {})
        @client.request(:post, "#{ACTION}/#{id}/", params, base: :legacy)
      end

      def delete(id)
        @client.request(:delete, "#{ACTION}/#{id}/", {}, base: :legacy)
      end
    end

    class Messages < Resource
      ACTION = 'Message'.freeze

      def send(src, dst, text, optional_params = {})
        create(src, dst, text, optional_params)
      end

      def create(src = nil, dst = nil, text = nil, optional_params = {}, powerpack_uuid = nil)
        if src.is_a?(Hash)
          payload = src.dup
          payload[:dst] = Array(payload[:dst]).join('<') if payload[:dst].is_a?(Array)
          return @client.request(:post, "#{ACTION}/", payload, base: :legacy)
        end

        params = optional_params.dup
        params[:src] = src if src
        params[:dst] = dst.is_a?(Array) ? dst.join('<') : dst
        params[:text] = text
        params[:powerpack_uuid] = powerpack_uuid if powerpack_uuid
        @client.request(:post, "#{ACTION}/", params, base: :legacy)
      end

      def get(id)
        @client.request(:get, "#{ACTION}/#{id}/", {}, base: :legacy)
      end

      def list(params = {})
        @client.request(:get, "#{ACTION}/", params, base: :legacy)
      end

      def list_media(message_uuid)
        @client.request(:get, "#{ACTION}/#{message_uuid}/Media/", {}, base: :legacy)
      end
    end
  end
end
