# encoding: utf-8

ENV["RAILS_ENV"] = "test"
ARGV << '--verbose'
require 'bundler/setup'

gem 'minitest' # ensures you're using the gem, and not the built in MT

require 'pry'
require 'minitest/spec'
require 'minitest/unit'
require 'minitest/autorun'
require 'rspec/mocks'

require 'ostruct'

testdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(testdir) unless $LOAD_PATH.include?(testdir)
$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))


class Minitest::Spec
  include ::RSpec::Mocks::ExampleMethods

  def before_setup
    ::RSpec::Mocks.setup
    super
  end

  def after_teardown
    super
    ::RSpec::Mocks.verify
  ensure
    ::RSpec::Mocks.teardown
  end
end

