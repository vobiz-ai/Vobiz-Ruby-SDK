# frozen_string_literal: true

module Vobiz
  module Applications
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Get details of all applications created under your Vobiz account.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [Integer, nil] :limit
      # @option params [Integer, nil] :offset
      #
      # @return [Vobiz::Applications::Types::ListApplicationsResponse]
      def list_applications(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Application/",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Applications::Types::ListApplicationsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates an Application with webhook URLs for call handling.
      # Creating an application is usually a first step, after which you
      # attach the application to either a number or an endpoint.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::Applications::Types::CreateApplicationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Vobiz::Applications::Types::CreateApplicationResponse]
      def create_application(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::Applications::Types::CreateApplicationRequest.new(params).to_h
        non_body_param_names = %w[auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Application/",
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
          Vobiz::Applications::Types::CreateApplicationResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Get details of a particular application by passing the app_id.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :app_id
      #
      # @return [Vobiz::Applications::Types::RetrieveApplicationResponse]
      def retrieve_application(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Application/#{URI.encode_uri_component(params[:app_id].to_s)}/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Applications::Types::RetrieveApplicationResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Modify an application using this API. You can update any subset of
      # fields (partial update). Fields not provided will remain unchanged.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::Applications::Types::UpdateApplicationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :app_id
      #
      # @return [Vobiz::Applications::Types::UpdateApplicationResponse]
      def update_application(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::Applications::Types::UpdateApplicationRequest.new(params).to_h
        non_body_param_names = %w[auth_id app_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Application/#{URI.encode_uri_component(params[:app_id].to_s)}/",
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
          Vobiz::Applications::Types::UpdateApplicationResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Permanently delete an Application. If the application is associated
      # with phone numbers, the deletion may be blocked unless those
      # associations are removed first.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :app_id
      #
      # @return [String, nil]
      def delete_application(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Application/#{URI.encode_uri_component(params[:app_id].to_s)}/",
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
