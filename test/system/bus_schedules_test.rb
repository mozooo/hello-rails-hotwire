require "application_system_test_case"

class BusSchedulesTest < ApplicationSystemTestCase
  setup do
    @bus_schedule = bus_schedules(:one)
  end

  test "visiting the index" do
    visit bus_schedules_url
    assert_selector "h1", text: "Bus schedules"
  end

  test "should create bus schedule" do
    visit bus_schedules_url
    click_on "New bus schedule"

    fill_in "Bus line", with: @bus_schedule.bus_line_id
    fill_in "Departure hour", with: @bus_schedule.departure_hour
    fill_in "Departure minute", with: @bus_schedule.departure_minute
    click_on "Create Bus schedule"

    assert_text "Bus schedule was successfully created"
    click_on "Back"
  end

  test "should update Bus schedule" do
    visit bus_schedule_url(@bus_schedule)
    click_on "Edit this bus schedule", match: :first

    fill_in "Bus line", with: @bus_schedule.bus_line_id
    fill_in "Departure hour", with: @bus_schedule.departure_hour
    fill_in "Departure minute", with: @bus_schedule.departure_minute
    click_on "Update Bus schedule"

    assert_text "Bus schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Bus schedule" do
    visit bus_schedule_url(@bus_schedule)
    click_on "Destroy this bus schedule", match: :first

    assert_text "Bus schedule was successfully destroyed"
  end
end
