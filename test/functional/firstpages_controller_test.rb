require 'test_helper'

class FirstpagesControllerTest < ActionController::TestCase
  setup do
    @firstpage = firstpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:firstpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create firstpage" do
    assert_difference('Firstpage.count') do
      post :create, firstpage: { author: @firstpage.author, content: @firstpage.content, date: @firstpage.date, pid: @firstpage.pid, title: @firstpage.title, user: @firstpage.user }
    end

    assert_redirected_to firstpage_path(assigns(:firstpage))
  end

  test "should show firstpage" do
    get :show, id: @firstpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @firstpage
    assert_response :success
  end

  test "should update firstpage" do
    put :update, id: @firstpage, firstpage: { author: @firstpage.author, content: @firstpage.content, date: @firstpage.date, pid: @firstpage.pid, title: @firstpage.title, user: @firstpage.user }
    assert_redirected_to firstpage_path(assigns(:firstpage))
  end

  test "should destroy firstpage" do
    assert_difference('Firstpage.count', -1) do
      delete :destroy, id: @firstpage
    end

    assert_redirected_to firstpages_path
  end
end
