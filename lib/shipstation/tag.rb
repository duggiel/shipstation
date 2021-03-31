module Shipstation
  class Tag < ApiResource

    class << self
      def list(params = {})
        response = Shipstation.request(:get, 'accounts/listtags', params)

        return response
      end
    end
  end
end