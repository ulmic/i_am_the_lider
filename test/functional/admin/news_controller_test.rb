require 'test_helper'

class Admin::NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
    @admin = create :admin
    admin_sign_in @admin
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns :news
  end

  test "should create news" do
    attributes = attributes_for :news
    post :create, news: attributes
    assert_response :redirect

    @news = News.last
    assert_equal attributes[:title], @news.title
  end

  test "should not create news with render new" do
    attributes = attributes_for :news
    attributes[:title] = nil
    post :create, news: attributes
    assert_template :new
  end

  test "should show news" do
    get :show, id: @news
    assert_response :success
  end

  test "should get edit news" do
    get :edit, id: @news
    assert_response :success
  end

  test "should update news" do
    attributes = attributes_for :news
    put :update, id: @news, news: attributes
    assert_response :redirect

    @news.reload
    assert_equal attributes[:title], @news.title
  end

  test "should destroy news" do
    assert_difference('News.count', -1) do
      delete :destroy, id: @news
    end

    assert_redirected_to news_index_path
  end

  test "should not update news with render edit" do
    attributes = attributes_for :news
    attributes[:title] = nil
    put :update, id: @news, news: attributes
    assert_template :edit
  end
end
