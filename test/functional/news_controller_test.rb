require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news" do
    attributes = attributes_for :news
    post :create, news: attributes
    assert_response :redirect
    
    @news = News.last
    assert_equal attributes[:title], @news.title
  end

  test "should show news" do
    get :show, id: @news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @news
    assert_response :success
  end

  test "should update news" do
    put :update, id: @news, news: { body: @news.body, pusblished_at: @news.pusblished_at, title: @news.title }
    assert_redirected_to news_path(assigns(:news))
  end

  test "should destroy news" do
    assert_difference('News.count', -1) do
      delete :destroy, id: @news
    end

    assert_redirected_to news_index_path
  end
end
