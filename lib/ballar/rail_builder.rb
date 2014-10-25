module Ballar
  class RailBuilder
    def self.build
      Rail.new 5, five_minute_rail
    end

    private
    def self.hour_rail
      Rail.new 12, nil
    end

    def self.five_minute_rail
      Rail.new 12, hour_rail
    end
  end
end
