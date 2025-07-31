class TwoBucket
  def initialize(bucket_one, bucket_two, goal, start_bucket)
    @bucket_one = bucket_one
    @bucket_two = bucket_two
    @goal = goal
    @start_bucket = start_bucket
  end

  def moves
    result = 0

  end

  def goal_bucket
    @start_bucket
  end

  def other_bucket
    goal_bucket == 'one' ? @bucket_two : @bucket_one
  end
end
