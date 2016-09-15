require 'shipstation/api_operations/list'
require 'shipstation/api_operations/create'

require 'shipstation/api_resource'
require 'shipstation/order'
require 'shipstation/customer'
require 'shipstation/shipment'
require 'shipstation/carrier'
require 'shipstation/store'
require 'shipstation/warehouse'
require 'shipstation/product'

module ShipStation
    API_BASE = "https://ssapi.shipstation.com/"

    class ShipStationError < StandardError
    end

    class AuthenticationError < ShipStationError; end
    class ConfigurationError < ShipStationError; end

    class << self
        def username
            defined? @username and @username or raise(
                ConfigurationError, "ShipStation username not configured"
            )
        end
        attr_writer :username

        def password
            defined? @password and @password or raise(
                ConfigurationError, "ShipStation password not configured"
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