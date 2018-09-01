class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)

    if num_buckets <= @count
      resize!
    end

    unless include?(key)
      @store[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    @store.each do |bucket|
      return true if bucket.include?(key)
    end
    false
  end

  def remove(key)
    if include?(key)
        @store[key.hash%num_buckets].delete(key)
        @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arrays = Array.new(num_buckets) {Array.new}
    @store.concat(new_arrays)
  end
end
