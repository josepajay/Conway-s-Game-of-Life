class Cell
  attr_accessor :state, :x, :y
  # state of cell is taken as dead for state value 0 and vice versa
  def initialize(y, x, state = rand(2))
    @state = state
    @x = x
    @y = y
  end

  def alive?
    state == 1
  end

  def dead?
    state == 0
  end

  def cell_transform!
    if @state == 0
      @state = 1
    else
      @state = 0
    end
  end

end