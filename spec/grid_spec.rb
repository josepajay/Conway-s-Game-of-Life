require './lib/grid.rb'
describe 'Grid' do
  before do
    @grid_obj = Grid.new
  end
  it 'grid should be an array of cell objects' do
    expect(@grid_obj.grid).to be_a Array
  end
end