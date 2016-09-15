module Shipstation
    class Store < ApiResource

        class << self
            def list
                response = Shipstation.request(:get, 'stores')
                
                return response
            end
        end
    end
end