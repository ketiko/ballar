require_relative 'rail'
require_relative 'rail_builder'

module Ballar
  class Clock
    attr_reader :balls

    def initialize(balls)
      @balls = balls.dup
      @rail = RailBuilder.build
      @minutes = 0
    end

    def tick
      @minutes += 1
      @rail.add_from(balls)
    end

    def minutes
      @minutes
    end

    def hours
      @minutes / 60
    end

    def days
      hours / 24
    end
  end
end
