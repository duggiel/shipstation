module Shipstation
    class Product < ApiResource
        extend Shipstation::APIOperations::List
    end
end