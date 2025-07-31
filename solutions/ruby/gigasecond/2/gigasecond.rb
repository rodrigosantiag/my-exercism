# frozen_string_literal: true

# Module to calculate one gigasecond after a given time
module Gigasecond
  def self.from(from_time)
    from_time + 10**9
  end
end
