require "selenium-webdriver"
# https://qiita.com/justin999/items/55fbfd5d4f9fc8e5e77d
# Chrome用のドライバを指定
driver = Selenium::WebDriver.for :chrome
##############情報処理/システム############
p '情報処理/システム'
# カテゴリごとにやる
base_url = ""
driver.navigate.to ""
wait = Selenium::WebDriver::Wait.new(timeout: 1)
begin
element = driver.find_element(:class, 'total')
companies = driver.find_element(:xpath, "//ul[@class='link-list']")
rescue RuntimeError => e
# ERROR処理、メッセージを出力してドライバーを終了
puts e.message
driver.quit
end

total_num = element.text.delete("^0-9").to_i
companies_text = companies.text
companies_contents = []
companies = []
p total_num
companies_text.each_line {|line| companies_contents.push(line.chomp) }
companies_contents.each_with_index{|value, index|
if index%3 == 0 then
companies.push(value)
end
}
# companies.each{|var|
#   p var
# }
page_num = total_num/30
htmls = []
10.times do |i|
htmls.push(base_url + (80+i+2).to_s)
end

# ページごと
htmls.each do |url|
driver.navigate.to url
wait = Selenium::WebDriver::Wait.new(timeout: 1)
begin
companies = driver.find_element(:xpath, "//ul[@class='link-list']")
rescue RuntimeError => e
# ERROR処理、メッセージを出力してドライバーを終了
puts e.message
driver.quit
end

companies_text = companies.text
companies_contents = []
companies = []
companies_text.each_line {|line| companies_contents.push(line.chomp) }
companies_contents.each_with_index{|value, index|
if index%3 == 0 then
p value
companies.push(value)
end
}

companies.each{|var|
p var
}
end
p ''
# ##############コンサル/シンクタンク############
# p 'コンサル/シンクタンク'
# # カテゴリごとにやる
# base_url = "="
# driver.navigate.to ""
# wait = Selenium::WebDriver::Wait.new(timeout: 1)
# begin
#   element = driver.find_element(:class, 'total')
#   companies = driver.find_element(:xpath, "//ul[@class='link-list']")
# rescue RuntimeError => e
#   # ERROR処理、メッセージを出力してドライバーを終了
#   puts e.message
#   driver.quit
# end
#
# total_num = element.text.delete("^0-9").to_i
# companies_text = companies.text
# companies_contents = []
# companies = []
# p total_num
# companies_text.each_line {|line| companies_contents.push(line.chomp) }
# companies_contents.each_with_index{|value, index|
#   if index%3 == 0 then
#     companies.push(value)
#   end
# }
#
# page_num = total_num/30
# htmls = []
# page_num.times do |i|
#   htmls.push(base_url + (i+2).to_s)
# end
#
# companies.each{|var|
#   p var.delete("\"")
# }
# # ページごと
# htmls.each do |url|
#   driver.navigate.to url
#   wait = Selenium::WebDriver::Wait.new(timeout: 1)
#   begin
#     companies = driver.find_element(:xpath, "//ul[@class='link-list']")
#   rescue RuntimeError => e
#     # ERROR処理、メッセージを出力してドライバーを終了
#     puts e.message
#     driver.quit
#   end
#
#   companies_text = companies.text
#   companies_contents = []
#   companies = []
#   companies_text.each_line {|line| companies_contents.push(line.chomp) }
#   companies_contents.each_with_index{|value, index|
#     if index%3 == 0 then
#       p value
#       companies.push(value)
#     end
#   }
#
#   companies.each{|var|
#     p var
#   }
# end
# p ''
