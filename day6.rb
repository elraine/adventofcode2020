def part1()
    source = File.open(ARGV.first).read&.split("\n\n").map{
        |group|
            group.split("\n").join.chars.uniq.count
        }.sum
end



def part2()
    source = File.open(ARGV.first).read&.split("\n\n").map{
        |group|
            group.split("\n").map{
                |person|
                person.chars.join.chars
            }.reduce{
                |inter,set|
                inter.intersection(set)
            }.count
        }.sum
end

p part1()
p part2()