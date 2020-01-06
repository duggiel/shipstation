module Shipstation
  class Shipment < ApiResource
    extend Shipstation::APIOperations::List

    class << self
      def get_rates(params = {})
        Shipstation.request(:post, "shipments/getrates", params)
      end

      def create_label(params = {})
        Shipstation.request(:post, 'shipments/createlabel', params)
      end

      def void_label(params = {})
        Shipstation.request(:post, 'shipments/voidlabel', params)
      end
    end
  end
end