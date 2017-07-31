# -*- encoding: utf-8 -*-

########################## 观察者模式 ########################
# 需求 : 当Fred 进行一次加薪时,他得Employee记录向全世界宣布"加薪消息,所有对 Fred 经济状况感兴趣的都会收到Fred薪金浮动情况
#

require 'observer'
class Employee
  include Observable

  attr_reader :name
  attr_accessor :title, :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts("Cut a new check for #{changed_employee.name}!")
    puts("His salary is now #{changed_employee.salary}!")
  end
end

class TaxMan
  def update(changed_employee)
    puts "Send #{changed_employee.name} a new tax bill!"
  end
end

####################### 前端/客户端代码 #######################

payroll = Payroll.new
tax_man = TaxMan.new

fred = Employee.new('Fred', 'Johnny', 30000)
fred.add_observer(payroll)
fred.add_observer(tax_man)

fred.salary = 35000
