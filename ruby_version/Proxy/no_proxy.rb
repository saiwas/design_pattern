# -*- encoding: utf-8 -*-

########################## 代理模式 ########################
# 需求 : Johnny想认识Joey, 替他追Joey（送洋娃娃，送花，送巧克力）
#
# No proxy

#追求者类
class Pursuit
	attr_accessor :name
	def initialize(mm)
		@mm = mm
	end
	
	def give_dolls
		puts "#{self.name}送#{@mm.name}洋娃娃"
	end
	
	def give_flowers
		puts "#{self.name}送#{@mm.name}鲜花"
	end
	
	def give_chocolate
		puts "#{self.name}送#{@mm.name}巧克力"
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

gg = Pursuit.new(mm)        # 要是Johnny和Joey 不认识呢? 怎么能找到她呢？):
gg.name = 'Johnny'    # 追求者
gg.give_dolls
gg.give_flowers
gg.give_chocolate
