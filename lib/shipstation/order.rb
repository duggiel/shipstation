module ShipStation
    class Order < ApiResource
        extend ShipStation::APIOperations::List
        extend ShipStation::APIOperations::Create

        class << self
            def create_label params={}
                response = ShipStation.request(:post, "orders/createlabelfororder", params)
                
                return response
            end
        end
    end
end