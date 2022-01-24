require "application_system_test_case"

class BusLinesTest < ApplicationSystemTestCase
  setup do
    @bus_line = bus_lines(:one)
  end

  test "visiting the index" do
    visit bus_lines_url
    assert_selector "h1", text: "Bus lines"
  end

  test "should create bus line" do
    visit bus_lines_url
    click_on "New bus line"

    fill_in "Name", with: @bus_line.name
    click_on "Create Bus line"

    assert_text "Bus line was successfully created"
    click_on "Back"
  end

  test "should update Bus line" do
    visit bus_line_url(@bus_line)
    click_on "Edit this bus line", match: :first

    fill_in "Name", with: @bus_line.name
    click_on "Update Bus line"

    assert_text "Bus line was successfully updated"
    click_on "Back"
  end

  test "should destroy Bus line" do
    visit bus_line_url(@bus_line)
    click_on "Destroy this bus line", match: :first

    assert_text "Bus line was successfully destroyed"
  end
end
