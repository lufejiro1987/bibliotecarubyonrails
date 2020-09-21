require "application_system_test_case"

class BookActivitiesTest < ApplicationSystemTestCase
  setup do
    @book_activity = book_activities(:one)
  end

  test "visiting the index" do
    visit book_activities_url
    assert_selector "h1", text: "Book Activities"
  end

  test "creating a Book activity" do
    visit book_activities_url
    click_on "New Book Activity"

    fill_in "Activity", with: @book_activity.activity
    fill_in "Book", with: @book_activity.book_id
    fill_in "Date", with: @book_activity.date
    click_on "Create Book activity"

    assert_text "Book activity was successfully created"
    click_on "Back"
  end

  test "updating a Book activity" do
    visit book_activities_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @book_activity.activity
    fill_in "Book", with: @book_activity.book_id
    fill_in "Date", with: @book_activity.date
    click_on "Update Book activity"

    assert_text "Book activity was successfully updated"
    click_on "Back"
  end

  test "destroying a Book activity" do
    visit book_activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book activity was successfully destroyed"
  end
end
