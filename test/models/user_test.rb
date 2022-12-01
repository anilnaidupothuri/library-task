# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'users with taken email should be invalid' do
    other_user = users(:one)
    user = User.new(name: 'three', email: other_user.email, password_digest: 'test')
    assert_not user.valid?
  end
end
