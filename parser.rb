require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL = 'http://sunrinwiki.layer7.kr/index.php/14%ED%95%99%EB%B2%88_%ED%95%99%EC%83%9D_%EB%AA%A9%EB%A1%9D'
doc = Nokogiri::HTML(doc = open(URL))
i = 0
name = ''
arr = []
# div id="content"/div id="bodyContent"/div id="mw-content-text"/ul/li/ul
doc.xpath('//div[@id="content"]//div[@id="bodyContent"]//div[@id="mw-content-text"]/ul/li/ul').each do |a|
   name = a.content
end

st_all = name.split(' ')
cnt = -1

st_list = [ [],[],[],[],[],[],[],[],[],[],[],[] ]
want_name_list = []

# want_num = gets.chomp

st_all.each do |person|
  if person == '14'
    cnt+=1
  end
  st_list[cnt].push(person)
end

st_list.each do |ban|
  ban.each do |person|
    want_name_list.push(person)
  end
end

puts st_list[1]