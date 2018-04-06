require "csv"

CSV.open('test.csv','w') do |test|
 test << ["A","B","C"]
 test << ["milk","coffee","water"]
end
