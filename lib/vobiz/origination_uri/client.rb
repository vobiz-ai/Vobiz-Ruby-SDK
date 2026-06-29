# frozen_string_literal: true

module Vobiz
  module OriginationURI
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Add an inbound SIP endpoint (origination URI) to a trunk.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::OriginationURI::Types::CreateOriginationURIRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Vobiz::OriginationURI::Types::CreateOriginationURIResponse]
      def create_origination_uri(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::OriginationURI::Types::CreateOriginationURIRequest.new(params).to_h
        non_body_param_names = %w[auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/origination-uris",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::OriginationURI::Types::CreateOriginationURIResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve all origination URIs on the account.
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
      # @return [Vobiz::OriginationURI::Types::ListOriginationURIsResponse]
      def list_origination_uris(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/trunks/origination-uris",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::OriginationURI::Types::ListOriginationURIsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update an existing origination URI.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::OriginationURI::Types::UpdateOriginationURIRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :uri_id
      #
      # @return [Vobiz::OriginationURI::Types::UpdateOriginationURIResponse]
      def update_origination_uri(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::OriginationURI::Types::UpdateOriginationURIRequest.new(params).to_h
        non_body_param_names = %w[auth_id uri_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/origination-uris/#{URI.encode_uri_component(params[:uri_id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::OriginationURI::Types::UpdateOriginationURIResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Delete an origination URI from a trunk.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :uri_id
      #
      # @return [String, nil]
      def delete_origination_uri(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/origination-uris/#{URI.encode_uri_component(params[:uri_id].to_s)}",
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
