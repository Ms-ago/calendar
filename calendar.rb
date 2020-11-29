require "optparse" #optparseライブラリを使えるようにする
require 'date'     #dateライブラリを使えるようにする

year = Date.today.year  #今年
month = Date.today.mon  #今月

opt = OptionParser.new    #コマンドプロンプトの設定
opt.on('-y VAL') { |v| year = v.to_i }
opt.on('-m VAL') { |v| month = v.to_i }
opt.parse!(ARGV)

puts "#{month}月 #{year}".center(20)# 月と西暦中央寄せで出力

week = %w[日 月 火 水 木 金 土]
puts week.join(" ") # 曜日

wday = Date.new(year, month, 1).wday #今月1日の曜日を取得
lastday_date = Date.new(year, month, -1).day #今月の最終日を取得

print "   " * wday # 1日までの空白を出力

(1..lastday_date).each do |x| # 1~最終日まで繰り返し
  print x.to_s.rjust(2) + " " # 日付を右寄せで表示
  wday = wday + 1
  if (wday % 7) == 0  # 日付を右寄せで表示
    print "\n"
  end
end
puts "\n" 
