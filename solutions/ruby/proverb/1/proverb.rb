class Proverb
  def initialize(*args, qualifier: nil)
    @args = args
    @qualifier = qualifier
  end

  def to_s
    result = []

    (0...@args.size - 1).each { |i| result << "For want of a #{@args[i]} the #{@args[i + 1]} was lost." }

    last_one = "#{@qualifier} #{@args[0]}".strip

    result << "And all for the want of a #{last_one}."

    result.join("\n")
  end
end
