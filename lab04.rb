
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
    hash.inject(0) {|sum, (key, val)| lambda.call(sum, key, val)}
end 

def isVowel(c)
    return !c.downcase.match(/[aeiou]/).nil?
end

numVowels = -> (sum, key, val) {
    sum ||= 0 # set to 0 if nil, same for the ones below
    if isVowel(key)
        sum + val
    else
        sum
    end
}

numOnce = -> (sum, key, val) {
    sum ||= 0
    if val == 1
        sum + 1
    else
        sum
    end
}

numNonLetters = -> (sum, key, val) {
    sum ||= 0
    is_non_letter = key.match(/[^a-zA-Z]/)
    if is_non_letter
        sum + val
    end
}

hash = $hm

# Test case for numVowels lambda
result = aggregate(hash, numVowels)
puts "Total number of vowels in the hash: #{result}"

# Test case for numNonLetters lambda
result = aggregate(hash, numNonLetters)
puts "Total number of non-letter characters in the hash: #{result}" 

# Test case for numOnce lambda
result = aggregate(hash, numOnce)
puts "Total number of keys with a value of 1 in the hash: #{result}" 
