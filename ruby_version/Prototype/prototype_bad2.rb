# -*- encoding: utf-8 -*-

########################## 原型模式 ########################
# 需求 : 实现一个简历类，必须要有姓名，可以设置性别和年龄，可以设置工作经历。最终需要三个简历
#
# 存在的问题：如果工作经验复杂一些，需要一个类来实现会怎么样

#简历类
class Resume
	attr_accessor :name, :sex, :age, :time_area, :company 

	def initialize(name)
		@name = name
	end

	def set_personal_info(sex, age)
		@sex = sex
		@age = age
	end

	def set_work_experience(time_area, company)
		@time_area = time_area
		@company = company
	end

	def display
		puts "#{name} #{age} #{sex}"
		puts "工作经历 #{time_area} #{company}"
	end
	
	def self_clone
		self.clone
	end
end

####################### 前端/客户端代码 #######################
resume1 = Resume.new('Johnny')
resume1.set_personal_info('男', '29')
resume1.set_work_experience('1998-2000', 'A公司')

resume2 = resume1.self_clone
resume2.set_personal_info('男', '28')

resume3 = resume1.self_clone
resume3.set_personal_info('男', '29')
resume3.set_work_experience('2002-2004', 'B公司')

resume1.display
resume2.display
resume3.display
