# -*- encoding: utf-8 -*-

########################## 迭代模式 ########################
# 需求 : 内部迭代器
#

def for_each_element(arrary)
  i = 0
  while i < arrary.length
    yield(arrary[i])
    i += 1
  end
end

####################### 前端/客户端代码 #######################

arrary = ['red','green', 'blue']

for_each_element(arrary) { |element| puts "This element is #{element}"}
