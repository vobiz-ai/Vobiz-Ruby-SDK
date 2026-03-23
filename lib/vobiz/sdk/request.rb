require 'json'
require 'typhoeus'

module Vobiz
  module SDK
    class Request
      STATUS_ERRORS = {
        400 => 'InvalidRequestError',
        401 => 'AuthenticationError',
        402 => 'InvalidRequestError',
        403 => 'AuthenticationError',
        404 => 'ResourceNotFoundError',
        405 => 'InvalidRequestError',
        406 => 'InvalidRequestError',
        409 => 'InvalidRequestError',
        422 => 'InvalidRequestError',
        429 => 'InvalidRequestError',
        500 => 'ServerError',
        502 => 'ServerError',
        503 => 'ServerError',
        504 => 'ServerError'
      }.freeze

      def initialize(auth_id:, auth_token:, user_agent:, timeout:, proxy: nil)
        @auth_id = auth_id
        @auth_token = auth_token
        @user_agent = user_agent
        @timeout = timeout
        @proxy = proxy
      end

      def call(method, url, params: nil, max_retries: 3, debug: false)
        attempt = 0

        loop do
          req_opts = {
            method: method.to_s.upcase,
            headers: default_headers,
            timeout: @timeout,
            followlocation: true
          }

          req_opts[:proxy] = @proxy if @proxy

          if method.to_s.upcase == 'GET'
            req_opts[:params] = params if params && !params.empty?
          elsif params && !params.empty?
            req_opts[:body] = params.to_json
          end

          puts({ method: req_opts[:method], url: url, headers: req_opts[:headers], data: params }) if debug

          response = Typhoeus::Request.new(url, req_opts).run

          if response.timed_out?
            raise ApiError.new(code: 0, message: 'Connection timed out')
          end

          if response.code == 0
            raise ApiError.new(code: 0, message: response.return_message)
          end

          if response.code < 200 || response.code >= 300
            if retryable?(response.code) && attempt < max_retries
              sleep retry_delay(response, attempt)
              attempt += 1
              next
            end

            raise ApiError.new(
              code: response.code,
              response_headers: response.headers,
              response_body: response.body,
              message: STATUS_ERRORS.fetch(response.code, 'ApiError')
            )
          end

          return parse_body(response.body)
        end
      rescue ApiError
        raise
      rescue StandardError => e
        raise ApiError.new(code: 0, message: e.message)
      end

      private

      def default_headers
        {
          'X-Auth-ID' => @auth_id,
          'X-Auth-Token' => @auth_token,
          'User-Agent' => @user_agent,
          'Content-Type' => 'application/json'
        }
      end

      def parse_body(body)
        return {} if body.nil? || body.strip.empty?

        parsed = JSON.parse(body)
        deep_camelize(parsed)
      rescue JSON::ParserError
        body
      end

      def deep_camelize(value)
        case value
        when Array
          value.map { |item| deep_camelize(item) }
        when Hash
          value.each_with_object({}) do |(key, v), acc|
            acc[camelize(key.to_s)] = deep_camelize(v)
          end
        else
          value
        end
      end

      def camelize(key)
        parts = key.split('_')
        return key if parts.length <= 1

        parts[0] + parts[1..].map(&:capitalize).join
      end

      def retryable?(status)
        status == 429 || status >= 500
      end

      def retry_delay(response, attempt)
        retry_after = response.headers['retry-after'] || response.headers['Retry-After']
        return [retry_after.to_i, 30].min if retry_after

        [0.2 * (2**attempt), 8.0].min
      end
    end
  end
end
