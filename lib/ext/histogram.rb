class Histogram
  def self.go(array, sort_by_count = true)
    aggregated = Hash.new(0)
    longest_item = 0
    numbers = array.first.is_a?(Numeric)
    
    sum = 0
    
    array.each do |item|
      length = item.to_s.length
      if length > longest_item
        longest_item = length
      end
      aggregated[item] += 1
      if numbers
        sum += item
      end
    end
    
    
    max_value = aggregated.values.max
    
    max_bar_width = 40
    if max_value > max_bar_width
      adjust = max_bar_width.to_f / max_value
    else
      adjust = 1
    end
    
    hist = 
      if sort_by_count
        aggregated.to_a.sort_by{|k, v| -v}
      else
        aggregated.to_a.sort
      end
    
    hist.each do |item, count|
      num_spaces = 1 + longest_item - item.to_s.length
      bar_width = (count * adjust).to_i
      puts "#{item}#{' ' * num_spaces}#{'.' * bar_width} (#{count})"
    end
    if numbers
      puts "sum: #{sum}, mean: #{sum.to_f/array.count}"
    end
  end
end