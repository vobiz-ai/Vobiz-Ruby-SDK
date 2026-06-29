# frozen_string_literal: true

module Vobiz
  module Endpoints
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a paginated list of all SIP endpoints in your account.
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
      # @option params [String, nil] :username_contains
      # @option params [String, nil] :username_exact
      # @option params [String, nil] :username_startswith
      # @option params [String, nil] :alias_contains
      # @option params [String, nil] :alias_exact
      # @option params [Integer, nil] :application_id_exact
      # @option params [Boolean, nil] :application_id_isnull
      # @option params [String, nil] :sub_account
      #
      # @return [Vobiz::Endpoints::Types::ListEndpointsResponse]
      def list_endpoints(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["offset"] = params[:offset] if params.key?(:offset)
        query_params["username__contains"] = params[:username_contains] if params.key?(:username_contains)
        query_params["username__exact"] = params[:username_exact] if params.key?(:username_exact)
        query_params["username__startswith"] = params[:username_startswith] if params.key?(:username_startswith)
        query_params["alias__contains"] = params[:alias_contains] if params.key?(:alias_contains)
        query_params["alias__exact"] = params[:alias_exact] if params.key?(:alias_exact)
        query_params["application_id__exact"] = params[:application_id_exact] if params.key?(:application_id_exact)
        query_params["application_id__isnull"] = params[:application_id_isnull] if params.key?(:application_id_isnull)
        query_params["sub_account"] = params[:sub_account] if params.key?(:sub_account)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Endpoint/",
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
          Vobiz::Endpoints::Types::ListEndpointsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Create a new SIP endpoint that can be used to make and receive calls
      # through IP phones, softphones, or SIP clients. Each endpoint is
      # assigned a unique SIP URI and endpoint ID.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::Endpoints::Types::CreateEndpointRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Vobiz::Endpoints::Types::CreateEndpointResponse]
      def create_endpoint(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::Endpoints::Types::CreateEndpointRequest.new(params).to_h
        non_body_param_names = %w[auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Endpoint/",
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
          Vobiz::Endpoints::Types::CreateEndpointResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve the details of an existing endpoint. The response includes
      # all endpoint attributes and, if the endpoint is currently registered
      # on a SIP client, additional registration details.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :endpoint_id
      #
      # @return [Vobiz::Endpoints::Types::RetrieveEndpointResponse]
      def retrieve_endpoint(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Endpoint/#{URI.encode_uri_component(params[:endpoint_id].to_s)}/",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Endpoints::Types::RetrieveEndpointResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Update an existing endpoint's configuration. You can change the
      # password, alias, or attached application. The fields `username`,
      # `endpoint_id`, `domain`, `allow_same_domain`, `allow_other_domains`,
      # `allow_phones`, and `allow_apps` are locked after creation.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::Endpoints::Types::UpdateEndpointRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :endpoint_id
      #
      # @return [String]
      def update_endpoint(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::Endpoints::Types::UpdateEndpointRequest.new(params).to_h
        non_body_param_names = %w[auth_id endpoint_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Endpoint/#{URI.encode_uri_component(params[:endpoint_id].to_s)}/",
          body: body,
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

      # Permanently delete an endpoint from your Vobiz account. Once deleted,
      # the SIP URI will no longer be accessible, and any devices registered
      # with this endpoint will be disconnected.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :endpoint_id
      #
      # @return [String, nil]
      def delete_endpoint(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/Endpoint/#{URI.encode_uri_component(params[:endpoint_id].to_s)}/",
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
