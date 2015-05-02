class Array

  def my_uniq
    arr = []
    self.each do |el|
      arr << el unless arr.include?(el)
    end

    arr
  end

  def two_sum
    sum_pos = []
    self.each_with_index do |el, idx|
      (idx+1...self.length).each do |idx2|
        if el + self[idx2] == 0
          sum_pos << [idx, idx2]
        end
      end
    end
    sum_pos
  end
end

def my_transpose(matrix)
  new_matrix = Array.new(matrix[0].length) {Array.new()}
  matrix.each_with_index do |row, i|
    row.each_with_index do |el, j|
      new_matrix[j] << el
    end
  end
  new_matrix
end

def stock_picker(price_by_day)
  best_days = [0, 1]
  price_by_day.each_with_index do |el, i|
    (i+1...price_by_day.length).each do |j|
      if price_by_day[j] - el >
        price_by_day[best_days.last] - price_by_day[best_days.first]
        best_days[0] = i
        best_days[1] = j
      end
    end
  end

  best_days  
end
