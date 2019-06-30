module Shipstation
  class Customer < ApiResource
    extend Shipstation::APIOperations::List
    extend Shipstation::APIOperations::Retrieve
  end
end