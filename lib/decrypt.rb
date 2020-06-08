require './lib/enigma'

enigma = Enigma.new
input = eval(File.read(ARGV[0]))
decrypted_text = enigma.decrypt(input[:encryption], input[:key], input[:date])
File.write(ARGV[1], decrypted_text)
puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
