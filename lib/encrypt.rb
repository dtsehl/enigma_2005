require './lib/enigma'

enigma = Enigma.new
input = File.read(ARGV[0])
encrypted_text = enigma.encrypt(input.chomp)
File.write(ARGV[1], encrypted_text)
puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
