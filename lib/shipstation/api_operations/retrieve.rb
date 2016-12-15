module Shipstation
    module APIOperations
        module Retrieve

            def retrieve object_id
                response = Shipstation.request(:get, "#{class_name.downcase.pluralize}/#{object_id}")
                return response
            end
        end
    end
end