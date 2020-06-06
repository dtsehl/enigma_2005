require 'date'
require './module/assignable'

class Offset
  include Assignable

  attr_reader :date, :numbers, :a_offset, :b_offset, :c_offset, :d_offset

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
    @numbers = "placeholder"
  end

  def find_offset
    squared = @date.to_i*@date.to_i
    @numbers = squared.to_s[-4..-1]
  end

end
