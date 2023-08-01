#!/usr/bin/env ruby
# this script match and output: [SENDER],[RECEIVER],[FLAGS]
puts ARGV[0].scan(/(?<=from:)[\w+]+|(?<=to:)[\w+]+|(?<=flags:)[-1:0]+/).join(',')
