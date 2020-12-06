def search(whereToSearch, min=0, max = 127)
    # p whereToSearch
    range = (min..max)
    whereToSearch.chars.each{
        |char|
        ["L", "F"].include?(char) ? range = range.first(range.count/2) : range = range.last(range.count/2)
    }
    return range.first.to_i
end

minRow = minCol = 0
maxRow = 127
maxCol = 7

@col = Array.new(maxCol+1,default="o")
seats = Array.new(maxRow+1,default=@col)



source1 = File.open(ARGV.first).readlines(chomp:true).map{
    |pass|
    row = search(pass.slice(0..6), min=minRow, max=maxRow)
    col = search(pass.slice(7..9), min=minCol, max=maxCol)
    # seatId = row * 8 + col
    # p "#{pass} row #{row} at col #{col} -- id #{seatId}"
    seats[row[col]] = "i"
    seatId = row * 8 + col
    # seats[row[col]] = "i"
    # searchColumn(pass.slice(7..9))
}

allBP = ((source1.min..source1.max).to_a) - (minCol..maxCol).to_a - (maxRow*8..maxRow*8+maxCol).to_a

source2 = (allBP - source1.to_a)

p "part 1 : highest seat id #{source1.max}"
p "part 2 : id #{source2.first}"

p seats.join