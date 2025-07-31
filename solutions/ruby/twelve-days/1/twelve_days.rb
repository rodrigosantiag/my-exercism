# frozen_string_literal: true

ITEMS = [
  'a Partridge in a Pear Tree',
  'two Turtle Doves',
  'three French Hens',
  'four Calling Birds',
  'five Gold Rings',
  'six Geese-a-Laying',
  'seven Swans-a-Swimming',
  'eight Maids-a-Milking',
  'nine Ladies Dancing',
  'ten Lords-a-Leaping',
  'eleven Pipers Piping',
  'twelve Drummers Drumming'
].freeze

ORDINALS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze

# Twelve days song module
module TwelveDays
  def self.song
    result = ''
    ORDINALS.each_with_index do |ordinal, idx|
      result += if idx.zero?
                  "On the #{ordinal} day of Christmas my true love gave to me: #{ITEMS[0]}.\n"
                else
                  "\nOn the #{ordinal} day of Christmas my true love gave to me: #{ITEMS[1..idx].reverse.join(', ')}, and #{ITEMS[0]}.\n"
                end
    end
    result
  end
end
