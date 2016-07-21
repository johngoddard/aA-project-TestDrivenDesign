def dups(arr)
  clean = []
  arr.each{|el| clean << el unless clean.include?(el)}
  clean
end


def two_sum(arr)
  # iterate twice through arr
  indices = []
  (0...arr.size).each do |i|
    ((i+1)...arr.size). each do |j|
      indices << [i, j] if arr[i] + arr[j] == 0
    end
  end
  indices
end

def my_transpose(arr)
  columns = Array.new(arr[0].size){Array.new(arr.size)}

  arr.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      columns[col_idx][row_idx] = col
    end
  end

  columns
end


def stock_picker(arr)
  # keep track of
  pair_diff_hash = Hash.new

  (0...(arr.size-1)).each do |start_date|
    ((start_date+1)...arr.size).each do |end_date|
      pair_diff_hash[[start_date, end_date]] = arr[end_date] - arr[start_date]
    end
  end

  dates_most_money_arr = pair_diff_hash.max_by {|pair, diff| diff}

  dates_most_money_arr[1] < 1 ? []: dates_most_money_arr[0]
end
