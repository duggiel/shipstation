module Shipstation
    class Product < ApiResource
        extend Shipstation::APIOperations::List
        extend Shipstation::APIOperations::Retrieve
    end
end