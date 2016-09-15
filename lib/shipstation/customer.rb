module Shipstation
    class Customer < ApiResource
        extend Shipstation::APIOperations::List
    end
end