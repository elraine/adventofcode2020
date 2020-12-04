filename = ARGV.first
source = File.open(filename)
# if source.nil? 
#     p "s"   
# end
# puts "source.respond_to?(:split) #{source.respond_to?(:split)}"
# puts source.class

data = source.read
# puts source.eof?
# puts data.class
nbPP = data.split("\n\n").map{
    # reformatting the file to array of hash containing each characteristic
    |element|
        element.sub!("\n"," ")
        element.split(" ").map{|charac| charac.split(":") }.to_h
}.count{
    |passport|
    passport.length >= 7 and passport.length <= 8 and passport.has_key?("byr") and passport.has_key?("iyr") and passport.has_key?("eyr") and passport.has_key?("hgt")  and passport.has_key?("hcl") and passport.has_key?("ecl") and passport.has_key?("pid")
    # isValueValid = passport.has_key?("byr")

} 

p nbPP