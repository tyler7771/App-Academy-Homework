class LRUCache
  def initialize(cache_length)
    @cache = []
    @cache_length = cache_length
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.count < @cache_length
      less_than_length(el)
    elsif @cache.count == @cache_length
      equal_to_length(el)
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!
  def less_than_length(el)
    @cache.delete(el) if @cache.include?(el)
    @cache << el
  end

  def equal_to_length(el)
    if @cache.include?(el)
      @cache.delete(el)
    else
      @cache.shift
    end
    @cache << el
  end
end

p johnny_cache = LRUCache.new(4)
puts
p johnny_cache.add("I walk the line")
p johnny_cache.add(5)
p johnny_cache.count # => returns 2
puts
p johnny_cache.add([1,2,3])
p johnny_cache.add(5)
p johnny_cache.add(-5)
p johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.add([1,2,3,4])
p johnny_cache.add("I walk the line")
p johnny_cache.add(:ring_of_fire)
p johnny_cache.add("I walk the line")
p johnny_cache.add({a: 1, b: 2, c: 3})


p johnny_cache.show
