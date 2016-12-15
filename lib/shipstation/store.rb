module Shipstation
    class Store < ApiResource
        extend Shipstation::APIOperations::Retrieve

        class << self
            def list
                response = Shipstation.request(:get, 'stores')
                
                return response
            end
        end
    end
end