#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"
require 'toroid'
require 'console_runner'
require 'console_command'

console = ConsoleRunner.new

trap "INT" do
  console.terminate
  exit
end

console.run
