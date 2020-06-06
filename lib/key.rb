require './module/assignable'

class Key
  include Assignable

  attr_reader :numbers, :a_key, :b_key, :c_key, :d_key

  def initialize
    @numbers = []
  end

  def generate
    @numbers = Array.new(5) { rand(1..9) }
  end

end
