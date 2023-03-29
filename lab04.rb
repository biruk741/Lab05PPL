
# Task 1:
$hm = Hash.new

str = 'Hi there, stranger!'

str.each_char { |c|
    if $hm.has_key?(c.downcase)
        $hm[c.downcase] += 1
    else
        $hm[c.downcase] = 1
    end
}

puts $hm

# Task 2:
freqChar = $hm.max_by { |key, value|
    value
}[0]

puts "Most frequent character is #{freqChar}." 

#Task 3:

def aggregate(hash, lambda)
    hash.inject(0) {
        |memo, (key, val)|
    }
end 