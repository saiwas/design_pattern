# -*- encoding: utf-8 -*-

########################## 代理模式 ########################
# 虚拟代理

class BankAccount
	attr_reader :balance
	
	def initialize(starting_balance = 0)
		@balance = starting_balance
	end

	def deposit(amount)
		@balance += amount
	end

	def withdraw(amount)
		@balance -= amount
	end
end

class VirtualAccountProxy
	def initialize(starting_balance = 0)
		@starting_balance = starting_balance
	end

	def obj
		@obj || (@obj = BankAccount.new(@starting_balance))
	end

	def balance
		obj.balance
	end

	def deposit(amount)
		obj.deposit(amount)
	end

	def withdraw(amount)
		obj.withdraw(amount)
	end
end

####################### 前端/客户端代码 #######################
proxy = VirtualAccountProxy.new(200)
proxy.deposit(60)
proxy.withdraw(20)
puts "proxy.balance : #{proxy.balance}"
