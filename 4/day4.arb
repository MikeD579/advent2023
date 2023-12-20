File.open('input.txt') do |file|
lines = file.readlines

# loop over all lines
count = 0
for line in lines do 
    # get winning and potential winning numbers
    numbers = line.split(':')[1]
    winningNums = numbers.split('|')[0].strip
    potentialNums = numbers.split('|')[1].strip
    # get numbers how many winning numbers from potential numbers
    winningNums = winningNums.scan(/[0-9][0-9]*/)
    potentialNums = potentialNums.scan(/[0-9][0-9]*/)
    # puts winningNums

    numCount = (winningNums & potentialNums).length
    if numCount > 0
        count += 2 ** (numCount - 1)
    end
end

puts count
# actual winning numbers are going to be the exponent
end