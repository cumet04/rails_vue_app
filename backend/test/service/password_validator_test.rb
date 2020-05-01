require "test_helper"

class PasswordValidatorTest < ActiveSupport::TestCase
  test "password is not long" do
    assert_not(PasswordValidator.long_enough?(""))
    assert_not(PasswordValidator.long_enough?("passwor"))
  end

  test "password is long enough" do
    assert(PasswordValidator.long_enough?("password"))
    assert(PasswordValidator.long_enough?("passwordpassword"))
  end

  test "only alphabet is too simple" do
    assert_not(PasswordValidator.contains_char_types?("password"))
    assert_not(PasswordValidator.contains_char_types?("PASSWORD"))
    assert_not(PasswordValidator.contains_char_types?("PassWord"))
  end

  test "without alphabet is too simple" do
    assert_not(PasswordValidator.contains_char_types?("01234567!"))
    assert_not(PasswordValidator.contains_char_types?("0!@#$%^&*"))
  end

  test "upper/down case and number is complex enough" do
    assert(PasswordValidator.contains_char_types?("Password0"))
    assert(PasswordValidator.contains_char_types?("No123456"))
  end

  test "upper/down case and symbol is complex enough" do
    assert(PasswordValidator.contains_char_types?("Password!"))
  end

  test "uppercase, number, symbol is complex enough" do
    assert(PasswordValidator.contains_char_types?("PASSW0RD!"))
  end

  test "downcase, number, symbol is complex enough" do
    assert(PasswordValidator.contains_char_types?("passw0rd!"))
  end
end
