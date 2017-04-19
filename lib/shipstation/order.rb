module Shipstation
    class Order < ApiResource
        extend Shipstation::APIOperations::List
        extend Shipstation::APIOperations::Create
        extend Shipstation::APIOperations::Retrieve

        class << self
            def create_label params={}
                response = Shipstation.request(:post, "orders/createlabelfororder", params)
                
                return response
            end

            def assign_tag params={}
                response = Shipstation.request(:post, "orders/addtag", params)
                
                return response
            end
        end
    end
end