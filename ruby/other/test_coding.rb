# 重複文字の数を出力する
a = 'bdbcc'

searched = String.new(a)
result = 0
out = 0

a.chars do |search_char|
  searched.slice!(search_char)
  searched.chars do |each_char|
    if search_char == each_char
      result += 1
    end
  end
  if result > 0
    out += 1
    result = 0
  end
  if searched.size > 0
    searched.delete!(search_char)
  end
end
puts out