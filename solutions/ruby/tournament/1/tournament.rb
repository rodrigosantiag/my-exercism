# frozen_string_literal: true

# Tournament module
module Tournament
  def self.tally(input)
    results = {}
    input.each_line do |line|
      home_team, away_team, outcome = line.chomp.split(';')
      results[home_team] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      results[away_team] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }

      results[home_team][:mp] += 1
      results[away_team][:mp] += 1

      case outcome
      when 'win'
        results[home_team][:w] += 1
        results[away_team][:l] += 1
        results[home_team][:p] += 3
      when 'loss'
        results[home_team][:l] += 1
        results[away_team][:w] += 1
        results[away_team][:p] += 3
      when 'draw'
        results[home_team][:d] += 1
        results[away_team][:d] += 1
        results[home_team][:p] += 1
        results[away_team][:p] += 1
      end
    end

    tally_str = "Team                           | MP |  W |  D |  L |  P\n"
    results.reject! { |key, _| key.nil?}

    unless results.empty?
      sorted_results = results.sort_by { |team, data| [-data[:p], team] }
      sorted_results.each do |team, data|
        points = data[:p].to_s.size == 1 ? "  #{data[:p]}" : " #{data[:p]}"
        tally_str += "#{team.ljust(31)}|  #{data[:mp]} |  #{data[:w]} |  #{data[:d]} |  #{data[:l]} |#{points}\n"
      end
    end

    tally_str
  end
end
