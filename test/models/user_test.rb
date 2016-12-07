# require 'test_helper'
require 'rspec'
require_relative 'models/user.rb'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  RSpec.descibe User do
    it "will create a user with valid fields" do
      User.create(name:"Daniel", email:"dthompson@codingdojo.com", age: 26)
      @user = User.where(name: "Daniel").first
      expect(@user).to exist
    end
  end
end
