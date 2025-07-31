class Garden
  SEEDS = {
    'G' => :grass,
    'C' => :clover,
    'R' => :radishes,
    'V' => :violets
  }.freeze

  CHILDREN = %w[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry].freeze

  def initialize(class_seeds)
    @class_seeds = class_seeds.split("\n")
  end

  def method_missing(method, *args, &block)
    self.class.send(:define_method, method) do
      child_index = CHILDREN.index(method.to_s) * 2
      child_range = child_index...(child_index + 2)
      result = []

      @class_seeds.each do |seed|
        child_seeds = seed[child_range]
        child_seeds.each_char { |char| result << SEEDS[char] }
      end

      result
    end

    send method, *args, &block
  end

  def respond_to_missing?(method_name, include_private = false)
    respond_to?(method_name, include_private)
  end
end
