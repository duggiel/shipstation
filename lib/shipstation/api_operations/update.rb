module Shipstation
  module APIOperations
   	module Update
			
			def update id, params={}
				Shipstation.request(:put, "#{class_name.downcase.pluralize}/#{id}", params)
			end
			
		end
	end	
end