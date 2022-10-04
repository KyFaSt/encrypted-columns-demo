# load the my encryptor class
require_relative "../lib/encryption/my_attribute_encryptor.rb"
class Article < ApplicationRecord
  encrypts :title, encryptor: Encryption::MyAttributeEncryptor.new
end
