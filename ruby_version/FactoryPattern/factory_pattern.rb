# -*- encoding: utf-8 -*-

########################## 工厂模式 ########################
# 需求 : 简单计算器
#
# 定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法是一个类的实例化延迟到了子类。
# 相比于简单工厂模式，这里的变化是移除了工厂类，取而代之的是具体的运算工厂，分别是加法工厂、减法工厂、乘法工厂和除法工厂。

#运算类
class Operation
	attr_accessor :number_a,:number_b

	def initialize
		@number_a = number_a
		@number_b = number_b
	end

	def result
		raise NotImplementedError.new("#{self.class.name}#result是抽象方法")
	end
end

#加法类
class OperationAdd < Operation
	def result
		@number_a + @number_b
	end
end

#减法类
class OperationSub < Operation
	def result
		@number_a - @number_b
	end
end

#乘法类
class OperationMul < Operation
	def result
		@number_a * @number_b
	end
end

#除法类
class OperationDiv < Operation
	def result
		raise '除数不能为0' if @number_b == 0    
		@number_a / @number_b
	end
end

# 抽象接口
module FactoryModule
	def create_operation
		raise NotImplementedError.new("#{self.class.name}#create_operation接口方法")
	end
end

#加法工厂
class AddFactory
	include FactoryModule
	
	def create_operation
		OperationAdd.new
	end    
end

#减法工厂
class SubFactory
	include FactoryModule
	
	def create_operation
		OperationSub.new
	end
end

#乘法工厂
class MulFactory
	include FactoryModule
	
	def create_operation
		OperationMul.new
	end    
end

#除法工厂
class DivFactory
	include FactoryModule
	
	def create_operation
		OperationDiv.new
	end    
end

####################### 前端/客户端代码 #######################

factory = AddFactory.new
oper = factory.create_operation
oper.number_a = 1
oper.number_b = 2
puts oper.result
