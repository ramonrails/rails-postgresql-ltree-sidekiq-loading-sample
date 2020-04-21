require "application_system_test_case"

class LtreeFilesTest < ApplicationSystemTestCase
  setup do
    @ltree_file = ltree_files(:one)
  end

  test "visiting the index" do
    visit ltree_files_url
    assert_selector "h1", text: "Ltree Files"
  end

  test "creating a Ltree file" do
    visit ltree_files_url
    click_on "New Ltree File"

    fill_in "Name", with: @ltree_file.name
    fill_in "Path", with: @ltree_file.path
    fill_in "Process at", with: @ltree_file.process_at
    click_on "Create Ltree file"

    assert_text "Ltree file was successfully created"
    click_on "Back"
  end

  test "updating a Ltree file" do
    visit ltree_files_url
    click_on "Edit", match: :first

    fill_in "Name", with: @ltree_file.name
    fill_in "Path", with: @ltree_file.path
    fill_in "Process at", with: @ltree_file.process_at
    click_on "Update Ltree file"

    assert_text "Ltree file was successfully updated"
    click_on "Back"
  end

  test "destroying a Ltree file" do
    visit ltree_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ltree file was successfully destroyed"
  end
end
