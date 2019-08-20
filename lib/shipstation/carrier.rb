module Shipstation
  class Carrier < ApiResource
    extend Shipstation::APIOperations::List

    class << self
      def list_services(params = {})
        response = Shipstation.request(:get, 'carriers/listservices', params)
        return response
      end
    end
  end
end