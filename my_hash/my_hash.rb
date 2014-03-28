class MyHash
  def initialize
  	@array = Array.new(64)
  end

  def find_index(key)
  	key.hash % 64
  end

  def []=(key, value) 							 # Big O = O(1)
  	location = self.find_index(key)
  	@array[location] = value
  end

  def [](key)
  	location = self.find_index(key)  # Big O = O(1)
  	@array[location]
  end
end
