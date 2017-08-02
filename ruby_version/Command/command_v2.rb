# -*- encoding: utf-8 -*-

########################## 命令模式 ########################
# 需求 : 创建按钮类, 但子类将会大而且泛滥
#

class SlickButton
  attr_accessor :command

  def initialize(&block)
    @command = block
  end

  def on_button_push
    # puts "按钮被按下,正在进行按下功能的处理!"
    @command.call if @command
  end
end

####################### 前端/客户端代码 #######################

save_button = SlickButton.new { puts "Executing Save Command!" }
write_file_button = SlickButton.new { puts "Executing Write File Command!" }

save_button.on_button_push
write_file_button.on_button_push
