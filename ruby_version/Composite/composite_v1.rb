# -*- encoding: utf-8 -*-

########################## 组合模式  ########################
# 需求 : 蛋糕制作
#

# 未完成任务的抽象类
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def time_required
    0.0
  end
end

# 叶子类
class AddDryIngredientsTask < Task
  def initialize
    super('Add Dry Ingredients')
  end

  def time_required
    1.0 # 混合原料 1 min
  end
end

class MixTask < Task
  def initialize
    super('Mix That Batter Up!')
  end

  def time_required
    3.0 # 搅拌 3min
  end
end

class MakeBatterTask < Task
  def initialize
    super('Make Batter')
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.time_required }
    time
  end
end


####################### 前端/客户端代码 #######################

batter_task = MakeBatterTask.new

batter_task.add_sub_task(MixTask.new)
batter_task.add_sub_task(AddDryIngredientsTask.new)

puts batter_task.time_required
