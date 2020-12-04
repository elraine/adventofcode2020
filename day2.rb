def sol1()
source = File.open("day2.txt")
content = source.readlines

@globcount = 0

content.each{
    |x|
    line = x.split(" ")
    count = line[0].split("-")
    mincount = count[0].to_i
    maxcount = count[1].to_i
    char = line[1].chomp(":")
    password = line[2]
    # puts "#{mincount}, #{maxcount}, #{char}, #{password}"
    valueIn = password.count(char)
    # puts valueIn
    if((valueIn >= mincount) && (valueIn <= maxcount) )
        @globcount +=1
        # puts "globcount #{@globcount}"
    end
    }
    return @globcount.to_s
end

# puts "globcount sol1 #{sol1()}"


def sol2()
    source = File.open("day2.txt")
    content = source.readlines
    @globcount = 0

    content.each{
        |x|
        line = x.split(" ")
        count = line[0].split("-")
        pos1 = count[0].to_i
        pos2 = count[1].to_i
        char = line[1].chomp(":")
        password = line[2]
        if((password[pos1-1] == char) ^ (password[pos2-1] == char))
            @globcount +=1
        end
    }
    return @globcount
end

puts "globcount sol2 #{sol2()}"