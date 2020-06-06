require 'date'

class Offset

  attr_reader :date, :numbers, :a_key, :b_key, :c_key, :d_key

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
    @numbers = "placeholder"
    find_offset
  end

  def find_offset
    squared = @date.to_i*@date.to_i
    @numbers = squared.to_s[-4..-1]
  end

  def assign
    @a_key = @numbers[0].to_s
    @b_key = @numbers[1].to_s
    @c_key = @numbers[2].to_s
    @d_key = @numbers[3].to_s
  end

end
