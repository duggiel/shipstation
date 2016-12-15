module Shipstation
    class Warehouse < ApiResource
        extend Shipstation::APIOperations::Create
        extend Shipstation::APIOperations::Retrieve

        class << self
            def list
                response = Shipstation.request(:get, 'warehouses')

                return response
            end
        end
    end
end