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

####################### 前端/客户端代码 #######################

reader = File.open('message.txt')
writer = File.open('message.encrypted', 'w')
encrypter = Encrypter.new('secret key')
encrypter.encrypt(reader, writer)
