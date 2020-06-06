class Key

  attr_reader :numbers, :a_key, :b_key, :c_key, :d_key

  def initialize
  end

  def generate
    @numbers = Array.new(5) { rand(1..9) }
  end

  def assign
    @a_key = @numbers[0].to_s + @numbers[1].to_s
    @b_key = @numbers[1].to_s + @numbers[2].to_s
    @c_key = @numbers[2].to_s + @numbers[3].to_s
    @d_key = @numbers[3].to_s + @numbers[4].to_s
  end

end
