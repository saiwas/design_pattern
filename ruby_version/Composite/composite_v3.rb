# -*- encoding: utf-8 -*-

########################## 组合模式  ########################
# 需求 : 蛋糕制作
#

# 未完成任务的抽象类
class Task
  attr_reader :name

  def initialize(name)
    @name = name
    puts @name
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

class AddLiquidsTask < Task
  def initialize
    super('Add Liquids')
  end

  def time_required
    1.0 # 加水 1min
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

class FillPanTask < Task
  def initialize
    super('Fill Pan!')
  end

  def time_required
    15.0 # 搅拌 3min
  end
end

class BakeTask < Task
  def initialize
    super('Bake!')
  end

  def time_required
    20.0 # 搅拌 3min
  end
end

class FrostTask < Task
  def initialize
    super('Frost!')
  end

  def time_required
    20.0 # 搅拌 3min
  end
end

class LickSpoonTask < Task
  def initialize
    super('Lick Spoon!')
  end

  def time_required
    2.0 # 搅拌 3min
  end
end

# Composite
class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def << (task)
    @sub_tasks << task
  end

  def [] (index)
    @sub_tasks[index]
  end

  def []= (index, new_value)
    @sub_tasks[index] = new_value
  end

  def time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.time_required }
    time
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make Batter')
    self << AddDryIngredientsTask.new
    self << AddLiquidsTask.new
    self << MixTask.new
  end
end

class MakeCakeTask < CompositeTask
  def initialize
    super('Make Cake')
    self << MakeBatterTask.new
    self << FillPanTask.new
    self << BakeTask.new
    self << FrostTask.new
    self << LickSpoonTask.new
  end
end

####################### 前端/客户端代码 #######################

make_care_task = MakeCakeTask.new
puts make_care_task.time_required
