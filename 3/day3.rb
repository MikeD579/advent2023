def getSymbol(line, startIndex, endIndex)

end

File.open("3\\input.txt") do |file|
    lines = file.readlines.map {|lines| lines.strip}

    totalCount = 0
    lines.each_with_index do |line, row|
        # puts "line at row=#{row}: #{line}"

        line.scan(/[0-9]+/) do |number|
            # this gets index of last matched number
            numberIndex = Regexp.last_match.offset(0)[0]
            length = number.length
            
            # scan for a symbol around the number
            startIndex = (numberIndex-1 < 0) ? 0 : numberIndex - 1
            endIndex = (numberIndex+length >= line.length) ? line.length-1 : numberIndex + length
            rowBefore = row - 1 if (row-1 >= 0)
            rowAfter = row + 1 if (row+1 < lines.length)

            # if symbol befor, after, above, or below
            if line[startIndex].match(/[^0-9|^.|^\n]/) || 
                line[endIndex].match(/[^0-9|^.|^\n]/) ||
                (rowBefore && lines[rowBefore][startIndex..endIndex].match(/[^0-9|^.]/)) ||
                (rowAfter && lines[rowAfter][startIndex..endIndex].match(/[^0-9|^.]/))
            then
                # puts "match: #{number}"
                totalCount += number.to_i
                next
            end
        end
    end
    puts totalCount

    # Part Two
    gearRatio = 0
    # Search for two numbers touching the gear(*)
    lines.each_with_index do |line, row|
        # puts "line at row=#{row}: #{line}"

        line.scan(/*/) do |gear|
            numberIndex = Regexp.last_match.offset(0)[0]
            
            # scan for all numbers around the gear

            #we still need this for the number's indexes
            # startIndex = (numberIndex-1 < 0) ? 0 : numberIndex - 1
            # endIndex = (numberIndex+length >= line.length) ? line.length-1 : numberIndex + length
            # rowBefore = row - 1 if (row-1 >= 0)
            # rowAfter = row + 1 if (row+1 < lines.length)

            # we need to find if the number is touching before, after, above, or below
            if line[startIndex].match(/[^0-9|^.|^\n]/) || 
                line[endIndex].match(/[^0-9|^.|^\n]/) ||
                (rowBefore && lines[rowBefore][startIndex..endIndex].match(/[^0-9|^.]/)) ||
                (rowAfter && lines[rowAfter][startIndex..endIndex].match(/[^0-9|^.]/))
            then
                # puts "match: #{number}"
                # Multiply them and add them up
                gearRatio += # num1 * num2
                next
            end
        end
    end
    puts gearRatio
end