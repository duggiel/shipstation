module Shipstation
    module APIOperations
        module Delete
            
            def delete object_id, params={}
                Shipstation.request(:delete, "#{class_name.downcase.pluralize}/#{object_id}")
            end
            
        end
    end 
end