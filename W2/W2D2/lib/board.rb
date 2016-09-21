class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    @cups[6] = []
    @cups[13] = []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    positions = (0...6).to_a + (7...13).to_a
    if !positions.include?(start_pos)|| @cups[start_pos] == []
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stone_count.empty?
      idx += 1
      idx = 0 if idx > 13

      if idx == 6
        @cups[6] << stone_count.pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << stone_count.pop if current_player_name == @name2
      else
        @cups[idx] << stone_count.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    @cups[0..5].all? { |cup| cups.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    if @cups[6].count > @cups[13].count
      return @name1
    elsif @cups[6].count < @cups[13].count
      return @name2
    else
      :draw
    end
  end
end
