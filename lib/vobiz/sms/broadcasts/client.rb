# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns the broadcasts on your account, newest first, each with freshly counted `stats`. The response wraps
        # the page in `broadcasts` and gives the account-wide count in `total`, so you can page with `limit` and
        # `offset` until `offset` reaches `total`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :offset
        #
        # @return [Vobiz::Sms::Types::BroadcastList]
        def list_broadcasts(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/broadcasts",
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
            Vobiz::Sms::Types::BroadcastList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates a broadcast in `draft` status with zero `stats` and no recipients. Only `name` and `from` are
        # required; `channel` defaults to `sms` and `ratePerSecond` to 5. Nothing is sent when you create a broadcast.
        # Next, upload recipients with `POST /broadcasts/{id}/recipients`, check the rendered text with `GET
        # /broadcasts/{id}/preview`, then start sending with `POST /broadcasts/{id}/launch`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Broadcasts::Types::BroadcastInput]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def create_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts",
            body: Vobiz::Sms::Broadcasts::Types::BroadcastInput.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one broadcast with its configuration, current `status` and freshly counted `stats`. Poll it while a
        # broadcast runs to follow progress, or subscribe to the `broadcast.updated` WebSocket event. For per-recipient
        # results, use `GET /broadcasts/{id}/recipients` or `GET /broadcasts/{id}/export`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def get_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Changes a `draft` broadcast. Send only the fields you want to change; fields you leave out, or send as `null`,
        # keep their value, except `scheduledAt`, where `null` or `""` clears a scheduled start. The same validation as
        # create applies, so `name` and `from` cannot be set to an empty string. A broadcast in any other status returns
        # `409` with `cannot edit a broadcast that is <status>`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Types::BroadcastUpdateInput]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def update_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[id]
          body_params = params.except(*path_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}",
            body: Vobiz::Sms::Types::BroadcastUpdateInput.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Permanently removes a `draft` or `cancelled` broadcast together with its recipient list and returns `204` with
        # no body. Any other status returns `409` with `cannot delete a broadcast that is <status>`, so cancel a
        # scheduled, running or paused broadcast first. Completed broadcasts are kept as your sending record.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [untyped]
        def delete_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}",
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

        # Returns the broadcast's recipients in upload order, each with its template `variables` and per-recipient send
        # state. Filter by `status` to find failures, opted-out numbers or rows still waiting to send. The response
        # gives the page in `recipients` and the count matching your filter in `total`. For a downloadable file of the
        # same data, use `GET /broadcasts/{id}/export`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Vobiz::Sms::Broadcasts::Types::ListRecipientsRequestStatus, nil] :status
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :offset
        #
        # @return [Vobiz::Sms::Types::BroadcastRecipientList]
        def list_recipients(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/recipients",
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
            Vobiz::Sms::Types::BroadcastRecipientList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Sets the recipient list of a `draft` broadcast; each upload replaces the previous list. Send
        # `multipart/form-data` with a `.csv` or `.xlsx` `file` (10 MB maximum) to use template variables from extra
        # columns, or JSON with a `numbers` array for a plain list. Numbers without a country code are normalised to
        # E.164 with `defaultCountry` (default `US`). Duplicates are dropped, invalid rows are reported in `invalid`,
        # and numbers that opted out of SMS from you are kept with status `opted_out` and never sent. A broadcast can
        # hold up to 10,000 recipients; a larger list returns `422`.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Broadcasts::Types::UploadRecipientsJSON]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::UploadResult]
        def upload_recipients(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request_data = Vobiz::Sms::Broadcasts::Types::UploadRecipientsJSON.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/recipients",
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
            Vobiz::Sms::Types::UploadResult.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Renders the template for the first pending recipients so you can check personalisation, encoding and segment
        # counts before you launch. Nothing is sent and nothing is charged. `missingVariables` lists placeholders that
        # have no matching upload column; they render as empty text, so fix the template or re-upload before launching.
        # `estimatedSegments` totals the segments across every pending recipient, not only the samples shown.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        # @option params [Integer, nil] :limit
        #
        # @return [Vobiz::Sms::Types::BroadcastPreview]
        def preview_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/preview",
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
            Vobiz::Sms::Types::BroadcastPreview.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Downloads every recipient with its send result as a CSV file (`text/csv`), named `broadcast-<id>.csv`. The
        # columns are `row`, `to`, `status`, `message_id`, `error_code`, `error_message` and `sent_at`, followed by one
        # column per column of your upload. Text cells that start with `=`, `+`, `-`, `@`, a tab or a carriage return
        # are prefixed with `'` so they open safely in spreadsheet applications. You can export a broadcast in any
        # status, including a draft, to check the parsed list.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [String]
        def export_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/export",
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

        # Starts sending. This sends real SMS to every `pending` recipient and charges your account per segment, so call
        # it only with your own credentials on a list you have consent to message. Only a `draft` can be launched; it
        # moves to `running`, or to `scheduled` when `scheduledAt` is in the future. Launch returns `422` when the
        # template is empty, when no recipient is pending, or when a phone-number `from` is not an SMS number on your
        # account. Each recipient is sent like `POST /messages` with the broadcast's `tag` and DLT IDs and the
        # idempotency key `broadcast:<broadcastId>:<recipientId>`, so no recipient is messaged twice.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def launch_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/launch",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Pauses a `running` broadcast. Sending stops after the messages already in flight, and pending recipients stay
        # `pending` until you resume or cancel. Any other status returns `409` with `cannot pause a broadcast that is
        # <status>`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def pause_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/pause",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Continues sending to the pending recipients of a `paused` broadcast and moves it back to `running`. This sends
        # real messages and charges your account per segment. It also resumes a broadcast paused with `pauseReason`
        # `insufficient_balance` once you have topped up. Any other status returns `409` with `cannot resume a broadcast
        # that is <status>`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def resume_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/resume",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Stops a broadcast for good and sets `completedAt`. You can cancel from `draft`, `scheduled`, `running` or
        # `paused`; a `completed`, `failed` or already `cancelled` broadcast returns `409`. Pending recipients become
        # `skipped`, and messages already sent are unaffected. A cancelled broadcast cannot be resumed or edited, but it
        # can be deleted.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Vobiz::Sms::Types::Broadcast]
        def cancel_broadcast(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/broadcasts/#{URI.encode_uri_component(params[:id].to_s)}/cancel",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Broadcast.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
