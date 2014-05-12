#! /usr/bin/ruby

require 'fileutils'

def slide_num(x)
  x[/(\d+)\..*/, 1].to_i
end

n = ARGV.first.to_i

slides = Dir["*.slide.hs"]

mmm = slides.select { |x| 
  slide_num(x) >= n
}.sort_by { |x| slide_num(x) }.reverse

mmm.each do |x|
  new_num = slide_num(x) + 1
  new_name = x.sub(slide_num(x).to_s, new_num.to_s)
  p [x, new_name]
  FileUtils.mv(x, new_name)
end
