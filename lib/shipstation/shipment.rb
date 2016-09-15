module ShipStation
    class Shipment < ApiResource
        extend ShipStation::APIOperations::List
    end
end