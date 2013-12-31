class Histogram
  def self.go(array, sort_by_count = true)
    aggregated = Hash.new(0)
    array = array.collect(&:to_s)
    longest_item = array.first.length
    array.each do |item|
      if item.length > longest_item
        longest_item = item.length
      end
      aggregated[item] += 1
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
      num_spaces = longest_item - item.length + 1
      bar_width = (count * adjust).to_i
      puts "#{item}#{' ' * num_spaces}#{'.' * bar_width} (#{count})"
    end
  end
end