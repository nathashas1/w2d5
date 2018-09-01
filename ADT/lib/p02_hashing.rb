class Fixnum
  # Fixnum#hash already implemented for you
end

class Array

  def hash
    sum_hash =0
    self.each_with_index do |number,i|
      sum_hash += number.hash * (i+1)
    end
    sum_hash
  end

end

class String
  def hash
    sum_hash = 0
    alphabet = ("A".."z").to_a
    self.each_char.with_index do |char,i|
      indx = alphabet.index(char)+1
      sum_hash += indx.hash * i
    end
    sum_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 1
    self.each do |k,v|
      k = k.to_s if k.is_a?(Symbol)
      result += (k.hash * v.hash) * self.length
    end
    result
  end
end
