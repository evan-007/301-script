require 'open-uri'
require 'nokogiri'
require 'csv'

page = Nokogiri::HTML(open('http://211.110.184.22/'))

for n in 1..4
  page = Nokogiri::HTML(open("http://211.110.184.22/blog?page="+"#{n}"))
  page.css('.caption h3 a').each do |link|
    puts "http://doindie.co.kr"+"#{link['href']}"
    CSV.open('results.csv', 'a+') do |row|
      row << ["http://doindie.co.kr"+"#{link['href']}"]
    end
  end
end