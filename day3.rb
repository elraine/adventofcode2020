def sol(goRightBy, goDownBy)
    pattern = File.new("day3.txt")
    content = pattern.readlines
    countTrees = 0
    countEmpty = 0
    x = 0
    y = 0
    content.each{
        |line|
        if y > 0 && (y % goDownBy) == 0
            x = (x + goRightBy) % (line.length-1)
            if line[x] == "#"
                countTrees += 1
                line[x] = "X"
            else 
                countEmpty += 1
                line[x] = "O"
            end
        end
        y += 1
    }
    # puts content
    puts "Trees : #{countTrees} -- Empty #{countEmpty}"
    return countTrees
end

puts sol(1,1) * sol(3,1) * sol(5,1) * sol(7,1) * sol(1,2) 