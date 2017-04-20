module Shipstation
    class Tag < ApiResource

        class << self
            def list
                response = Shipstation.request(:get, 'accounts/listtags')
                
                return response
            end
        end
    end
end