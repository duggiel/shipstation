module ShipStation
    class Carrier < ApiResource

        class << self
            def list
                response = ShipStation.request(:get, 'carriers')
                return response
            end
        end
    end
end