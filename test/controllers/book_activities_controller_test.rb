require 'test_helper'

class BookActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_activity = book_activities(:one)
  end

  test "should get index" do
    get book_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_book_activity_url
    assert_response :success
  end

  test "should create book_activity" do
    assert_difference('BookActivity.count') do
      post book_activities_url, params: { book_activity: { activity: @book_activity.activity, book_id: @book_activity.book_id, date: @book_activity.date } }
    end

    assert_redirected_to book_activity_url(BookActivity.last)
  end

  test "should show book_activity" do
    get book_activity_url(@book_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_activity_url(@book_activity)
    assert_response :success
  end

  test "should update book_activity" do
    patch book_activity_url(@book_activity), params: { book_activity: { activity: @book_activity.activity, book_id: @book_activity.book_id, date: @book_activity.date } }
    assert_redirected_to book_activity_url(@book_activity)
  end

  test "should destroy book_activity" do
    assert_difference('BookActivity.count', -1) do
      delete book_activity_url(@book_activity)
    end

    assert_redirected_to book_activities_url
  end
end
