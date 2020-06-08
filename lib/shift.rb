require './lib/key'
require './lib/offset'

class Shift

  attr_reader :final_shift, :keys, :offsets, :date

  def initialize(date, keys = nil)
    @final_shift = []
    @keys = keys
    @offsets = offsets
    combine(keys, date)
  end

  def combine(keys, date)
    if keys.nil?
      generate
    else
      keys_to_array(keys)
    end
    @offsets = create_offset(date)
    generate_temp_shifts(keys)
    @final_shift.map.with_index do |shift, shift_index|
      @final_shift[shift_index] += offsets[shift_index].to_i
    end
  end

  def create_offset(date)
    last_four(square(date))
  end

  def square(date)
    date.to_i * date.to_i
  end

  def last_four(date)
    date.to_s[-4..-1]
  end

  def generate_temp_shifts(keys)
    @keys.each_cons(2) do |pair|
      final_shift << pair.join.to_i
    end
  end

  def keys_to_array(keys)
    @keys = keys.chars.map { |key| key.to_i }
  end

  # def assign_key(given_key = nil)
  #   if given_key.nil?
  #     @a_key = @numbers[0].to_s + @numbers[1].to_s
  #     @b_key = @numbers[1].to_s + @numbers[2].to_s
  #     @c_key = @numbers[2].to_s + @numbers[3].to_s
  #     @d_key = @numbers[3].to_s + @numbers[4].to_s
  #   else
  #     keys = given_key.chars.map {|key| key.to_i }
  #     @a_key = keys[0].to_s + keys[1].to_s
  #     @b_key = keys[1].to_s + keys[2].to_s
  #     @c_key = keys[2].to_s + keys[3].to_s
  #     @d_key = keys[3].to_s + keys[4].to_s
  #   end
  # end
  #
  # def assign_offset
  #   @a_offset = @numbers[0].to_s
  #   @b_offset = @numbers[1].to_s
  #   @c_offset = @numbers[2].to_s
  #   @d_offset = @numbers[3].to_s
  # end

  # def initialize(date = Date.today.strftime("%d%m%y"))
  #   @date = date
  #   @numbers = "placeholder"
  # end

  # def find_offset
  #   squared = @date.to_i*@date.to_i
  #   @numbers = squared.to_s[-4..-1]
  # end

  # def initialize
  #   @numbers = []
  # end

  def generate
    @keys = Array.new(5) { rand(1..9) }
  end

end
