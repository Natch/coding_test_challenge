# 文字列の完全一致
# 要件:先頭から取り出し、末尾に加える
# 入力１:文字数
# 入力２:正しい文字列
# 入力３:初期文字列
# 出力:試行回数

input = '4 abab baba'

input_array = input.split(" ")
str_num, correct_string, input_string = input_array

rotate_cnt = 0
until input_string == correct_string
  sliced_char = input_string.slice!(0, 1)
  input_string.insert(-1, sliced_char)
  rotate_cnt += 1
end
puts rotate_cnt