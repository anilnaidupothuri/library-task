# frozen_string_literal: true

require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should generate jwt tokens ' do
    post tokens_url, params: { tokens: { email: @user.email, password_digest: '123456' } }, as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_not_nil json_response['token']
  end

  test 'should not get jwt token' do
    post tokens_url, params: { tokens: { email: @user.email, password: '5521523' } }, as: :json
    assert_response :unauthorized
  end
end
