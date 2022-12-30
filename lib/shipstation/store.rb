module Shipstation
  class Store < ApiResource
    extend Shipstation::APIOperations::List
    extend Shipstation::APIOperations::Retrieve
    extend Shipstation::APIOperations::Update

    class << self
      def list(params = {})
        response = Shipstation.request(:get, 'stores', params)

        return response
      end
    end
  end
end