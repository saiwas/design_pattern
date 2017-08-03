# -*- encoding: utf-8 -*-

########################## 适配器模式 ########################
# 需求 : 加密文件类
#

class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      encrypted_char = clear_char.ord ^ @key[key_index].ord
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end

    ch = @string[@position]
    @position += 1
    
    ch
  end

  def eof?
    @position >= @string.length
  end
end

####################### 前端/客户端代码 #######################

encrypter = Encrypter.new("Encrypter key")
reader = StringIOAdapter.new('This is Johnny key')
writer = File.open('message.encrypted', 'w')
encrypter.encrypt(reader, writer)
