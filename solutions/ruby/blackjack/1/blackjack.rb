module Blackjack
  def self.parse_card(card)
    case card
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten', 'jack', 'queen', 'king' then 10
    when 'ace' then 11
    else 0
    end
  end

  def self.card_range(card1, card2)
    hand_value = parse_card(card1) + parse_card(card2)

    case hand_value
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    else 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    hand_value = parse_card(card1) + parse_card(card2)

    return 'P' if hand_value == 22

    card_range = self.card_range(card1, card2)
    dealer_card_value = self.parse_card(dealer_card)

    case card_range
    when 'blackjack'
      case dealer_card_value
      when 0..9 then 'W'
      else 'S'
      end
    when 'high' then 'S'
    when 'mid'
      case dealer_card_value
      when 0..6 then 'S'
      else 'H'
      end
    else 'H'
    end
  end
end
