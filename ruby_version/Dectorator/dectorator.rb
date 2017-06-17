# -*- encoding: utf-8 -*-

########################## 装饰模式 ########################
# 需求 : 简单计算器
#
# 装饰模式是为已有功能动态地添加更很多功能的一种方式。
# 当系统需要新功能的时候，是向旧的类中添加新的代码，这些新加的代码通常修饰了原有类的核心职责或主要行为。
# 在主类中加入了新的字段、新的方法和新的逻辑，从而增加了增加了主类的复杂度。这些新加入的东西仅仅是为了满足一些只在某些特定情况下才会执行的特殊行为的需要。
# 装饰模式提供了一个非常好的解决方案，把每个要装饰的
# 功能放在单独的类中，并让这个类包装它所修饰的对象，因此，当需要执行特殊行为时，客户代码就可以运行时根据需要有选择地、按顺序地使用装饰对象功能包装对象了。
#
# 优点
# 把类中的装饰功能从类中搬移去除，简化原有的类。有效地把类的核心职责和装饰功能区分开了，而且可以去除相关类中重复的装饰逻辑。
# 有效地把类的核心职责和装饰功能区分开,去掉类的重复逻辑

class Person
	attr_accessor :name
	
	def initialize(name=nil)
		@name = name
	end
	
	def show
		puts "***** 装扮的#{@name} *****"
	end
end

class Finery < Person
	def decorate(componet)
		@componet = componet
	end

	def show
		@componet.show if @componet
	end
end

class TShirts < Finery
	def show
		super
		puts "大T恤"
	end
end

class BigTrouser < Finery
	def show
		super
		puts "垮裤"
	end
end

class Sneakers < Finery
	def show
		super
		puts "破球鞋"
	end
end

class Suit < Finery
	def show
		super
		puts "西装"
	end
end

class Tie < Finery
	def show
		super
		puts "领带"
	end
end


class LeatherShoes < Finery
	def show
		super
		puts "皮鞋"
	end
end

####################### 前端/客户端代码 #######################
person = Person.new("johnny")

puts  "****** 第一种装扮 ******"
ts = TShirts.new
bt = BigTrouser.new
sk = Sneakers.new
ts.decorate person
bt.decorate ts
sk.decorate bt
sk.show

puts "\n\n"
puts  "****** 第二种装扮 ******"
suit = Suit.new
tie = Tie.new
ls = LeatherShoes.new
suit.decorate person
tie.decorate suit
ls.decorate tie
ls.show

puts "\n\n"
puts "****** Johnny don't like above 2 dressing. But Vincent like them! ******"
person.name = "Vincent"
ls.show
