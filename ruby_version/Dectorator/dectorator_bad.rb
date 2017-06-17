# -*- encoding: utf-8 -*-

########################## 装饰模式 ########################
# 需求 : 给人搭配不同的服饰
#
# 如果增加“超人”的装扮，就要修改Person类，违反了开放-封闭原则。

class Person
	attr_accessor :name

	def initialize(name = nil)
		@name = name
		@status = ""
	end

	def wear_t_shirts
		@status << "大T恤\n"
	end

	def wear_big_trouser
		@status << "垮裤\n"
	end

	def wear_sneakers
		@status << "破球鞋\n"
	end

	def wear_suit
		@status << "西装\n"
	end

	def wear_tie
		@status << "领带\n"
	end

	def wear_leather_shoes
		@status << "皮鞋\n"
	end

	def show
		puts "***** 装扮的#{@name} *****"
		puts @status
	end

	def clear_up
		@status = ""
	end
end

####################### 前端/客户端代码 #######################
person = Person.new("Johnny")
puts  "****** 第一种装扮 ******"
person.wear_t_shirts
person.wear_big_trouser
person.wear_sneakers
person.show

puts "\n\n"
puts  "****** 第二种装扮 ******"
xpersonc.clear_up
personxc.wear_suit
person.wear_tie
personxc.wear_leather_shoes
person.show

puts "\n\n"
puts "****** Johnny don't like above 2 dressing. But Vincent like them! ******"
person.name = "Vincent"
puts person.show
