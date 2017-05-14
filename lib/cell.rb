class Cell
  attr_accessor :state, :x, :y
  # state of cell is taken as dead for state value 0 and vice versa
  def initialize(y, x, state = rand(2))
    @state = state
    @x = x
    @y = y
  end

  def alive?
    if state == 1
      true
    else
      false
    end
  end

  def dead?
    if state == 0
      true
    else
      false
    end
  end

  def cell_transform!
    if @state == 0
      @state = 1
    else
      @state = 0
    end
  end

end