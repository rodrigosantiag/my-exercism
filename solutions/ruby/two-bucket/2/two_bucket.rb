class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(bucket_one, bucket_two, goal, first_bucket)
    @bucket_one = {current: 0, capacity: bucket_one}
    @bucket_two = {current: 0, capacity: bucket_two}
    @goal = goal
    @moves = 0

    solve(first_bucket)
  end

  private
  def check_simple_fill(first_bucket, other_bucket)
    if first_bucket[:capacity] == @goal
      fill first_bucket
    elsif other_bucket[:capacity] == @goal
      fill first_bucket
      fill other_bucket
    end
  end

  def empty(which)
    @moves += 1

    which[:current] = 0
  end

  def fill(which)
    @moves += 1

    which[:current] = which[:capacity]
  end

  def solve(first_bucket)
    first_bucket, other_bucket = if first_bucket == 'one'
                                   [@bucket_one, @bucket_two]
                                 else
                                   [@bucket_two, @bucket_one]
                                 end

    check_simple_fill first_bucket, other_bucket
    until solved?
      if other_bucket[:current] == other_bucket[:capacity]
        empty other_bucket
      elsif first_bucket[:current].positive?
        transfer first_bucket, other_bucket
      else
        fill first_bucket
      end
    end
  end

  def solved?
    if @bucket_one[:current] == @goal
      @goal_bucket = 'one'
      @other_bucket = @bucket_two[:current]
    elsif @bucket_two[:current] == @goal
      @goal_bucket = 'two'
      @other_bucket = @bucket_one[:current]
    end
  end

  def transfer(from, to)
    @moves += 1

    if to[:current] + from[:current] <= to[:capacity]
      to[:current] += from[:current]
      from[:current] = 0
    else
      taken = to[:capacity] - to[:current]
      to[:current] += taken
      from[:current] -= taken
    end
  end
end
