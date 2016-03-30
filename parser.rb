require 'rubygems'
require 'nokogiri'
require 'open-uri'

# 원하는 URL 설정, open-uri와 Nokogiri를 이용해서 파싱
URL = 'http://sunrinwiki.layer7.kr/index.php/14%ED%95%99%EB%B2%88_%ED%95%99%EC%83%9D_%EB%AA%A9%EB%A1%9D'
doc = Nokogiri::HTML(doc = open(URL))
all_data = ''

# div id="content"/div id="bodyContent"/div id="mw-content-text"/ul/li/ul
doc.xpath('//div[@id="content"]//div[@id="bodyContent"]//div[@id="mw-content-text"]/ul/li/ul').each do |a|
   all_data = a.content
end

# 파싱한 것을 토대로 전체 학생의 리스트를 만듦
st_all = all_data.split(' ')

# 맨 처음 14 로 시작하므로 -1 에서 카운트 시작
# 반이 나뉠때 14를 기준으로 나뉘므로 14가 나올때마다 2차원 배열의 인덱스 값으로 cnt 를 써줌
cnt = -1

# 학생 전체를 반을 기준으로 나눌 2차원 배열 생성
st_list = [ [],[],[],[],[],[],[],[],[],[],[],[] ]

# 원하는 반을 입력받는다.
puts '당신의 반을 입력해주세요.'
want_num = gets.chomp
want_num = want_num.to_i - 1

# 학생 전체 리스트 반을 기준으로 쪼개기
st_all.each do |person|
  if person == '14'
    cnt+=1
  end
  st_list[cnt].push(person)
end

# 입력받은 것을 토대로 출력
puts st_list[want_num]