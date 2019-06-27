module Shipstation
  class Shipment < ApiResource
    extend Shipstation::APIOperations::List

    class << self
      def get_rates params = {}
        response = Shipstation.request(:post, "shipments/getrates", params)

        return response
      end
    end
  end
end