# -*- encoding: utf-8 -*-

########################## 简单工厂模式 ########################
# 需求： 商场收银软件，根据客户购买物品的单价和数量，计算费用，会有促销活动，打八折，满三百减一百之类的
#
# 存在的问题：
# 增加活动的种类时，打五折，满五百减二百，需要在工厂类中添加分支结构。
# 活动是多种多样的，也有可能增加积分活动，满100加10积分，积分一定可以领取活动奖品，这时就要增加一个子类。
# 但是每次增加活动的时候，都要去修改工厂类，是很糟糕的处理方式，面对算法有改动时，应该有更好的办法。

#现金收费抽象类
class CashSuper
	def accept_cash(money)
		raise NotImplementedError.new("#{self.class.name}#accept_cash是抽象方法")
	end
end

#正常收费子类
class CashNormal < CashSuper
	def accept_cash(money)
		money
	end
end

#打折收费子类
class CashRebate < CashSuper

	def initialize(mony_rebate)
		@mony_rebate = mony_rebate
	end

	def accept_cash(money)
		money * @mony_rebate
	end
end

#返利收费子类
class CashReturn < CashSuper
	
	def initialize(mony_condition, mony_return)
		@mony_condition = mony_condition
		@mony_return = mony_return
	end

	def accept_cash(money)
		if money > @mony_condition
			money - (money/@mony_condition) * @mony_return
		end
	end
end

#现金收费工厂类
class CashFactory
	def self.create_cash_accept(type)
		case type
		when '正常收费'
			CashNormal.new()
		when '打8折'
			CashRebate.new(0.8)
		when '满三百减100'
			CashReturn.new(300,100)
		end
	end
end

####################### 前端/客户端代码 #######################
cash0 = CashFactory.create_cash_accept('正常收费')
puts cash0.accept_cash(700)

cash1 = CashFactory.create_cash_accept('打8折')
puts cash1.accept_cash(700)

cash2 = CashFactory.create_cash_accept('满三百减100')
puts cash2.accept_cash(700)
