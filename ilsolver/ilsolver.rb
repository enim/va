#!/usr/bin/ruby
# -*- coding: utf-8 -*-

def print_ans(ans)
  for y in ans
    p y
  end
end


def fill(width, line)
  buff = []
  id = 'a'
  for data in line
    buff << id * data
    id = id.succ
  end
  line_str = buff.join(' ')
  padding = ' ' * (width - line_str.size)
  lp = line_str + padding
  rp = padding + line_str
  return lp.split(//), rp.split(//)
end


def solve_with_width_x(data, ans)
  width = data[1].size
  data[0].each_with_index do |line, line_index|
    lp, rp = fill(width, line)
    pos_index = 0
    lp.zip(rp).each do |l, r|
      if l == r && l != ' '
        ans[line_index][pos_index] = 1
      end
      pos_index = pos_index + 1
    end
  end
end

def solve_with_width_y(data, ans)
  width = data[0].size
  data[1].each_with_index do |line, line_index|
    lp, rp = fill(width, line)
    pos_index = 0
    lp.zip(rp).each do |l, r|
      if l == r && l != ' '
        ans[pos_index][line_index] = 1
      end
      pos_index = pos_index + 1
    end
  end
end


data = [
  [[4],[2,2],[1,1],[1,1,1,1],[1,5],[1,4,2],[5,1],[5,1],[7],[5]],
  [[1,1],[2,1],[2,1],[1,4],[1,6],[2,7],[2,6],[2,4],[2,2],[4]]
]

cy = data[0].size
cx = data[1].size

ans = Array.new(cy).map{Array.new(cx,0)}

solve_with_width_x(data, ans)
solve_with_width_y(data, ans)

print_ans(ans)
