require_relative './luhn_validator'
require 'json'
require 'rbnacl'

class CreditCard
  # instance variables with automatic getter/setter methods
  attr_accessor :number, :expiration_date, :owner, :credit_network

  def initialize(number, expiration_date, owner, credit_network)
    @number = number
    @expiration_date = expiration_date
    @owner = owner
    @credit_network = credit_network
  end

  # returns json string
  def to_json
    {
      number: @number,
      expiration_date: @expiration_date,
      owner: @owner,
      credit_network: @credit_network
    }.to_json
  end

  # returns all card information as single string
  def to_s
    JSON.generate(to_json)
  end

  # return a new CreditCard object given a serialized (JSON) representation
  def self.from_s(card_s)
    data = JSON.parse(card_s)
    CreditCard.new(data['number'], data['expiration_date'], data['owner'], data['credit_network'])
  end

  # return a hash of the serialized credit card object
  def hash
    to_json.hash
  end

  # return a cryptographically secure hash
  def hash_secure
    # TODO: implement this method
    #   - Use sha256 to create a cryptographically secure hash.
    #   - Credit cards with identical information should produce the same hash
    message = to_s
    RbNaCl::Hash.sha256(message)
  end
end
