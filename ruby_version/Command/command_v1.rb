# -*- encoding: utf-8 -*-

########################## 命令模式 ########################
# 需求 : 创建按钮类, 但子类将会大而且泛滥
#

class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def on_button_push
    # puts "按钮被按下,正在进行按下功能的处理!"
    @command.execute if @command
  end
end

class SaveCommand
  def execute
    puts "Executing Save Command !"
  end
end

class WriteFileCommand
  def execute
    puts "Executing Writing File Command !"
  end
end

####################### 前端/客户端代码 #######################

SlickButton.new(SaveCommand.new).on_button_push

SlickButton.new(WriteFileCommand.new).on_button_push
