#!/usr/bin/env ruby
# this script match repeation for the leater "r" 
# more than 1 and less than 6 expression.
puts ARGV[0].scan(/hbt{2,5}n/).join
