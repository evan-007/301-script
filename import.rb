require 'csv'

CSV.foreach('sitemap.csv') do |row|
  if row[0].include? "/band/"
    puts "if ( $request_filename ~ #{row[0]} ) { rewrite ^ #{row[0].gsub('band', 'bands')} permanent; }"
  elsif row[0].include? 'venue'
    puts "if ( $request_filename ~ #{row[0]} ) { rewrite ^ #{row[0].gsub('venue', 'venues')} permanent; }"
  end  
end

