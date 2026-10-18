# frozen_string_literal: true

module Vobiz
  module Sms
    module OptOuts
      class Client
        # @param client [Vobiz::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns the numbers on your opt-out list, newest first, including entries created from STOP, START and HELP
        # keyword replies and the ones you added. Pass both `limit` and `offset` on every call: the response is a bare
        # JSON array, and it is `null` when the page has no records (including when `limit` is missing). Page by
        # increasing `offset` until a page returns fewer items than `limit` or `null`. To check a single number, use
        # `GET /opt-outs/{phoneNumber}` instead.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :limit
        # @option params [Integer] :offset
        #
        # @return [Array[Vobiz::Sms::Types::OptOut], nil]
        def list_opt_outs(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["offset"] = params[:offset] if params.key?(:offset)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/opt-outs",
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

        # Adds a phone number to your opt-out list for one channel, so Vobiz stops messages to it. After this, `POST
        # /messages` to that number on that channel returns `422` and broadcasts skip it. An `sms` opt-out also blocks
        # `mms`. Use it to record consent withdrawn outside a keyword reply, for example on a call or a web form.
        # Creating the same number and channel again updates the stored `reason` instead of adding a second record.
        #
        # @param request_options [Hash]
        # @param params [Vobiz::Sms::OptOuts::Types::CreateOptOutRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Vobiz::Sms::Types::StatusOk]
        def create_opt_out(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "api/v1/sms/opt-outs",
            body: Vobiz::Sms::OptOuts::Types::CreateOptOutRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Vobiz::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Vobiz::Sms::Types::StatusOk.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Tells you whether a phone number is on your opt-out list for a channel. Call it before a send to skip a
        # blocked contact instead of handling a `422` from `POST /messages`. The response is always `200` with
        # `optedOut` set to `true` or `false`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :phone_number
        # @option params [String, nil] :channel
        #
        # @return [Vobiz::Sms::Types::OptOutCheck]
        def check_opt_out(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["channel"] = params[:channel] if params.key?(:channel)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "api/v1/sms/opt-outs/#{URI.encode_uri_component(params[:phone_number].to_s)}",
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
            Vobiz::Sms::Types::OptOutCheck.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Removes a phone number from your opt-out list for one channel, so you can message it again on that channel. Do
        # this only after the contact has given consent again, for example after they reply `START`. The response is
        # `200` whether or not a record existed, so it is safe to retry. Removing an opt-out on one channel leaves
        # entries on other channels in place; delete each one separately.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :phone_number
        # @option params [String, nil] :channel
        #
        # @return [Vobiz::Sms::Types::StatusOk]
        def delete_opt_out(request_options: {}, **params)
          params = Vobiz::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["channel"] = params[:channel] if params.key?(:channel)

          request = Vobiz::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "api/v1/sms/opt-outs/#{URI.encode_uri_component(params[:phone_number].to_s)}",
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
            Vobiz::Sms::Types::StatusOk.load(response.body)
          else
            error_class = Vobiz::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
