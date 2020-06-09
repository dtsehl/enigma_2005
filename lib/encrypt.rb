require './lib/enigma'

enigma = Enigma.new
input = File.read(ARGV[0])

  if ARGV.count == 3
    encrypted_text = enigma.encrypt(input.chomp, ARGV[2])
  elsif ARGV.count == 4
    encrypted_text = enigma.encrypt(input.chomp, ARGV[2], ARGV[3])
  else
    encrypted_text = enigma.encrypt(input.chomp)
  end

File.write(ARGV[1], encrypted_text)
puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
