# frozen_string_literal: true

require 'rest-client'

require 'shipstation/api_operations/list'
require 'shipstation/api_operations/create'
require 'shipstation/api_operations/retrieve'
require 'shipstation/api_operations/update'
require 'shipstation/api_operations/delete'

require 'shipstation/api_resource'
require 'shipstation/order'
require 'shipstation/customer'
require 'shipstation/shipment'
require 'shipstation/carrier'
require 'shipstation/store'
require 'shipstation/warehouse'
require 'shipstation/product'
require 'shipstation/tag'

module Shipstation

  API_BASE = "https://ssapi.shipstation.com/"

  class ShipstationError < StandardError
  end

  class AuthenticationError < ShipstationError;
  end
  class ConfigurationError < ShipstationError;
  end
  class ApiRequestError < ShipstationError
    attr_reader :response_code, :response_headers, :response_body

    def initialize(response_code:, response_headers:, response_body:)
      @response_code = response_code
      @response_headers = response_headers
      @response_body = response_body
    end
  end

  class << self
    def username
      defined? @username and @username or raise(
        ConfigurationError, "Shipstation username not configured"
      )
    end

    attr_writer :username

    def password
      defined? @password and @password or raise(
        ConfigurationError, "Shipstation password not configured"
      )
    end

    attr_writer :password

    def request method, resource, params = {}
      if params.is_a?(Hash)
        ss_username = params.delete(:username)
        ss_password = params.delete(:password)
        params = params[:input] if params[:input]
      end

      ss_username ||= Shipstation.username
      ss_password ||= Shipstation.password

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )
      if method == :get
        headers = {:accept => :json, content_type: :json}.merge({params: params})
        payload = nil
      else
        headers = {:accept => :json, content_type: :json}
        payload = params
      end
      RestClient::Request.new({
                                method: method,
                                url: API_BASE + resource,
                                user: ss_username,
                                password: ss_password,
                                payload: payload ? payload.to_json : nil,
                                headers: headers
                              }).execute do |response, request, result|
        if response.code != 200
          raise ApiRequestError.new(
            response_code: response.code,
            response_headers: response.headers,
            response_body: response.to_str
          )
        end
        str_response = response.to_str
        str_response.empty? ? '' : JSON.parse(str_response)
      end
    end

    def datetime_format datetime
      datetime.strftime("%Y-%m-%d %T")
    end
  end
end
