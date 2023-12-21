inputFile = File.open("1\\input.txt")

total = 0

for line in inputFile.readlines do
    numbers = line.gsub(/[^0-9]/ , '')

    number = ''
    number << numbers[0] << numbers[-1]

    total += number.to_i
end

puts total

inputFile.close

#
# Part Two
#
inputFile = File.open("1\\input.txt")

total = 0
numberList = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
        'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

for line in inputFile.readlines do
    indexList = []

    for num in numberList do
        index = line.index(num)
        if (index)
            indexList.append(index)
        end
    end

    indexList.sort

    number = ''
    number << numbers[0] << numbers[-1]

    total += number.to_i
end

puts total

inputFile.close