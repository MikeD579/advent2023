File.open("6\\input.txt") do |file|
    lines = file.readlines
    times = lines[0].scan(/\s[0-9]+/).map {|num| num.to_i}
    distances = lines[1].scan(/\s[0-9]+/).map {|num| num.to_i}

    nums = []
    for raceIndex in 0..(times.length-1) do
        timeLimit = times[raceIndex]
        distanceToBeat = distances[raceIndex]
        range = [0,0]
        for i in (0).upto(timeLimit) do
            dist = ((timeLimit - i) * i)
            if dist > distanceToBeat then
                range[0] = i
                break
            end
        end
        for i in timeLimit.downto(0) do
            dist = ((timeLimit - i) * i)
            if dist > distanceToBeat then
                range[1] = i
                break
            end
        end
        nums.push(range[1] - range[0] + 1)
    end
    puts nums.inject(:*)

    # Part 2
    timeLimit = times.join.to_i
    distanceToBeat = distances.join.to_i
    range = [0,0]
    for i in (0).upto(timeLimit) do
        dist = ((timeLimit - i) * i)
        if dist > distanceToBeat then
            range[0] = i
            break
        end
    end
    for i in timeLimit.downto(0) do
        dist = ((timeLimit - i) * i)
        if dist > distanceToBeat then
            range[1] = i
            break
        end
    end

    puts range[1] - range[0] + 1


end