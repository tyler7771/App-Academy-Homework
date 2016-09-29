Class Artist
  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self.albums.include(:tracks)
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.name] = album.tracks.length
    end

    tracks_count
  end
end

def n_plus_one_seeds
  plants = self.plants
  seeds = []
  plants.each do |plant|
    seeds << plant.seeds
  end

  seeds
end

def better_seeds_query
  plants = self.plants.include(:seeds)
  seeds = []
  plants.each do |plant|
    seeds << plant.seeds
  end
  seeds
end

def n_plus_one_drivers
  buses = self.buses

  all_drivers = {}
  buses.each do |bus|
    drivers = []
    bus.drivers.each do |driver|
      drivers << driver.name
    end
    all_drivers[bus.id] = drivers
  end

  all_drivers
end

def better_drivers_query
  buses = self.albums.include(:drivers)
  all_drivers = {}
  buses.each do |bus|
    all_drivers[bus.id] = drivers
  end

  all_drivers
end
