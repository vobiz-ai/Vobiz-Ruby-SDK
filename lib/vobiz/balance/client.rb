# frozen_string_literal: true

module Vobiz
  module Balance
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve the current account balance for a specific currency.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [String] :currency
      #
      # @return [Vobiz::Balance::Types::GetBalanceResponse]
      def get_balance(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/balance/#{URI.encode_uri_component(params[:currency].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Balance::Types::GetBalanceResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieve paginated transaction history for the account, ordered by
      # `created_at` descending. Filter to a single day by setting `from_date`
      # and `to_date` to the same date - a bare `YYYY-MM-DD` in `to_date` is
      # expanded to `23:59:59`, so both bounds are inclusive. Bare dates resolve
      # in the server timezone (UTC); send an explicit offset such as
      # `2026-08-28T00:00:00+05:30` to pin a local calendar day.
      #
      # `limit` and `offset` are not supported - unknown parameters are silently
      # dropped. `total` and `summary` are computed over the whole filtered set
      # and ignore pagination, so `per_page=1` returns full-window totals.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :per_page
      # @option params [String, nil] :from_date
      # @option params [String, nil] :to_date
      # @option params [String, nil] :type
      # @option params [Vobiz::Balance::Types::ListTransactionsRequestStatus, nil] :status
      # @option params [String, nil] :currency
      # @option params [String, nil] :reference_type
      # @option params [String, nil] :description
      # @option params [String, nil] :reference
      # @option params [String, nil] :transaction_id
      #
      # @return [Vobiz::Balance::Types::ListTransactionsResponse]
      def list_transactions(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["per_page"] = params[:per_page] if params.key?(:per_page)
        query_params["from_date"] = params[:from_date] if params.key?(:from_date)
        query_params["to_date"] = params[:to_date] if params.key?(:to_date)
        query_params["type"] = params[:type] if params.key?(:type)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["currency"] = params[:currency] if params.key?(:currency)
        query_params["reference_type"] = params[:reference_type] if params.key?(:reference_type)
        query_params["description"] = params[:description] if params.key?(:description)
        query_params["reference"] = params[:reference] if params.key?(:reference)
        query_params["transaction_id"] = params[:transaction_id] if params.key?(:transaction_id)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/transactions",
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
          Vobiz::Balance::Types::ListTransactionsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the distinct `reference_type` values present on the account's ledger. Use it to discover valid values
      # for the `reference_type` filter on the transactions endpoint.
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
      # @return [Vobiz::Balance::Types::ListTransactionReferenceTypesResponse]
      def list_transaction_reference_types(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/transactions/reference-types",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vobiz::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vobiz::Balance::Types::ListTransactionReferenceTypesResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
