# -*- encoding: utf-8 -*-

########################## 代理模式 ########################
# 需求 : Johnny想认识Joey, 替他追Joey（送洋娃娃，送花，送巧克力）
#
# 代理模式：为其他对象提供一种代理以控制对这个对象的访问。
# 应用场景：
# 1）远程代理  -  为一个对象在不同的地址看空间提供局部代表。可以隐藏一个对象存在于不同地址的事实。
# 2）虚拟代理  -  根据需要创建开销很大的对象。通过他来存放实例化需要很长的真实对象。
# 3）安全代理  -  用来控制真实对象访问时的权限。
# 4）智能代理  -  当调用真实的对象时，代理处理另外一些事。

#公共接口module
module GiveGift
	def give_dolls
		raise NotImplementedError.new("#{self.class.name}#give_dolls接口方法")
	end

	def give_flowers
		raise NotImplementedError.new("#{self.class.name}#give_flowers接口方法")
	end

	def give_chocolate
		raise NotImplementedError.new("#{self.class.name}#give_chocolate接口方法")
	end
end

#追求者类
class Pursuit
	include GiveGift
	attr_accessor :name
	def initialize(mm)
		@mm = mm
	end

	def give_dolls
		puts "替#{name}送#{@mm.name}洋娃娃"
	end

	def give_flowers
		puts "替#{name}送#{@mm.name}鲜花"
	end

	def give_chocolate
		puts "替#{name}送#{@mm.name}巧克力"
	end
end

#代理类
class Proxy
	include GiveGift
	attr_accessor :gg
	def initialize(mm)
		@gg = Pursuit.new(mm)
	end

	def give_dolls
		@gg.give_dolls
	end

	def give_flowers
		@gg.give_flowers
	end

	def give_chocolate
		@gg.give_chocolate
	end
end

#被追求者类
class Girl
	attr_accessor :name
	def initialize
		@name = name
	end
end

####################### 前端/客户端代码 #######################
mm = Girl.new()       # 这里有个mm
mm.name = 'Joey'      # Oh, 天啊！ 她叫Joey

proxy = Proxy.new(mm)         # 婚姻介绍所
proxy.gg.name = 'Johnny'      # 追求者的名字
# 拼命追求中.....
proxy.give_dolls
proxy.give_flowers
proxy.give_chocolate
