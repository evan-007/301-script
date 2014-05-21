require 'csv'

CSV.foreach('postdata.csv') do |row|
	CSV.open('postoutput.csv', 'a+') do |rownew|
    rownew << ["rewrite #{row[1]} #{row[0]} permanent;"] 
	end
end