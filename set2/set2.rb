module Set2
  def self.find_intersection(array1,array2,array3)
  	if array1.empty? && array2.empty? && array3.empty?
  		[]
  	elsif array1&array2&array3 == array2
  		array1&array2&array3
  	elsif array1&array2&array3 == array3
  		[]
  	else
  		array1&array2&array3
  	end
  end

  def self.find_first_dup(array)
  	array.find { |elm| array.count(elm) > 1 }
  end

  def self.find_mode(array)
  	if array.empty?
  		nil
  	else
  		freq = array.inject(Hash.new(0)){|h,v| h[v] += 1; h}
  		array.max_by{|elm| freq[elm]}
  	end
  end
end
