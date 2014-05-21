task import_posts: :environment do
  require 'open-uri'
  require 'nokogiri'

  page = Nokogiri::HTML(open('http://211.110.184.22/'))

  for n in 1..4
    page = Nokogiri::HTML(open("http://211.110.184.22/blog?page="+"#{n}"))
    page.css('.caption h3 a').each do |link|
      Post.create(new: "http://doindie.co.kr"+"#{link['href']}")
    end
  end
end

task import_new: :environment do
  require 'csv'
  
  CSV.foreach("#{Rails.root}"+"/lib/tasks/results.csv") do |row|
    Post.create(new: row[0])
  end
end

task match: :environment do
  require 'csv'
  
  CSV.foreach("#{Rails.root}"+"/lib/tasks/sitemap.csv") do |row|
    unless row[1].blank?
      puts "#{row[1].gsub(/http:\/\/doindie.co.kr/, '')}"
      a = Post.where("new like :q", q: "%#{row[1]}%")
      puts a
    end
  end
end