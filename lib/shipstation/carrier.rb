module Shipstation
    class Carrier < ApiResource

        class << self
            def list
                response = Shipstation.request(:get, 'carriers')
                return response
            end
        end
    end
end