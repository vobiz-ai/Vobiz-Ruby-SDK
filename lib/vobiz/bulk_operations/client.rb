# frozen_string_literal: true

module Vobiz
  module BulkOperations
    class Client
      # @param client [Vobiz::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Queue a bulk export of the recordings matching your filter criteria. The request is
      # validated and accepted for background processing, and the resulting archive is emailed
      # as a download link to every address in `recipient.customer_account`. The archive is
      # typically available within 15-60 minutes depending on volume.
      #
      # Results are delivered by email only; the export runs to completion in the background
      # after the `202` response.
      #
      # One export runs at a time per account. While an export is in progress, further requests
      # return `403`.
      #
      # Filter rules:
      # - Use either `from`/`to` or the `recording_storage_duration*` filters, not both.
      # - Use one of `__gt` or `__gte`, and one of `__lt` or `__lte`.
      # - When using range filters (`__gte`/`__lte`), provide both.
      # - Maximum date range is 1 year (366 days); maximum storage duration range is 30 days.
      # - The additional filters (`from_number`, `to_number`, `call_uuid`, `conference_name`,
      #   `recording_format`, `recording_id`) apply when the range is 30 days or less.
      #
      # @param request_options [Hash]
      # @param params [Vobiz::BulkOperations::Types::BulkExportRecordingsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :auth_id
      #
      # @return [Vobiz::BulkOperations::Types::BulkExportRecordingsResponse]
      def bulk_export_recordings(request_options: {}, **params)
        params = Vobiz::Internal::Types::Utils.normalize_keys(params)
        request_data = Vobiz::BulkOperations::Types::BulkExportRecordingsRequest.new(params).to_h
        non_body_param_names = %w[auth_id]
        body = request_data.except(*non_body_param_names)

        request = Vobiz::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "api/v1/Account/#{URI.encode_uri_component(params[:auth_id].to_s)}/export/recording/",
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
          Vobiz::BulkOperations::Types::BulkExportRecordingsResponse.load(response.body)
        else
          error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
