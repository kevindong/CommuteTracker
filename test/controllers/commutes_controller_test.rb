require 'test_helper'

class CommutesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  
  test "users should start with no active commute values" do
    log_in_as @user
    assert !@user.hasActiveCommute
    assert @user.currentCommute.nil?
  end
  
  test "should be able to start commute without coords" do
    log_in_as @user
    post "/commutes/startcommute"
    assert_response :redirect
    assert_redirected_to root_url
    @user.reload
    assert @user.hasActiveCommute
    assert !@user.currentCommute.nil?
    @commute = Commute.find_by_id(@user.currentCommute)
    assert @commute.user_id == @user.id
    assert !@commute.starttime.nil?
    assert @commute.endtime.nil?
    assert @commute.startLat.nil?
    assert @commute.startLon.nil?
    assert @commute.endLat.nil?
    assert @commute.endLon.nil?
  end
  
  test "should be able to end commute without coords" do
    log_in_as @user
    post "/commutes/startcommute"
    @user.reload
    @commute = Commute.find_by_id(@user.currentCommute)
    post "/commutes/endcommute"
    @user.reload
    @commute.reload
    assert !@user.hasActiveCommute
    assert @user.currentCommute.nil?
    assert @commute.user_id == @user.id
    assert !@commute.starttime.nil?
    assert !@commute.endtime.nil?
    assert @commute.startLat.nil?
    assert @commute.startLon.nil?
    assert @commute.endLat.nil?
    assert @commute.endLon.nil?
  end
  
  test "should be able to start commute with coords" do
    log_in_as @user
    post "/commutes/startcommute", params: {lat: 1.3, lon: -2.3}
    assert_response :redirect
    assert_redirected_to root_url
    @user.reload
    @commute = Commute.find_by_id(@user.currentCommute)
    assert @commute.startLat == 1.3
    assert @commute.startLon == -2.3
  end
  
  test "should be able to end commute with coords" do
    log_in_as @user
    post "/commutes/startcommute", params: {lat: 1.3, lon: -2.3}
    assert_response :redirect
    assert_redirected_to root_url
    @user.reload
    @commute = Commute.find_by_id(@user.currentCommute)
    post "/commutes/endcommute", params: {lat: -3.3, lon: 4.3}
    @user.reload
    @commute.reload
    assert @commute.startLat == 1.3
    assert @commute.startLon == -2.3
    assert @commute.endLat == -3.3
    assert @commute.endLon == 4.3
    assert !@user.hasActiveCommute
    assert @user.currentCommute.nil?
    assert !@commute.starttime.nil?
    assert !@commute.endtime.nil?
  end
end
