# -*- encoding: utf-8 -*-

########################## 简单工厂模式 ########################
# 需求 : 简单计算器
#
# 这样写的好处是降低耦合。
# 比如增加一个开根号运算的时候，只需要在工厂类中添加一个分支，并新建一个开根号类，不会去动到其他的类

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
		raise '除数不能为0' if number_b.zero?    
		@number_a / @number_b
	end
end

###################### 接口类 #######################

#工厂类
class OperationFactory
	def self.create_operate(operate)
		case operate
		when '+'
			OperationAdd.new()
		when '-'
			OperationSub.new()
		when '*'
			OperationMul.new()
		when '/'
			OperationDiv.new()
		end
	end
end


####################### 前端/客户端代码 #######################
oper = OperationFactory.create_operate('/')
oper.number_a = 4
oper.number_b = 2
puts oper.result
