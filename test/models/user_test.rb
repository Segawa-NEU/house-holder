require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @test_user = User.new(username: "testuser12", email: "testuser@example.com", password: "testuser12", password_confirmation: "testuser12")
    @alice = User.new(username: "alice1997", email: "alice1997@example.com", password: "alice1997", password_confirmation: "alice1997")
  end

  test "username should not be blank" do
    @test_user.username = ""
    assert_not @test_user.valid?
    @test_user.username = "              "
    assert_not @test_user.valid?
    @test_user.username = "nonblankusername"
    assert @test_user.valid?
  end

  test "username should be unique" do
    @alice.email = "notalice@example.com"
    @alice.password = "notalice"
    @alice.password_confirmation = "notalice"
    assert_not @alice.save
    # @alice is on fixture already
    assert @test_user.save
  end

  test "username should be longer than 8" do
    @test_user.username = "short"
    assert_not @test_user.valid?
    @test_user.username = "longenough"
    assert @test_user.valid?
  end

  test "email should not be blank" do
    @test_user.email = ""
    assert_not @test_user.valid?
    @test_user.email = "              "
    assert_not @test_user.valid?
    @test_user.email = "non-blank@example.com"
    assert @test_user.valid?
  end

  test "email should follow format" do
    @test_user.email = "wrongformatexample.com"
    assert_not @test_user.valid?
    @test_user.email = "wrongformat@example,com"
    assert_not @test_user.valid?
    @test_user.email = "correctformat@example.com"
    assert @test_user.valid?
  end

  test "email should be unique" do
    assert @test_user.save
    @alice.username = "not alice"
    @alice.password = "not alice"
    @alice.password_confirmation = "not alice"
    assert_not @alice.save
  end

  test "password should not be blank" do
    @test_user.password = ""
    @test_user.password_confirmation = ""
    assert_not @test_user.valid?
    @test_user.password = "            "
    @test_user.password_confirmation = "            "
    assert_not @test_user.valid?
    @test_user.password = "nonblank"
    @test_user.password_confirmation = "nonblank"
    assert @test_user.valid?
  end

  test "password should be longer than 8" do
    @test_user.password = "short"
    @test_user.password_confirmation = "short"
    assert_not @test_user.valid?
    @test_user.password = "longenough"
    @test_user.password_confirmation = "longenough"
    assert @test_user.valid?
  end

  test "password and confirmation must match" do
    @test_user.password = "onepassowrd"
    @test_user.password_confirmation = "anotherpassword"
    assert_not @test_user.valid?
    @test_user.password = "samepassword"
    @test_user.password_confirmation = "samepassword"
    assert @test_user.valid?
  end

end
