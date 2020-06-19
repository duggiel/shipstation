# frozen_string_literal: true

module Shipstation
  class Order < ApiResource
    extend Shipstation::APIOperations::List
    extend Shipstation::APIOperations::Create
    extend Shipstation::APIOperations::Retrieve
    extend Shipstation::APIOperations::Delete
    extend Shipstation::APIOperations::Shipment

    class << self
      def create_label(params = {})
        response = Shipstation.request(:post, 'orders/createlabelfororder', params)

        response
      end

      def assign_tag(params = {})
        response = Shipstation.request(:post, 'orders/addtag', params)

        response
      end

      def remove_tag(params = {})
        response = Shipstation.request(:post, 'orders/removetag', params)

        response
      end

      # params: { [:username], [:password], input: [ {:order_number, ... }, { :order_number, ... } ] }
      # todo: complete in future phase
      # def create_update_orders params
      #     Shipstation.request(:post, "orders/createorders", params)
      # end
    end
  end
end
