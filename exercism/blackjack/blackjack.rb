module Blackjack
  def self.parse_card(card)
    case card.downcase
    when "ace" then 11
    when "two" then 2
    when "three" then 3
    when "four" then 4
    when "five" then 5
    when "six" then 6
    when "seven" then 7
    when "eight" then 8
    when "nine" then 9
    when "ten","jack","queen","king" then 10
    else 0
    end
  end

  def self.card_range(card1, card2)
    card1= parse_card(card1)
    card2= parse_card(card2)
    @sum = card1+card2
    case @sum
    when 4..11 then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21 then "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    sum = parse_card(card1) + parse_card(card2)
    dealer = parse_card(dealer_card)
  
    case 
    when sum == 22
      "P"
    when sum == 21
      if (10..11).include?(dealer)
        "S"
      else
        "W"
      end
    when (17..20).include?(sum)
      "S"
    when (12..16).include?(sum) && !(7..21).cover?(dealer)
      "S"
    when sum <= 11
      "H"
    else
      "H"
    end
  end  
end
