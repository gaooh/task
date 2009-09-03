require 'test_helper'

class PokesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pokes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_poke
    assert_difference('Poke.count') do
      post :create, :poke => { }
    end

    assert_redirected_to poke_path(assigns(:poke))
  end

  def test_should_show_poke
    get :show, :id => pokes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pokes(:one).id
    assert_response :success
  end

  def test_should_update_poke
    put :update, :id => pokes(:one).id, :poke => { }
    assert_redirected_to poke_path(assigns(:poke))
  end

  def test_should_destroy_poke
    assert_difference('Poke.count', -1) do
      delete :destroy, :id => pokes(:one).id
    end

    assert_redirected_to pokes_path
  end
end
