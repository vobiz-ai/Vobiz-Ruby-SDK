# frozen_string_literal: true

module Vobiz
  module Cdr
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns all CDRs for your account. Supports filtering by phone numbers,
      # date range, call direction, duration, and pagination.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String, nil] :from_number
      # @option params [String, nil] :to_number
      # @option params [String, nil] :start_date
      # @option params [String, nil] :end_date
      # @option params [Vobiz::Cdr::Types::ListCdrsRequestCallDirection, nil] :call_direction
      # @option params [Integer, nil] :min_duration
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::Cdr::Types::ListCdrsResponse]
      def list_cdrs(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from_number"] = params[:from_number] if params.key?(:from_number)
        query_params["to_number"] = params[:to_number] if params.key?(:to_number)
        query_params["start_date"] = params[:start_date] if params.key?(:start_date)
        query_params["end_date"] = params[:end_date] if params.key?(:end_date)
        query_params["call_direction"] = params[:call_direction] if params.key?(:call_direction)
        query_params["min_duration"] = params[:min_duration] if params.key?(:min_duration)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/cdr",
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
          Vobiz::Cdr::Types::ListCdrsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Identical filters to the list endpoint, but the response also includes a
      # `filter_summary` object describing the active filters applied.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String, nil] :from_number
      # @option params [String, nil] :to_number
      # @option params [String, nil] :start_date
      # @option params [String, nil] :end_date
      # @option params [Vobiz::Cdr::Types::SearchCdrsRequestCallDirection, nil] :call_direction
      # @option params [Integer, nil] :min_duration
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      #
      # @return [Vobiz::Cdr::Types::SearchCdrsResponse]
      def search_cdrs(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from_number"] = params[:from_number] if params.key?(:from_number)
        query_params["to_number"] = params[:to_number] if params.key?(:to_number)
        query_params["start_date"] = params[:start_date] if params.key?(:start_date)
        query_params["end_date"] = params[:end_date] if params.key?(:end_date)
        query_params["call_direction"] = params[:call_direction] if params.key?(:call_direction)
        query_params["min_duration"] = params[:min_duration] if params.key?(:min_duration)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/cdr/search",
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
          Vobiz::Cdr::Types::SearchCdrsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the most recent CDRs for your account without requiring a date range.
      # Default 20 records; use `limit` to retrieve more.
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
      #
      # @return [Vobiz::Cdr::Types::ListRecentCdrsResponse]
      def list_recent_cdrs(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/cdr/recent",
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
          Vobiz::Cdr::Types::ListRecentCdrsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns CDR data as a downloadable CSV file. Same filters as the list endpoint.
      #
      # **Note:** Do NOT send `Accept: application/json` on this endpoint - the response is `text/csv`.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String, nil] :from_number
      # @option params [String, nil] :to_number
      # @option params [String, nil] :start_date
      # @option params [String, nil] :end_date
      # @option params [Vobiz::Cdr::Types::ExportCdrsRequestCallDirection, nil] :call_direction
      # @option params [Integer, nil] :min_duration
      #
      # @return [untyped]
      def export_cdrs(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["from_number"] = params[:from_number] if params.key?(:from_number)
        query_params["to_number"] = params[:to_number] if params.key?(:to_number)
        query_params["start_date"] = params[:start_date] if params.key?(:start_date)
        query_params["end_date"] = params[:end_date] if params.key?(:end_date)
        query_params["call_direction"] = params[:call_direction] if params.key?(:call_direction)
        query_params["min_duration"] = params[:min_duration] if params.key?(:min_duration)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/cdr/export",
          query: query_params,
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

      # Retrieve the CDR for a specific completed call using its `call_id`.
      # Useful when you have a `call_id` from a callback or previous API response.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :call_id
      #
      # @return [Vobiz::Cdr::Types::GetCdrResponse]
      def get_cdr(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/cdr/#{URI.encode_uri_component(params[:call_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Cdr::Types::GetCdrResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
