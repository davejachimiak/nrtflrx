$LOAD_PATH << File.expand_path('../../../lib', __FILE__)
require 'nrtflrx'

require 'minitest/autorun'
require 'minitest/spec'
require 'mocha'

World(MiniTest::Assertions)
MiniTest::Spec.new nil
