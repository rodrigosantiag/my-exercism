module ArmstrongNumbers
  def self.include?(number)
    number_text = number.to_s
    factor = number_text.chars.size.to_i
    sum = 0
    number_text.each_char { |char| sum += char.to_i**factor }
    sum == number
  end
end
