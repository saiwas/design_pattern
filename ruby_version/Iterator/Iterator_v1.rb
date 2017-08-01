# -*- encoding: utf-8 -*-

########################## 迭代模式 ########################
# 需求 : 外部迭代器
#

class ArrayIterator
  def initialize(arrary)
    @arrary = arrary
    @index = 0
  end

  def has_next?
    @index < @arrary.length
  end

  def item
    @arrary[@index]
  end

  def next_item
    value = @arrary[@index]
    @index += 1
    value
  end
end

####################### 前端/客户端代码 #######################

# arrary = ['red','green', 'blue']

arrary = 'ABCDEFG'

i = ArrayIterator.new(arrary)

while i.has_next?
  puts "Item: #{ i.next_item }"
end
