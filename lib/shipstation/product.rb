module Shipstation
    class Product < ApiResource
        extend Shipstation::APIOperations::List
        extend Shipstation::APIOperations::Retrieve
        extend Shipstation::APIOperations::Update
    end
end 