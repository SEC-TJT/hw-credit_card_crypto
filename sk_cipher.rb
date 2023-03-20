# frozen_string_literal: true

require 'rbnacl'
require 'base64'

# Modern Symmetric Key Cipher
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.strict_encode64(key)
  end

  def self.encrypt(document, key)
    key_origin = Base64.strict_decode64(key)
    box = RbNaCl::SimpleBox.from_secret_key(key_origin)
    ciphers = box.encrypt(document)
    Base64.strict_encode64(ciphers)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
  end

  def self.decrypt(encrypted_cc, key)
    key_origin = Base64.strict_decode64(key)
    encrypted_cc_origin = Base64.strict_decode64(encrypted_cc)
    box = RbNaCl::SimpleBox.from_secret_key(key_origin)
    box.decrypt(encrypted_cc_origin)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
  end
end
