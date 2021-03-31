module Shipstation
  class Warehouse < ApiResource
    extend Shipstation::APIOperations::Create
    extend Shipstation::APIOperations::Retrieve
    extend Shipstation::APIOperations::Update

    class << self
      def list(params = {})
        response = Shipstation.request(:get, 'warehouses', params)

        return response
      end
    end
  end
end