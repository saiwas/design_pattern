# -*- encoding: utf-8 -*-

########################## 观察者模式 ########################
# 需求 : 当Fred 进行一次加薪时,他得Employee记录向全世界宣布"加薪消息,所有对 Fred 经济状况感兴趣的都会收到Fred薪金浮动情况
#

module Subject
  def initialize
    @observers = []
  end

  def add_observer(&observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.call(self)
    end
  end
end

class Employee
  include Subject

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

####################### 前端/客户端代码 - 变异 #######################

fred = Employee.new('Fred', 'Johnny', 30000)

fred.add_observer do |changed_employee|
  puts("Cut a new check for #{changed_employee.name}!")
  puts("His salary is now #{changed_employee.salary}!")
  puts "Send #{changed_employee.name} a new tax bill!"
end

fred.salary = 35000
