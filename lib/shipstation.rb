require 'rest-client'

require 'shipstation/api_operations/list'
require 'shipstation/api_operations/create'
require 'shipstation/api_operations/retrieve'

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

    class AuthenticationError < ShipstationError; end
    class ConfigurationError < ShipstationError; end

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

        def request method, resource, params={}
            defined? method or raise(
                ArgumentError, "Request method has not been specified"
            )
            defined? resource or raise(
                ArgumentError, "Request resource has not been specified"
            )
            RestClient::Request.new({
                method: method,
                url: API_BASE + resource,
                user: Shipstation.username,
                password: Shipstation.password,
                payload: params,
                headers: { :accept => :json, content_type: :json }
            }).execute do |response, request, result|
                JSON.parse(response.to_str)
            end
        end

        def datetime_format datetime
            datetime.strftime("%Y-%m-%d %T")
        end
    end
end
