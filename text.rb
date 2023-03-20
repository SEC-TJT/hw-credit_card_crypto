# require_relative './double_trans_cipher'

# class TranspositionCipher
#   include DoubleTranspositionCipher
# end
require_relative './sk_cipher'
key = ModernSymmetricCipher.generate_new_key
ciphers = ModernSymmetricCipher.encrypt('helloIamtaylorwuhelloIamtaylorwu', key)
puts ModernSymmetricCipher.decrypt(ciphers, key)
# ans = DoubleTranspositionCipher.encrypt('helloIamtaylorwuhelloIamtaylorwu', 1)
# ans = DoubleTranspositionCipher.encrypt(
#   '{"number":"4916603231464963","expiration_date":"Mar-30-2020","owner":"Soumya Ray","credit_network":"Visa"}', 220
# )
# puts ans
# a = [ 1, 2, 3,4 ]
# key=200
# srand(key)
# puts a.shuffle(random: Random.new(7))
# puts a.shuffle(random: Random.new(7))

# puts a.shuffle(random: Random.new(10))
# puts a.shuffle(random: Random.new(10))
# revert = DoubleTranspositionCipher.decrypt(ans, 220)
# puts revert
# puts TranspositionCipher.methods
# ans = TranspositionCipher.encrypt('hello', 1)
# puts ans
# revert = TranspositionCipher.decrypt(ans, 1)
# puts revert
