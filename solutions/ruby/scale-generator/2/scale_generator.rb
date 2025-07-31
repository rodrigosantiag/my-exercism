class Scale
  attr_reader :chromatic

  def initialize(tonic)
    case tonic
    when 'C', 'G', 'D', 'A', 'E', 'B', 'F#'
      scale_type = :sharp
    when 'a', 'e', 'b', 'f#', 'c#', 'g#', 'd#'
      scale_type = :sharp
      tonic.capitalize!
    when 'F', 'Bb', 'Eb', 'Ab', 'Db', 'Gb'
      scale_type = :flat
    when 'd', 'g', 'c', 'f', 'bb', 'eb'
      scale_type = :flat
      tonic.capitalize!
    else
      @chromatic = []
      return
    end
    scale =
      if scale_type == :sharp
        %w[A A# B C C# D D# E F F# G G#]
      elsif scale_type == :flat
        %w[A Bb B C Db D Eb E F Gb G Ab]
      end
    @chromatic = scale.lazy.cycle.drop_while{_1 != tonic}.take(12).force
  end
  def interval(intervals)
    intervals.chars.map do
      case _1
      when 'A' then 3
      when 'M' then 2
      when 'm' then 1
      else 0
      end
    end
             .inject([0]) { |a, x| a + [a.last + x]}
             .map{ @chromatic[_1 % 12] }
  end
end
