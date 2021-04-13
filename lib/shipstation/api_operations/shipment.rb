module Shipstation
  module APIOperations
    module Shipment

      def mark_as_shipped object_id, params = {}
        Shipstation.request(:post, 'orders/markasshipped', params)
      end
    end
  end
end
