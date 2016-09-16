class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |current_key|
      if current_key[0] == key
        current_key[1] = value
      end
    end
    @map << [key, value] unless @map.include?([key, value])
    @map
  end

  def delete(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def lookup(key)
    @map.each do |current_key|
      if current_key[0] == key
        return current_key[1]
      end
    end
  end
end

new_array = Map.new
new_array.assign("key1", "value1")
new_array.assign("key2", "value2")
new_array.assign("key3", "value4")
p new_array.assign("key3", "value3")
p new_array.assign("key4", "value4")
p new_array.delete("key4")
p new_array.lookup("key2")
