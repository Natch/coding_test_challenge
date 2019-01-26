# 野球の審判
# ３ストライクアウトか４ボールを判定
# 入力１：送球数
# 入力N：'strike' or 'ball'
input_lines = gets.to_i

calls = { ball: 'ball!', fourball: 'fourball!', strike: 'strike!', out: 'out!' }
called_count = { ball: 0, strike: 0 }
called_out = []

input_lines.times {
  call = gets.chomp.to_sym

  case call
  when :ball
    called_count[:ball] += 1
    if called_count[:ball] > 3
      called_out << calls[:fourball]
      break
    end
    called_out << calls[:ball]
  when :strike
    called_count[:strike] += 1
    if called_count[:strike] > 2
      called_out << calls[:out]
      break
    end
    called_out << calls[:strike]
  end
}

called_out.each do |call|
  puts call
end
