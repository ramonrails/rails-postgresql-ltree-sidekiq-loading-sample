require 'test_helper'

class LtreeFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ltree_file = ltree_files(:one)
  end

  test "should get index" do
    get ltree_files_url
    assert_response :success
  end

  test "should get new" do
    get new_ltree_file_url
    assert_response :success
  end

  test "should create ltree_file" do
    assert_difference('LtreeFile.count') do
      post ltree_files_url, params: { ltree_file: { name: @ltree_file.name, path: @ltree_file.path, process_at: @ltree_file.process_at } }
    end

    assert_redirected_to ltree_file_url(LtreeFile.last)
  end

  test "should show ltree_file" do
    get ltree_file_url(@ltree_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_ltree_file_url(@ltree_file)
    assert_response :success
  end

  test "should update ltree_file" do
    patch ltree_file_url(@ltree_file), params: { ltree_file: { name: @ltree_file.name, path: @ltree_file.path, process_at: @ltree_file.process_at } }
    assert_redirected_to ltree_file_url(@ltree_file)
  end

  test "should destroy ltree_file" do
    assert_difference('LtreeFile.count', -1) do
      delete ltree_file_url(@ltree_file)
    end

    assert_redirected_to ltree_files_url
  end
end
