require './lib/enigma'

enigma = Enigma.new
input = eval(File.read(ARGV[0]))
decrypted_text = enigma.decrypt(input[:encryption], ARGV[2], ARGV[3])
File.write(ARGV[1], decrypted_text)
puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
