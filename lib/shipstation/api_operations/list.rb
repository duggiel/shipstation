module ShipStation
    module APIOperations
        module List

            def list
                response = ShipStation.request(:get, class_name.downcase.pluralize)

                return response[class_name.downcase.pluralize] 
            end
        end
    end
end