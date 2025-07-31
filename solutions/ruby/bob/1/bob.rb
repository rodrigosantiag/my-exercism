module Bob
  def self.hey(remark)
    remark = remark.strip

    if remark.empty?
      'Fine. Be that way!'
    elsif question?(remark) && yell?(remark)
      'Calm down, I know what I\'m doing!'
    elsif question?(remark)
      'Sure.'
    elsif yell?(remark)
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end

  def self.question?(remark)
    remark.end_with?('?')
  end

  def self.yell?(remark)
    result = remark.gsub(/[^a-zA-Z]/, '')
    result.upcase == result && !result.empty?
  end
end
