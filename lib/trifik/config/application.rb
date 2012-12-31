Trifik::Thing.configure do
  self.default_columns = :screen_name, :name, :description, :article
  # self.world = World.new
end

module Trifik
  DIRECTIONS=[
    :north,
    :south,
    :east,
    :west,
    :northwest,
    :northeast,
    :southwest,
    :southeast,
    :up,
    :down
  ]
end