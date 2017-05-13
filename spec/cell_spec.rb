require './lib/cell.rb'
describe 'Cell' do
  before do
    # initializing a alive cell at cordinates (5,10)
    @cell_obj = Cell.new(5, 10, 1)
  end
  it 'should define method to check if dead' do
    expect(@cell_obj.dead?).to eq false
  end

  it 'should define method to check if live' do
    expect(@cell_obj.alive?).to eq true
  end

  it 'transform should change alive cell to dead' do
    # current status alive
    @cell_obj.cell_transform!
    expect(@cell_obj.dead?).to eq true
  end

  it 'transform should change dead cell to alive' do
    cell = Cell.new(1, 1, 0)
    # current status dead
    cell.cell_transform!
    expect(@cell_obj.dead?).to eq false
  end
end