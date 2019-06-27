module Shipstation
  class ApiResource

    def self.class_name
      self.name.split('::')[-1]
    end
  end
end