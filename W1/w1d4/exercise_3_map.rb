class Array
  def assign(key, value)
    self.each do |current_key|
      if current_key[0] == key
        current_key[1] = value
      end
    end
    self << [key, value] unless self.include?([key, value])
  end

  def delete(key)
    self.each_with_index do |current_key, idx|
      if current_key[0] == key
        self.delete(idx)
      end
    end
  end

  def lookup(key)
    self.each do |current_key|
      if current_key[0] == key
        return current_key[1]
      end
    end
  end
end

new_array = [["key1", "value1"], ["key2", "value2"], ["key3", "value4"],]
p new_array
p new_array.assign("key3", "value3")
p new_array.assign("key4", "value4")
p new_array.delete("key4")
p new_array
p new_array.lookup("key2")
