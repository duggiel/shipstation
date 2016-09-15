module ShipStation
    class Product < ApiResource
        extend ShipStation::APIOperations::List
    end
end