require './lib/key'
require './lib/offset'

class Shift

  attr_reader :a_shift, :b_shift, :c_shift, :d_shift

  def combine(key, offset)
    @a_shift = (key.a_key.to_i + offset.a_offset.to_i)
    @b_shift = (key.b_key.to_i + offset.b_offset.to_i)
    @c_shift = (key.c_key.to_i + offset.c_offset.to_i)
    @d_shift = (key.d_key.to_i + offset.d_offset.to_i)
  end

end
