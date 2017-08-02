# -*- encoding: utf-8 -*-

########################## 命令模式 ########################
# 需求 : 记录操作
#

class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
  end
end

class CreateFile < Command
  def initialize(path, contents)
    super("Crate File: #{ path }")
    @path = path
    @contents = contents
  end

  def execute
    # f = File.open(@path, 'w')
    # f.write(@contents)
    # f.close

    puts "New a file in : #{@path}"
    puts "Writing in : #{@contents}"
  end
end

class DeleteFile < Command
  def initialize(path)
    super("Delete File: #{ path }")
    @path = path
  end

  def execute
    # File.delete(@path)

    puts "Deleting a file in : #{@path}"
  end
end

class CopyFile < Command
  def initialize(source, target)
    super("Copy File: #{ source } To #{ target }")
    @source = source
    @target = target
  end

  def execute
    # FileUtile.copy(@source, @target)

    puts "Copying a file from #{ @source } To #{ @target }"
  end
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def << (cmd)
    @commands << cmd
  end

  def add_command(cmd)
    self << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def description
    description = ''
    @commands.each { |cmd| description += cmd.description + "\r\n" }
    description
  end
end

####################### 前端/客户端代码 #######################

cmds = CompositeCommand.new

cmds << CreateFile.new('file1.txt', 'Hello World!')
cmds << CopyFile.new('file1.txt', 'file2.txt')
cmds << DeleteFile.new('file1.txt')

cmds.execute
puts "===================================== description ====================================="
puts cmds.description
