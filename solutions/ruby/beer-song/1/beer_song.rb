PLURALIZATION = {
  bottle: {
    0 => 'bottles',
    1 => 'bottle'
  },
  one_word: {
    0 => 'one',
    1 => 'it'
  },
  no_more: {
    0 => 'no more'
  }
}.freeze

module BeerSong
  def self.recite(bottles, verses)
    original_bottles = bottles
    original_verses = verses
    result = []

    while verses.positive? && bottles.positive?
      result << <<~TEXT
        #{bottles} #{PLURALIZATION[:bottle].fetch(bottles, 'bottles')} of beer on the wall, #{bottles} #{PLURALIZATION[:bottle].fetch(bottles, 'bottles')} of beer.
        Take #{PLURALIZATION[:one_word].fetch(bottles, 'one')} down and pass it around, #{PLURALIZATION[:no_more].fetch((bottles - 1), (bottles - 1))} #{PLURALIZATION[:bottle].fetch((bottles - 1), 'bottles')} of beer on the wall.

      TEXT
      verses -= 1
      bottles -= 1
    end

    if original_bottles < original_verses
      result << <<~TEXT
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.\n
      TEXT
    end

    result.size.positive? ? result.join.chomp : result.join
  end
end
