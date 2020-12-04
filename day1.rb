def sol1()
    source = File.open("day1.txt")
    content = source.readlines.map(&:to_i)
    content.each{
        |x|
        content.each{
            |y|
                if ((x + y) == 2020)
                    puts x
                    puts y
                    puts x*y
                    return
                end
        }
    }
    source.close
    end

def sol2()
    source = File.open("day1.txt")
    content = source.readlines.map(&:to_i)
    content.each{
        |x|
        content.each{
            |y|
            content.each{
                |z|
                if ((x + y + z) == 2020)
                    puts x
                    puts y
                    puts z
                    puts x*y*z
                    return
                end
            }
        }
    }
    source.close
    end

sol1()
sol2()