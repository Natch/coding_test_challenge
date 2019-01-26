# 整数部を３桁カンマ区切りにする
a = '-233457.23'

def float_num?(str)
  str.split('.').size > 1 ? true : false
end

def exist_negative_operator?(str)
  if float_num? str
    str.to_f < 0 ? true : false
  else
    str.to_i < 0 ? true : false
  end
end

negative = exist_negative_operator? a
operator = negative ? '-' : ''
a.delete!(operator) if negative

insert_index = []
if float_num? a
  splited_array = a.split('.')

  splited_array[0].each_char.with_index do |char, i|
    if (i+1) % 4 == 0
      insert_index << -(i+1)
    end
  end
  insert_index.each do |index|
    splited_array[0].insert(index, ',')
  end
  splited_array[0].insert(0, operator) if negative
  puts splited_array.join('.')
else
  a.each_char.with_index do |char, i|
    if (i+1) % 4 == 0
      insert_index << -(i+1)
    end
  end
  insert_index.each do |index|
    a.insert(index, ',')
  end
  a.insert(0, operator) if negative
  puts a
end