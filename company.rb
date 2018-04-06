require "selenium-webdriver"
require "csv"

# Chrome用のドライバを指定
driver = Selenium::WebDriver.for :chrome


# カテゴリごとにやる
base_url = ""

url = base_url + "8318/"
driver.navigate.to url
wait = Selenium::WebDriver::Wait.new(timeout: 1)
begin
  infos = driver.find_element(:xpath, "//table")
rescue RuntimeError => e
  # ERROR処理、メッセージを出力してドライバーを終了
  puts e.message
  driver.quit
end

infos_text = infos.text
info = []
info_contents = []
infos_text.each_line {|line| info.push(line.chomp) }
info.each_with_index{|value, index|
  if index == 0 then
    info_contents.push(value)
  elsif index == 3 then
    info_contents.push(value)
  elsif index == 6 then
    info_contents.push(value)
  elsif index == 8 then
    info_contents.push(value)
  end
}
p info_contents
CSV.open("./company.csv", "a", :encoding => "SJIS") do |test|
 test << ["会社名","業界", "住所","電話番号"]
end

CSV.open("./company.csv", "a", :encoding => "SJIS") do |test|
 test << info_contents
end
