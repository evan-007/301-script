require 'csv'

CSV.foreach('postdata.csv') do |row|
	CSV.open('postoutput.csv', 'a+') do |rownew|
    rownew << ["if ( $request_filename ~ #{row[1]} ) { rewrite ^ #{row[0]} permanent; }"] 
	end
end