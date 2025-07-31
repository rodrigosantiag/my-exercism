NAME_TAKEN = []

class Robot
  attr_reader :name

  def initialize
    generate_name
    puts 'test'
  end

  def reset
    NAME_TAKEN.delete @name
    generate_name
  end

  def self.forget
    NAME_TAKEN.clear
  end

  private

  def generate_name
    loop do
      letters = ('A'..'Z').to_a.sample(2).join
      numbers = rand(100..999).to_s
      @name = letters + numbers
      break unless NAME_TAKEN.include?(@name)
    end

    NAME_TAKEN << @name
  end
end
