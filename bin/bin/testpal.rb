#!/usr/bin/env ruby

require 'cpalette'
require 'chroma'

colors_array = Cpalette.palette(8, :hex => true)

for i in colors_array do
puts "#{i}".paint.to_rgb
end


