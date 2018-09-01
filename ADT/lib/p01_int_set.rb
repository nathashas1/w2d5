require 'byebug'

class MaxIntSet

  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if @store.length < num || num < 0
    self.store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end
#
#
class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_num = num % @store.length
    @store[bucket_num] << num
  end

  def remove(num)
    bucket_num = num % @store.length
    @store[bucket_num].delete(num)
  end

  def include?(num)
    @store.flatten.any?{|el| el == num }
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if num_buckets <= @count
      resize!
    end

   unless self.include?(num)
      bucket_num = num % @store.length
      @store[bucket_num].push(num)
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      bucket_num = num % @store.length
      @store[bucket_num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store.flatten.any?{|el| el == num }
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
