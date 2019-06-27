module Shipstation
  module APIOperations
    module Create

      def create params = {}
        response = Shipstation.request(:post, "#{class_name.downcase.pluralize}/create#{class_name.downcase}", params)
        return response
      end
    end
  end
end