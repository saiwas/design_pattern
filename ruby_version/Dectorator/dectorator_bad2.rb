# -*- encoding: utf-8 -*-

########################## 装饰模式 ########################
# 需求 : 给人搭配不同的服饰
#
# 如果增加超人装扮，确实不需要去修改Person类。存在的问题是，各种衣服是独立的，并且暴露在外边的，就是一件一件穿的，没有顺序，没有控制。

class Person
	attr_accessor :name, :wearing_status
	def initialize(name = nil)
		@name = name
		self.wearing_status = ""
	end

	def show
		puts "***** 装扮的#{@name} *****"
		puts self.wearing_status
	end
end

class Finery
	def show
	  raise NotImplementedError.new("#{self.class.name}#show是抽象方法")
	end
end

class TShirts < Finery
	def show
		"大T恤\n"
	end
end

class BigTrouser < Finery
	def show
		"垮裤\n"
	end
end

class Sneakers < Finery
	def show
		"破球鞋\n"
	end
end

class Suit < Finery
	def show
		"西装\n"
	end
end

class Tie < Finery
	def show
		"领带\n"
	end
end


class LeatherShoes < Finery
	def show
		"皮鞋\n"
	end
end

####################### 前端/客户端代码 #######################
person = Person.new("Johnny")
puts  "****** 第一种装扮 ******"
person.wearing_status << TShirts.new.show
person.wearing_status << BigTrouser.new.show
person.wearing_status << Sneakers.new.show
person.show

puts  "****** 第二种装扮 ******"
person.wearing_status = ""
person.wearing_status << Suit.new.show
person.wearing_status << Tie.new.show
person.wearing_status << LeatherShoes.new.show
person.show

puts "\n\n"
puts "****** Johnny don't like above 2 dressing. But Vincent like them! ******"
person.name = "Vincent"
puts person.show
