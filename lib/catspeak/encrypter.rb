require 'openssl'

module Encrypter
  def self.cipher(mode, key, text)
    cipher = OpenSSL::Cipher::Cipher.new('bf-cbc').send(mode)
    cipher.key = Digest::SHA256.digest(key)
    cipher.update(text) << cipher.final
  end

  def self.encrypt(key, text)
    cipher(:encrypt, key, text)
  end

  def self.decrypt(key, text)
    cipher(:decrypt, key, text)
  end
end

