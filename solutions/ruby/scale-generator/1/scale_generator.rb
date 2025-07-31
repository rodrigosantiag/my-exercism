class Scale
  CHROMATIC_SCALE = 'A A# B C C# D D# E F F# G G#'.split(' ')

  INTERVALS = {
    'M' => 2,
    'm' => 1
  }.freeze

  FLAT_MAPPING = {
    'A♯' => 'B♭',
    'C♯' => 'D♭',
    'D♯' => 'E♭',
    'F♯' => 'G♭',
    'G♯' => 'A♭'
  }.freeze

  def initialize(tonic)
    @tonic = tonic.upcase
  end

  def chromatic
    tonic_index = CHROMATIC_SCALE.index(@tonic)
    scale = CHROMATIC_SCALE[tonic_index..-1] + CHROMATIC_SCALE[0...tonic_index]
    scale.map! { |note| FLAT_MAPPING.key?(note) ? FLAT_MAPPING[note] : note }
    scale
  end

  def interval(intervals)
    chromatic_scale = chromatic
    scale = [@tonic]
    current_index = 0

    intervals.each_char do |interval|
      current_index += INTERVALS[interval]
      scale << chromatic_scale[current_index]
    end

    scale.compact
  end

  private

  def flats?
    %w[F Bb Eb Ab Db Gb].include?(@tonic)
  end
end
