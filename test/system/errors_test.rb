require "application_system_test_case"

class ErrorsTest < ApplicationSystemTestCase
  setup do
    @error = errors(:one)
  end

  test "visiting the index" do
    visit errors_url
    assert_selector "h1", text: "Errors"
  end

  test "should create error" do
    visit errors_url
    click_on "New error"

    fill_in "Date found", with: @error.date_found
    fill_in "Description", with: @error.description
    fill_in "Name", with: @error.name
    fill_in "Person assigned", with: @error.person_assigned
    fill_in "Priority", with: @error.priority
    click_on "Create Error"

    assert_text "Error was successfully created"
    click_on "Back"
  end

  test "should update Error" do
    visit error_url(@error)
    click_on "Edit this error", match: :first

    fill_in "Date found", with: @error.date_found
    fill_in "Description", with: @error.description
    fill_in "Name", with: @error.name
    fill_in "Person assigned", with: @error.person_assigned
    fill_in "Priority", with: @error.priority
    click_on "Update Error"

    assert_text "Error was successfully updated"
    click_on "Back"
  end

  test "should destroy Error" do
    visit error_url(@error)
    click_on "Destroy this error", match: :first

    assert_text "Error was successfully destroyed"
  end
end
