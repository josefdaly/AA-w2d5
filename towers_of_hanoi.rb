class TowersOfHanoi

  attr_accessor :first_tower, :second_tower, :third_tower

  def initialize
    @first_tower = [3,2,1]
    @second_tower = []
    @third_tower = []
  end

  def render
    [@first_tower, @second_tower, @third_tower]
  end

  def move(start, dest)
    if !render[start].empty? && render[dest].length < 3
      if render[dest].empty?
        render[dest] << render[start].pop
      elsif render[start].last < render[dest].last
        render[dest] << render[start].pop
      else
        false
      end
    end
  end

  def won?
    render == [[], [], [3,2,1]] ? true : false
  end

  def take_input(messege)
    puts
    puts messege
    input = Integer(gets)
    input - 1
  end

  def play
    until won?
      system ('clear')
      print render
      start = take_input('Starting Tower?')
      dest = take_input('Ending Tower?')
      move(start, dest)
    end
    system ('clear')
    print render
    puts
    puts "Great, you won!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
