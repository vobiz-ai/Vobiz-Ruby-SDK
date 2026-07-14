# frozen_string_literal: true

module Vobiz
  module Conferences
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve conference room names reported by the API. An empty array is inconclusive and can occur while
      # conferences are active. Maintain your own room registry for authoritative discovery, billing, cleanup, and
      # destructive workflows.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Vobiz::Conferences::Types::ListConferencesResponse]
      def list_conferences(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Conference/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Conferences::Types::ListConferencesResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Terminate all active conference rooms.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [untyped]
      def delete_all_conferences(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Conference/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Retrieve a specific conference room. A live conference can currently return a 200 response with an error payload
      # instead of conference details.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :conference_name
      #
      # @return [Vobiz::Conferences::Types::GetConferenceResponse]
      def get_conference(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Conference/#{URI.encode_uri_component(params[:conference_name].to_s)}/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Conferences::Types::GetConferenceResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Terminate a specific conference room and disconnect all members.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :conference_name
      #
      # @return [untyped]
      def delete_conference(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Conference/#{URI.encode_uri_component(params[:conference_name].to_s)}/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end
    end
  end
end
