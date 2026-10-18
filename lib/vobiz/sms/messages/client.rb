# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns the messages on your account, sent and received, newest first. Combine the filters to find a message
        # you did not keep the `id` for, such as the other recipients of a multi-recipient send (filter by `tag` or
        # `to`). Every filter is an exact match, and filters you omit are not applied. Page through results with `limit`
        # and `offset`, and use `total` to know when to stop.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Vobiz::Sms::Messages::Types::ListMessagesRequestStatus, nil] :status
        # @option params [Vobiz::Sms::Messages::Types::ListMessagesRequestChannel, nil] :channel
        # @option params [Vobiz::Sms::Messages::Types::ListMessagesRequestDirection, nil] :direction
        # @option params [String, nil] :to
        # @option params [String, nil] :from
        # @option params [String, nil] :tag
        # @option params [String, nil] :start_date
        # @option params [String, nil] :end_date
        # @option params [Integer, nil] :limit
        # @option params [Integer, nil] :offset
        #
        # @return [Vobiz::Sms::Types::MessageList]
        def list_messages(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["channel"] = params[:channel] if params.key?(:channel)
          query_params["direction"] = params[:direction] if params.key?(:direction)
          query_params["to"] = params[:to] if params.key?(:to)
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["tag"] = params[:tag] if params.key?(:tag)
          query_params["startDate"] = params[:start_date] if params.key?(:start_date)
          query_params["endDate"] = params[:end_date] if params.key?(:end_date)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/messages",
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
            Vobiz::Sms::Types::MessageList.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Sends an SMS, MMS or RCS message from one of your numbers or RCS senders to one or more recipients. Each
        # number in `to` becomes its own message, with its own `id`, status and conversation, and the response body is
        # the first recipient's message. Every recipient is checked against your opt-out list first, and a send with a
        # future `scheduledAt` is stored with status `scheduled`.
        #
        # - `201` when every recipient was accepted, including an idempotent replay and a successful SMS fallback.
        # - `202` when at least one recipient was recorded and at least one errored. Find the other recipients with `GET
        # /messages` filtered by `tag` or `to`.
        # - `422` when the recipient has opted out and nothing was recorded.
        # - `502` when the send was rejected before a message was recorded. Retry with the same `idempotencyKey`.
        #
        # Track delivery with `GET /messages/{id}`, your webhooks (callbacks) or the WebSocket.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::Messages::Types::SendMessageRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::Message]
        def send_message(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/messages",
            body: Vobiz::Sms::Messages::Types::SendMessageRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::Message.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Prices a message before you send it, without sending anything. It splits `text` into segments for the chosen
        # channel and returns the segment count, the price per segment and the total in your account currency. Use it to
        # show a cost estimate in your app or to keep long messages within a budget. The figures are for one recipient;
        # multiply `totalCost` by the number of recipients for a multi-recipient send.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :from
        # @option params [String] :to
        # @option params [Vobiz::Sms::Messages::Types::PreviewMessageCostRequestChannel, nil] :channel
        # @option params [String, nil] :text
        #
        # @return [Vobiz::Sms::Types::CostPreview]
        def preview_message_cost(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["to"] = params[:to] if params.key?(:to)
          query_params["channel"] = params[:channel] if params.key?(:channel)
          query_params["text"] = params[:text] if params.key?(:text)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/messages/cost-preview",
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
            Vobiz::Sms::Types::CostPreview.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Checks whether a phone number can receive RCS messages from your RCS sender, without sending anything. Call it
        # before an RCS send to choose between RCS and SMS for that contact. If `reachable` is `false`, send with
        # `channel: "sms"` instead, or send RCS with `failoverToSms: true` so Vobiz falls back to SMS automatically.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :from
        # @option params [String] :to
        #
        # @return [Vobiz::Sms::Types::RcsReachability]
        def check_rcs_reachability(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["from"] = params[:from] if params.key?(:from)
          query_params["to"] = params[:to] if params.key?(:to)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/messages/rcs-reachability",
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
            Vobiz::Sms::Types::RcsReachability.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns one message with its full status history. Use it to follow a message from `sent` to `delivered` or
        # `failed`, and to read `errorCode` and `errorMessage` when it fails. The `statusHistory` array lists every
        # status change, oldest first. For real-time updates, subscribe to webhooks (callbacks) or the WebSocket instead
        # of polling.
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
        # @return [Vobiz::Sms::Types::MessageWithHistory]
        def get_message(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/messages/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::MessageWithHistory.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
