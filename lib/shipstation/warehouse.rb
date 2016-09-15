module ShipStation
    class Warehouse < ApiResource
        include ShipStation::APIOperations::Create

        class << self
            def list
                response = ShipStation.request(:get, 'warehouses')

                return response
            end
        end
    end
end