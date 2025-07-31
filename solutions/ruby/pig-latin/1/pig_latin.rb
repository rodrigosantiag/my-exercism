module PigLatin
  def self.translate(word)
    vowels = ['a', 'e', 'i', 'o', 'u']
    consonant_clusters = ['qu']

    if vowels.include?(word[0]) || (word.start_with?('xr') || word.start_with?('yt'))
      return word + 'ay'
    elsif word.start_with?(*consonant_clusters)
      return word[2..-1] + word[0..1] + 'ay'
    else
      i = 0
      while i < word.length && !vowels.include?(word[i])
        i += 1
      end
      if word[i-1..i] == 'qu'
        return word[i+1..-1] + word[0..i] + 'ay'
      else
        return word[i..-1] + word[0...i] + 'ay'
      end
    end
  end
end
