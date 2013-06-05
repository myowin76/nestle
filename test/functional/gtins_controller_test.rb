require 'test_helper'

class GtinsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Gtin.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Gtin.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Gtin.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to gtin_url(assigns(:gtin))
  end

  def test_edit
    get :edit, :id => Gtin.first
    assert_template 'edit'
  end

  def test_update_invalid
    Gtin.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Gtin.first
    assert_template 'edit'
  end

  def test_update_valid
    Gtin.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Gtin.first
    assert_redirected_to gtin_url(assigns(:gtin))
  end

  def test_destroy
    gtin = Gtin.first
    delete :destroy, :id => gtin
    assert_redirected_to gtins_url
    assert !Gtin.exists?(gtin.id)
  end
end
