require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Artist", with: @event.artist
    fill_in "Description", with: @event.description
    fill_in "Event date", with: @event.event_date
    fill_in "Price high", with: @event.price_high
    fill_in "Price low", with: @event.price_low
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Artist", with: @event.artist
    fill_in "Description", with: @event.description
    fill_in "Event date", with: @event.event_date
    fill_in "Price high", with: @event.price_high
    fill_in "Price low", with: @event.price_low
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
