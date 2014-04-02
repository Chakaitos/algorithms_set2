class MyHash
  def initialize
  	@array = Array.new(64){[]}
    @id = 0
  end

  def find_index(key)
  	key.hash % @array.size
  end

  def []=(key, value) 							 # Big O = O(1)
  	location = find_index(key)
    is_new_id = true

    @array[location].each do |elem|
      if elem[0] == key
        elem[1] = value
        is_new_id = false
        return elem[1]   # returns value for matching array
      end
    end
    @array[location] << ([key, value]) 
    @id += 1 if is_new_id
    if @id >= (@array.size / 2)
      new_size = @array.size * 2
      rehash(new_size)
    end
  end

  def [](key)
  	location = find_index(key)       # Big O = O(1)
  	@array[location].each do |elem|
      if elem[0] == key
        return elem[1]   # returns value for matching array
      end
    end
    return nil
  end

  def rehash(new_size)
    old_array = @array
    @array = Array.new(new_size){[]}

    old_array.each do |elem|
      if elem != []
        elem.each do |x|
          self[x[0]] = x[1]
        end
      end
    end
  end
end
