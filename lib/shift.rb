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
    generate_temp_shifts(@keys)
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

  def generate
    @keys = Array.new(5) { rand(1..9) }
  end

end
