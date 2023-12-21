class AlmanacMap
    attr_reader :name, :link, :item
    def initialize(name, sourceArray, destinationArray, rangeArray)
        @name = name
        @map = {
            :sourceArray => sourceArray,
            :destinationArray => destinationArray,
            :rangeArray => rangeArray,
            :length => rangeArray.length
        }
        @link = nil
        @item = nil
    end

    def setItem(item)
        @item = item
    end

    def setLink(link)
        @link = link
    end

    def next()
        if @item && @link.respond_to?("setItem") then
            @link.setItem(mapItem(@item))
        end
        return link
    end

    def mapItem(item)
        item = item.to_i
        for i in 0..@map[:length] do 
            sourceRangeStart = @map[:sourceArray][i].to_i
            sourceRangeEnd = @map[:sourceArray][i].to_i + (@map[:rangeArray][i].to_i - 1)
            sourceRange = sourceRangeStart..sourceRangeEnd
            case item when sourceRange
                index = item - sourceRangeStart
                return @map[:destinationArray][i].to_i + index
            end
        end

        return item
    end
end

File.open("5\\input.txt") do |file|
    blocks = file.read.split("\n\n")
    seeds = blocks.shift.scan(/[0-9]+/)
    firstMap = nil
    lastMap = nil
    i = 0
    for block in blocks do
        map = block.split("\n")
        name = map.shift.split[0]

        destination, source, range = [],[],[]
        map.each do |nums|
            nums = nums.split
            destination.push(nums[0])
            source.push(nums[1])
            range.push(nums[2])
        end

        if lastMap.respond_to? "name" then
            newMap = AlmanacMap.new(name, source, destination, range)
            lastMap.setLink(newMap)
            lastMap = newMap
        else
            firstMap = AlmanacMap.new(name, source, destination, range)
            lastMap = firstMap
        end
    end
    lastMap.setLink(AlmanacMap.new('location',[],[],[]))

    location = []
    seeds.each do |seed|
        currentMap = firstMap
        currentMap.setItem(seed)
        while true do
            if not currentMap.link then
                break
            end
            currentMap = currentMap.next
        end
        location.push(currentMap.item)
    end
    puts location.sort[0]

    # Part 2

    ##### current code takes too long to run!!!!!
    # location = []
    # seeds.each_slice(2) do |startSeed, range|
    #     startSeed = startSeed.to_i
    #     range = range.to_i
    #     endSeed = startSeed + range - 1
    #     for n in startSeed..endSeed do
    #         currentMap = firstMap
    #         currentMap.setItem(n)
    #         while true do
    #             if not currentMap.link then
    #                 break
    #             end
    #             currentMap = currentMap.next
    #         end
    #         if location.length == 0 then
    #             location.push(currentMap.item)
    #             next
    #         end
    #         if currentMap.item < location.last then
    #             location.pop
    #             location.push(currentMap.item)
    #         end
    #     end
    # end
    # puts location

    
end