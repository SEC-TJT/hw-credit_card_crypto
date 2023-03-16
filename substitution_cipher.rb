# frozen_string_literal: true

module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      result = ''
      document.each_char do |char|
        if char.ord.between?(32, 126)
          shifted_char = caesar(char, key)
          result += shifted_char
        else
          result += char
        end
      end
      result
    end

    def self.caesar(char, key)
      ((char.ord - 32 + key) % 95 + 32).chr
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      encrypt(document, -key)
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      rng = Random.new(key)
      lookup_table = (0..127).to_a.shuffle(random: rng)
      encrypted_doc = ''
      document.to_s.chars do |char|
        encrypted_doc += lookup_table[char.ord].chr
      end
      encrypted_doc
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      rng = Random.new(key)
      lookup_table = (0..127).to_a.shuffle(random: rng)
      decrypted_doc = ''
      document.to_s.chars do |char|
        decrypted_doc += lookup_table.index(char.ord).chr
      end
      decrypted_doc
    end
  end
end
