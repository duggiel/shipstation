module Shipstation
  class Webhook < ApiResource

    class << self
      def subscribe(params={})
        response = Shipstation.request(:post, 'webhooks/subscribe', params)

        return response
      end

      def unsubscribe(object_id, params={})
        response = Shipstation.request(:delete, "webhooks/#{object_id}", params)

        return response
      end
    end
  end
end