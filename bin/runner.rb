#!/usr/bin/env ruby

$: << File.dirname(__FILE__) + "/../lib"
require 'tordoid'
require 'console_runner'

ConsoleRunner.new.main
