require 'shipstation/api_operations/list'
require 'shipstation/api_operations/create'
require 'shipstation/api_operations/retrieve'
require 'shipstation/api_operations/update'

require 'shipstation/api_resource'
require 'shipstation/order'
require 'shipstation/customer'
require 'shipstation/shipment'
require 'shipstation/carrier'
require 'shipstation/store'
require 'shipstation/warehouse'
require 'shipstation/product'

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
            ss_username = params[:username] || Shipstation.username
            ss_password = params[:password] || Shipstation.password

            puts ss_password
            puts ss_username

            params.except!(:username, :password)

            defined? method or raise(
                ArgumentError, "Request method has not been specified"
            )
            defined? resource or raise(
                ArgumentError, "Request resource has not been specified"
            )
            if method == :get 
                headers = { :accept => :json, content_type: :json }.merge({params: params})
                payload = nil
                puts headers
            else
                headers = { :accept => :json, content_type: :json }
                payload = params
            end
            RestClient::Request.new({
                method: method,
                url: API_BASE + resource,
                user: ss_username,
                password: ss_password,
                payload: payload.to_json,
                headers: headers
            }).execute do |response, request, result|
                JSON.parse(response.to_str)
            end
        end

        def datetime_format datetime
            datetime.strftime("%Y-%m-%d %T")
        end
    end
end

# Shipstation.username = 9d5a864d104b49a293d3ff2601ac89b4
# Shipstation.password = ba3adb5094aa45b8aac9b354c7c6912a