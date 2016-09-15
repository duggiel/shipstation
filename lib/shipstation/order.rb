module Shipstation
    class Order < ApiResource
        extend Shipstation::APIOperations::List
        extend Shipstation::APIOperations::Create

        class << self
            def create_label params={}
                response = Shipstation.request(:post, "orders/createlabelfororder", params)
                
                return response
            end
        end
    end
end