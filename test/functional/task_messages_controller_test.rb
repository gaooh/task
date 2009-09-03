require 'test_helper'

class TaskMessagesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:task_messages)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_task_message
    assert_difference('TaskMessage.count') do
      post :create, :task_message => { }
    end

    assert_redirected_to task_message_path(assigns(:task_message))
  end

  def test_should_show_task_message
    get :show, :id => task_messages(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => task_messages(:one).id
    assert_response :success
  end

  def test_should_update_task_message
    put :update, :id => task_messages(:one).id, :task_message => { }
    assert_redirected_to task_message_path(assigns(:task_message))
  end

  def test_should_destroy_task_message
    assert_difference('TaskMessage.count', -1) do
      delete :destroy, :id => task_messages(:one).id
    end

    assert_redirected_to task_messages_path
  end
end
