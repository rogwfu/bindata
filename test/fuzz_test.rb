#!/usr/bin/env ruby

require File.expand_path(File.join(File.dirname(__FILE__), "test_helper"))

describe BinData::String, "with mutually exclusive parameters" do
  it ":value and :initial_value" do
    params = {:value => "", :initial_value => ""}
    lambda { BinData::String.new(params) }.must_raise ArgumentError
  end

  it ":length and :read_length" do
    params = {:length => 5, :read_length => 5}
    lambda { BinData::String.new(params) }.must_raise ArgumentError
  end

  it ":value and :length" do
    params = {:value => "", :length => 5}
    lambda { BinData::String.new(params) }.must_raise ArgumentError
  end
end
