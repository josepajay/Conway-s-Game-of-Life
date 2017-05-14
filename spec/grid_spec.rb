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
      expect(@grid_obj.find_neighbours(@grid_obj.grid[5][5])).to be_a Array
    end

    it 'should return 8 neighbours for
        cordinate surrounded by other cells' do
      neighbour_array = @grid_obj.find_neighbours(@grid_obj.grid[5][5])
      expect(neighbour_array.count).to eq 8
    end

    it 'should return 3 neighbours for
        a corner posrition' do
      neighbour_array = @grid_obj.find_neighbours(@grid_obj.grid[9][9])
      expect(neighbour_array.count).to eq 3
    end

    it 'should return 5 neighbours for
        a edge position' do
      neighbour_array = @grid_obj.find_neighbours(@grid_obj.grid[9][8])
      expect(neighbour_array.count).to eq 5
    end
  end
end

