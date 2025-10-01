module Chess
  # TODO: define the 'RANKS' constant
  # TODO: define the 'FILES' constant
  Chess::RANKS=1..8
  Chess::FILES='A'..'H'
  def self.valid_square?(rank, file)
    FILES.include?(file) && RANKS.include?(rank)
  end

  def self.nickname(first_name, last_name)
    nickname = first_name[0..1]+last_name[-2..-1]
    return nickname.upcase
  end

  def self.move_message(first_name, last_name, square)
    file = square[0]
    rank = square[1..].to_i
  
    if !valid_square?(rank, file)
      "#{nickname(first_name, last_name)} attempted to move to #{square}, but that is not a valid square"
    else
      "#{nickname(first_name, last_name)} moved to #{square}"
    end
  end
  
end
