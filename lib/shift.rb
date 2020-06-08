require './lib/key'
require './lib/offset'

class Shift

  attr_reader :a_shift, :b_shift, :c_shift, :d_shift, :numbers

  def initialize
    @numbers = []
  end

  def combine(key, offset)
    @numbers << (key.a_key.to_i + offset.a_offset.to_i)
    @numbers << (key.b_key.to_i + offset.b_offset.to_i)
    @numbers << (key.c_key.to_i + offset.c_offset.to_i)
    @numbers << (key.d_key.to_i + offset.d_offset.to_i)
  end

end
