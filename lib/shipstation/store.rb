module Shipstation
  class Store < ApiResource
    extend Shipstation::APIOperations::Retrieve
    extend Shipstation::APIOperations::Update

    class << self
      def list
        response = Shipstation.request(:get, 'stores')

        return response
      end
    end
  end
end