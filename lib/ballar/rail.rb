module Ballar
  class Rail
    attr_reader :balls, :next_rail

    def initialize(max_size, next_rail)
      @max_size = max_size
      @next_rail = next_rail
      @balls = []
    end

    def add_from(queue)
      balls << queue.shift
      overflow_to_next(queue) if tilted?
    end

    def overflow_to_next(queue)
      last_ball = balls.pop
      dropped = drop_balls

      if next_rail.nil?
        queue.concat [ dropped, last_ball ].flatten
      else
        queue.concat dropped
        queue.insert 0, last_ball
        next_rail.add_from queue
      end
    end

    def tilted?
      balls.size == @max_size
    end

    def drop_balls
      balls.reverse!.slice!(0, balls.size)
    end
  end
end
