module Shipstation
  module APIOperations
    module Retrieve

      def retrieve object_id, params = {}
        response = Shipstation.request(:get, "#{class_name.downcase.pluralize}/#{object_id}", params)
        return response
      end
    end
  end
end