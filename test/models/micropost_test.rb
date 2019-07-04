require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:james)
    @micropost = @user.microposts.build(:content=>"loremGypsum")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user_id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "content should be valid" do
    @micropost.content = " "
    assert_not @micropost.valid?
  end

  test "micropost should not be more than 140 chars" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "most recent micropost should be first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
