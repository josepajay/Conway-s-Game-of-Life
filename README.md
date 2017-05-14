# Conway-s-Game-of-Life
Trying to implement game of life devised by the British mathematician John Horton Conway in ruby.

Instuctions to use

Default size of grid is 10 x 10, user can pass in values for height and width
to grid initialize if needed

  eg: g = Grid.new(10, 15)

To obtain next generation, just use next_generation! method on grid object

    eg: g.next_generation!

