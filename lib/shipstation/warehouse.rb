module Shipstation
    class Warehouse < ApiResource
        include Shipstation::APIOperations::Create

        class << self
            def list
                response = Shipstation.request(:get, 'warehouses')

                return response
            end
        end
    end
end