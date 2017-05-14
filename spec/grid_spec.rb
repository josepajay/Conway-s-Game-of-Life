require './lib/grid.rb'
describe 'Grid' do
  before do
    @grid_obj = Grid.new
  end
  it 'grid should be an array of cell objects' do
    expect(@grid_obj.grid).to be_a Array
  end
  describe 'FindNeighbours method' do
    it 'should return a neighbour array' do
      expect(@grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])).to be_a Array
    end

    it 'should return 8 neighbours for
        cordinate surrounded by other cells' do
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
      expect(neighbour_array.count).to eq 8
    end

    it 'should return 3 neighbours for
        a corner posrition' do
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[9][9])
      expect(neighbour_array.count).to eq 3
    end

    it 'should return 5 neighbours for
        a edge position' do
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[9][8])
      expect(neighbour_array.count).to eq 5
    end
  end
  describe 'Next Generation rules' do
    it 'cell should obey convay rule 01 of next generation' do
      # Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
      @grid_obj.grid[5][5].state = 1
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
      neighbour_array.map! { |n| n.state = 0 }
      @grid_obj.next_generation!
      expect(@grid_obj.grid[5][5].state).to eq 0
    end

    context 'cell should obey convay rule 02 of next generation' do
      it 'Any live cell with 2 live neighbours lives on to the next generation' do
        @grid_obj.grid[5][5].state = 1
        neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
        neighbour_array.map! { |n| n.state = 0 }
        @grid_obj.grid[5][4].state = 1
        @grid_obj.grid[5][6].state = 1
        @grid_obj.next_generation!
        expect(@grid_obj.grid[5][5].state).to eq 1
      end
      it 'Any live cell with 3 live neighbours lives on to the next generation' do
        @grid_obj.grid[5][5].state = 1
        neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
        neighbour_array.map! { |n| n.state = 0 }
        @grid_obj.grid[5][4].state = 1
        @grid_obj.grid[5][6].state = 1
        @grid_obj.grid[4][5].state = 1
        @grid_obj.next_generation!
        expect(@grid_obj.grid[5][5].state).to eq 1
      end
    end

    it 'cell should obey convay rule 03 of next generation' do
      @grid_obj.grid[5][5].state = 1
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
      neighbour_array.map! { |n| n.state = 1 }
      @grid_obj.next_generation!
      expect(@grid_obj.grid[5][5].state).to eq 0
    end

    it 'cell should obey convay rule 04 of next generation' do
      @grid_obj.grid[5][5].state = 0
      neighbour_array = @grid_obj.send(:find_neighbours, @grid_obj.grid[5][5])
      neighbour_array.map! { |n| n.state = 0 }
      @grid_obj.grid[5][4].state = 1
      @grid_obj.grid[5][6].state = 1
      @grid_obj.grid[4][5].state = 1
      @grid_obj.next_generation!
      expect(@grid_obj.grid[5][5].state).to eq 1
    end
  end
end
