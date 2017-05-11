require 'test_helper'

class ResearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @research = researches(:one)
  end

  test "should get index" do
    get researches_url, as: :json
    assert_response :success
  end

  test "should create research" do
    assert_difference('Research.count') do
      post researches_url, params: { research: { name: @research.name, topic: @research.topic } }, as: :json
    end

    assert_response 201
  end

  test "should show research" do
    get research_url(@research), as: :json
    assert_response :success
  end

  test "should update research" do
    patch research_url(@research), params: { research: { name: @research.name, topic: @research.topic } }, as: :json
    assert_response 200
  end

  test "should destroy research" do
    assert_difference('Research.count', -1) do
      delete research_url(@research), as: :json
    end

    assert_response 204
  end
end
