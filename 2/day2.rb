def getGameId(line)
    lineSplit = line.split(':')

    return lineSplit[0].split()[1]
end

def getGameData(line)
    lineSplit = line.split(':')

    return lineSplit[1].strip.split(/,\s|;\s/)
end

File.open("2\\input.txt") do |file|
    limits = {
        'red':12,
        'green':13,
        'blue':14,
    }
    lines = file.readlines
    addGame = 0

    for line in lines do
        gameId = getGameId(line)
        gameData = getGameData(line)
        
        isValid = true
        for color in gameData do
            count = color.split[0]
            color = color.split[1]

            puts color
            puts limits[color.to_sym]
            if count.to_i > limits[color.to_sym] then
                isValid = false
                break
            end
        end
        if isValid then
            addGame += gameId.to_i
        end
    end

    puts addGame
end

