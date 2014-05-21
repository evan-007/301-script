require 'csv'

CSV.foreach('sitemap.csv') do |row|
	CSV.open('output.csv', 'a+') do |rownew|
	  if row[0].include? "/band/"
	    rownew << ["if ( $request_filename ~ #{row[0].sub('http://doindie.co.kr/', '')} ) { rewrite ^ #{row[0].gsub('band', 'bands')} permanent; }"]
	  elsif row[0].include? 'venue'
	    rownew << ["if ( $request_filename ~ #{row[0]} ) { rewrite ^ #{row[0].gsub('venue', 'venues')} permanent; }"]
	  end  
	end
end

