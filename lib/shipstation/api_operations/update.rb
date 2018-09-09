module Shipstation
    module APIOperations
   	    module Update
			
			def update object_id, params={}
				Shipstation.request(:put, "#{class_name.downcase.pluralize}/#{object_id}", params)
			end
			
		end
	end	
end