class Hand
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def one_pair?
    @cards.each_with_index do |card, i|
      (i + 1...@cards.length).each do |j|
        if card.name == @cards[j].name
          return true
        end
      end
    end

    false
  end

  def two_pair?
    pair_one = []
    pair_two = []
    @cards.each_with_index do |card, i|
      (i + 1...@cards.length).each do |j|
        if card.name == @cards[j].name && pair_one.empty?
          pair_one << card
          pair_one << @cards[j]
        elsif card.name == @cards[j].name && pair_two.empty?
          pair_two << card
          pair_two << @cards[j]
        end
      end
    end

    return true unless pair_two.empty?
    false
  end

  def three_of_a_kind?
    @cards.each_with_index do |card, i|
      set = 0
      (i...@cards.length).each do |j|
        set += 1 if card.value == @cards[j].value
      end
      return true if set > 2
    end

    false
  end

  def straight?
    @cards.sort_by! { |obj| obj.value }
    return true if @cards.last.value == 13 &&
      @cards[0].value == 1 &&
        @cards[1].value == 2 &&
          @cards[2].value == 3 &&
            @cards[3].value == 4
    (0..3).each do |i|
      return false if @cards[i].value + 1 != cards[i + 1].value
    end

    true
  end

  def flush?
    suits = []
    @cards.each { |card| suits << card.suit }
    return true if suits.uniq.length == 1
    false
  end


  #FIX THIS
  def full_house?
    @cards.sort_by! { |obj| obj.value }
    values = @cards.map { |card| card.value }
    if values[0..2].uniq.length == 1
      return true if values[3..4].uniq.length == 1
    elsif values[0..1].uniq.length == 1
      return true if values[2..4].uniq.length == 1
    end

    false
  end

  def four_of_a_kind?
    set = 0
    @cards.each do |card|
      @cards.each do |card2|
        set += 1 if card.value == card2.value
      end
      return true if set == 4
    end
    false
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    @cards.sort_by! { |obj| obj.value }
    straight? && flush? && @cards.first.value == 9
  end

  def better_hand?(other_hand)
    if royal_flush? && !other_hand.royal_flush?
      return true
    elsif straight_flush? && !other_hand.straight_flush?
      return true
    elsif full_house? && !other_hand.full_house?
      return true
    elsif flush? && !other_hand.flush?
      return true
    elsif straight? && !other_hand.straight?
      return true
    elsif three_of_a_kind? && !other_hand.three_of_a_kind?
      return true
    elsif two_pair? && !other_hand.two_pair?
      return true
    elsif one_pair? && !other_hand.one_pair?
      return true
    else
      return false
    end    
  end
end
