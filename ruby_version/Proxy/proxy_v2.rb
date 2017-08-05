# -*- encoding: utf-8 -*-

########################## 代理模式 ########################
# 保护代理
#
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
	def initialize(real_object, owner_name)
		@object = real_object
		@owner_name = owner_name
	end

	def balance
		check_access
		@object.balance
	end

	def deposit(amount)
		check_access
		@object.deposit(amount)
	end

	def withdraw(amount)
		check_access
		@object.withdraw(amount)
	end

	def check_access
		if 'Johnny'!= @owner_name
			raise "#{@owner_name} can not access"
		end
	end
end

####################### 前端/客户端代码 #######################
account = BankAccount.new(100)
account.deposit(50)
account.withdraw(10)
puts "account.balance : #{account.balance}"

proxy = BankAccountProxy.new(account,'Johnny')
proxy.deposit(60)
proxy.withdraw(20)
puts "proxy.balance : #{proxy.balance}"

begin
	proxy = BankAccountProxy.new(account,'Adri')
	proxy.deposit(60)
	proxy.withdraw(20)
	puts "proxy.balance : #{proxy.balance}"
rescue => e
	puts e
end