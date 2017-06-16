# -*- encoding: utf-8 -*-

########################## 策略模式 ########################
# 需求： 商场收银软件，根据客户购买物品的单价和数量，计算费用，会有促销活动，打八折，满三百减一百之类的
#
# CashContext类对不同的CashSuper子类进行了封装，会返回对应的result。
# 也就是对不同的算法进行了封装，无论算法如何变化。都可以使用result得到结果。

# 现金收费抽象类
class CashSuper
	def accept_cash(money)
		raise NotImplementedError.new("#{self.class.name}#accept_cash是抽象方法")
	end
end

# 正常收费子类
class CashNormal < CashSuper
	def accept_cash(money)
		money
	end
end

# 打折收费子类
class CashRebate < CashSuper
	def initialize(mony_rebate)
		@mony_rebate = mony_rebate
	end
	def accept_cash(money)
		money * @mony_rebate
	end
end

# 返利收费子类
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

# 收费工厂类
class CashContext
    def initialize(type)
        case type
        when '正常收费'
            @cs = CashNormal.new()
        when '打8折'
            @cs = CashRebate.new(0.8)
        when '满三百减100'
            @cs = CashReturn.new(300,100)
        end
    end
    
    def result(money)
        @cs.accept_cash(money)
    end
end

####################### 前端/客户端代码 #######################
def client_test_function(money, type)
    CashContext.new(type).result(700)
end

puts client_test_function(700, '正常收费')
puts client_test_function(700, '打8折')
puts client_test_function(700, '满三百减100')
