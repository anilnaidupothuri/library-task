# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should show user' do
    get user_url(@user), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @user.name, json_response['name']
  end

  test 'should show all users' do
    get users_url, as: :json
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'test', email: 'test@gmail.com', password: '123456' } }, as: :json
    end
    assert_response :success
  end

  test 'should not create user with already taken email' do 
    assert_no_difference('User.count') do
      post users_url, params: { user: { name: 'svdc', email: @user.email, password: '12334' } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test 'should update users' do 
    patch user_url(@user), params: {user: {name: 'test'}},
                            headers: {Authorization: JsonWebToken.encode(user_id: @user.id)},
                            as: :json
    assert_response :success
  end

  test 'should forbid update users' do
    other_user = users(:two)
    patch user_url(@user), params: { user: { name: 'test1' } },
                           headers: { Authorization: JsonWebToken.encode(user_id: other_user.id)}, as: :json
    assert_response :forbidden
  end

  # test 'should delete user' do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user), headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },as: :json
  #   end
  #   assert_response :no_content
  # end


end
