require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @another = users(:two)
    @no_confirmation = User.new(email: 'test@example.com',
                                first_name: 'Test',
                                last_name: 'Test',
                                password: 'secret',
                                password_confirmation: '',
                                time_zone: 'UTC')
  end

  test "validation sanity check" do
    assert @user.valid?
  end

  test "name presence sanity check" do
    @user.first_name = "   "
    assert_not @user.valid?
    @another.last_name = "   "
    assert_not @another.valid?
  end

  test "email presence sanity check" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "accept valid emails" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "reject invalid emails" do
    invalid_addresses = %w[user@example,com user_at_foo.org foo@bar..com user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should not be valid"
    end
  end

  test "emails should be unique" do
    duplicate = @user.dup
    @user.save
    assert_not duplicate.valid?
  end

  test "require password confirmation" do
    assert_not @no_confirmation.valid?
  end

  test "email downcase sanity check" do
    mixed_case = 'fooBaR@example.com'
    @user.email = mixed_case
    @user.save
    assert_equal mixed_case.downcase, @user.reload.email
  end
end
