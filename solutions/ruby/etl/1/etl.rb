module ETL
  def self.transform(old_letters)
    result = {}

    old_letters.each do |point, letters|
      letters.each do |letter|
        result[letter.downcase] = point
      end
    end

    result
  end
end
