# -*- encoding: utf-8 -*-

########################## 代理模式 ########################
# 建立代理

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

class BankAccountProxy
	def initialize(real_object)
		@real_object = real_object
	end

	def balance
		@real_object.balance
	end

	def deposit(amount)
		@real_object.deposit(amount)
	end

	def withdraw(amount)
		@real_object.withdraw(amount)
	end
end

####################### 前端/客户端代码 #######################
account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)
puts "account.balance : #{account.balance}"

proxy = BankAccountProxy.new(account)
proxy.deposit(60)
proxy.withdraw(20)
puts "proxy.balance : #{proxy.balance}"
