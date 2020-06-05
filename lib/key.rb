class Key

  attr_reader :numbers

  def generate
    @numbers = Array.new(5) { rand(1..9) }
  end

end
