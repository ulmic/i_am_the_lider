require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = create :project
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    attributes = attributes_for :project
    post :create, project: attributes
    assert_response :redirect
    
    @project = Project.last
    assert_equal attributes[:title], @project.title
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit project by admin" do
    admin = create :admin
    admin_sign_in(admin)

    get :edit, id: @project
    assert_response :success
  end

  test "should update project by admin" do
    admin = create :admin
    admin_sign_in(admin)   
 
    attributes = attributes_for :project
    put :update, id: @project, project: attributes
    assert_response :redirect
    
    @project.reload
    assert_equal attributes[:title], @project.title 
  end

  test "should destroy project" do
    admin = create :admin
    admin_sign_in(admin)    

    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_response :redirect
  end
end
