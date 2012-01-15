#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"
require 'toroid'
require 'console_runner'

ConsoleRunner.new.main
