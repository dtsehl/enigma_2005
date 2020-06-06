module Assignable

  def assign_key
    @a_key = @numbers[0].to_s + @numbers[1].to_s
    @b_key = @numbers[1].to_s + @numbers[2].to_s
    @c_key = @numbers[2].to_s + @numbers[3].to_s
    @d_key = @numbers[3].to_s + @numbers[4].to_s
  end

  def assign_offset
    @a_offset = @numbers[0].to_s
    @b_offset = @numbers[1].to_s
    @c_offset = @numbers[2].to_s
    @d_offset = @numbers[3].to_s
  end

end
