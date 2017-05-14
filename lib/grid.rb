require_relative 'cell'

class Grid
  attr_accessor :grid, :height, :width
  def initialize(y = 10, x = 10)
    @height = y
    @width = x
    @grid = []
    @height.times do |y|
      temp = Array.new
      @width.times do |x|
        temp << Cell.new(y, x)
      end
      @grid << temp
    end
    print_grid
  end

  def print_grid
    grid.each do |y|
      y.each do |x|
        print "#{x.state}       "
      end
      puts "\n \n \n"
    end
  end

  def next_generation!
    #Refactor, make use of cell transform method of cell class if needed
    next_grid = Array.new
    @grid.each do |y|
      temp = Array.new
      y.each do |x|
        case(neighbouring_alive_count(x))
        when 0, 1
          temp << Cell.new(x.y, x.x, 0)
        when 3
          temp << Cell.new(x.y, x.x, 1)
        when 2
          temp << Cell.new(x.y, x.x, 1) if x.alive?
          temp << Cell.new(x.y, x.x, 0) if x.dead?
        when 2, 3
          temp << Cell.new(x.y, x.x, 1) if x.alive?
        end
        if neighbouring_alive_count(x) > 3
          temp << Cell.new(x.y, x.x, 0)
        end
      end
      next_grid << temp
    end
    @grid = next_grid
    print_grid
  end

  private

  def find_neighbours(cell)
    neighbours = Array.new
    neighbours << grid[cell.y-1][cell.x-1] if (cell.y > 0 && cell.x > 0)
    neighbours << grid[cell.y-1][cell.x] if cell.y > 0
    neighbours << grid[cell.y-1][cell.x+1] if (cell.y > 0 && cell.x < width - 1)

    neighbours << grid[cell.y][cell.x-1] if cell.x > 0
    neighbours << grid[cell.y][cell.x+1] if cell.x < width - 1

    neighbours << grid[cell.y+1][cell.x-1] if (cell.y < height - 1 && cell.x > 0)
    neighbours << grid[cell.y+1][cell.x] if cell.y < height - 1
    neighbours << grid[cell.y+1][cell.x+1] if (cell.y < height - 1 && cell.x < width - 1)
    neighbours.compact
  end

  def neighbouring_alive_count(c)
    count = 0
    find_neighbours(c).each do |n|
      count += 1 if n.alive?
    end
    count
  end
end
