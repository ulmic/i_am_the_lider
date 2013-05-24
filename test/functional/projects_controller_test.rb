require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @project = create :project
    @admin = create :admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns :projects
  end

  test "should get new" do
    user_sign_in @user
    
    get :new
    assert_response :success
  end

  test "should create project" do
    user_sign_in @user

    attributes = attributes_for :project
    post :create, project: attributes
    assert_response :redirect
    
    @project = Project.last
    assert_equal attributes[:title], @project.title
  end

  test "should get edit project by admin" do
    admin_sign_in @admin

    get :edit, id: @project
    assert_response :success
  end

  test "should get edit project" do
    @user.id = @project.user_id
    user_sign_in @user

    get :edit, id: @project
    assert_response :success
  end


  test "should update project by admin" do
    admin_sign_in @admin   
 
    attributes = attributes_for :project
    put :update, id: @project, project: attributes
    assert_response :redirect
    
    @project.reload
    assert_equal attributes[:title], @project.title 
  end

  test "should update project" do
    @user.id = @project.user_id
    user_sign_in @user
 
    attributes = attributes_for :project
    put :update, id: @project, project: attributes
    assert_response :redirect
    
    @project.reload
    assert_equal attributes[:title], @project.title 
  end

  test "should destroy project" do
    @user.id = @project.user_id
    user_sign_in @user

    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_response :redirect
  end

  test "should not edit project with no access" do
    get :edit, id: @project
    assert_redirected_to "/404"
  end

  test "should not create project with render new" do
    user_sign_in @user
    attributes = attributes_for :project
    attributes[:title] = nil

    post :create, project: attributes
    assert_template :new
  end

  test "should not update project with no access" do
    attributes = attributes_for :project
    put :update, id: @project, project: attributes
    
    assert_redirected_to @project.user
  end

#  test "should not update project with render edit" do
#    attributes = attributes_for :project
#    attributes[:title] = nil
#    put :update, id: @project, project: attributes
#    assert_template /edit/
#  end
end
