source = File.new("day4ex.txt")

content = source.read.split("\n\n").map{
    # reformatting the file to array of hash containing each characteristic
    |passport|
    passport.sub!("\n"," ").split(" ").map{
        |charac|
        charac.split(":")
    }.to_h
}
p content