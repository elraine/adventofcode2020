filename = ARGV.first
source = File.open(filename)

data = source.read
nbPP = data.split("\n\n").map{
    # reformatting the file to array of hash containing each characteristic
    |element|
        element.sub!("\n"," ")
        element.split(" ").map{|charac| charac.split(":") }.to_h
}.count{
    |passport|
    # passport keys
    (passport.length >= 7 && passport.length <= 8 && \
        passport.has_key?("byr") && passport.has_key?("iyr") &&  \
        passport.has_key?("eyr") && passport.has_key?("hgt") &&  \
        passport.has_key?("hcl") && passport.has_key?("ecl") &&  \
        passport.has_key?("pid")) && \
    # passport caracteristics
    (passport["byr"].to_i != 0 && passport["byr"].to_i >= 1920 && passport["byr"].to_i <= 2002) && \
    (passport["iyr"].to_i != 0 && passport["iyr"].to_i >= 2010 && passport["iyr"].to_i <= 2020) && \
    (passport["eyr"].to_i != 0 && passport["eyr"].to_i >= 2020 && passport["eyr"].to_i <= 2030) && \
    ((passport["hgt"].end_with?("in") && passport["hgt"].chop.chop.to_i != 0 && passport["hgt"].chop.chop.to_i  >= 59 && passport["hgt"].chop.chop.to_i <= 76) || \
     (passport["hgt"].end_with?("cm") && passport["hgt"].chop.chop.to_i != 0 && passport["hgt"].chop.chop.to_i  >= 150 && passport["hgt"].chop.chop.to_i  <= 193 ) ) && \
     passport["hcl"].match?(/(#\h{6})/) &&\
     ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(passport["ecl"]) && \
     passport["pid"].length == 9 && passport["pid"].match?(/^([0-9]{9})/)
} 

p nbPP