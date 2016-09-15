module ShipStation
    class Store < ApiResource

        class << self
            def list
                response = ShipStation.request(:get, 'stores')
                
                return response
            end
        end
    end
end