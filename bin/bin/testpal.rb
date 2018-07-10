#!/usr/bin/env ruby

require "cpalette"
require "chroma"
require "json"

data_hash = JSON.parse(File.read('/home/daniel/crayola.json'))

data_hash.map {|val,idx| puts "#{idx}"}




#colors_array = Cpalette.palette(8, :hex => true)

#for i in colors_array do
#puts "#{i}".paint.to_rgb
#end


