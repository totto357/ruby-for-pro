print "Text?: "
text = gets.chomp

begin
  print "Pattern?: "
  pattern = gets.chomp

  regexp = Regexp.new(pattern)
rescue => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matched = text.scan(regexp)
unless matched.empty?
  puts "Matched: #{matched.join(", ")}"
else
  puts "Nothing matched."
end
