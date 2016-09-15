module ShipStation
    class Customer < ApiResource
        extend ShipStation::APIOperations::List
    end
end