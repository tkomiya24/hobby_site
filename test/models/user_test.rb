require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without username' do
    user = User.new(email: 'sample@fake.com', password: 'password',
                    password_confirmation: 'password')
    user.save
    assert user.errors.keys.include? :username
  end

  test 'should not save user without email' do
    user = User.new(username: 'fakl;jqwer', password: 'password',
                    password_confirmation: 'password')
    user.save
    assert user.errors.keys.include? :email
  end

  test 'should validate uniqueness of email' do
    user = User.new(username: 'adfwer', email: 'tkomiya@fake.com', password: 'password',
                    password_confirmation: 'password')
    user.save
    assert user.errors.keys.include? :email
  end
end
