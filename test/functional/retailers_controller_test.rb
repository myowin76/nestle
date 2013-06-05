require 'test_helper'

class RetailersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Retailer.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Retailer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Retailer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to retailer_url(assigns(:retailer))
  end

  def test_edit
    get :edit, :id => Retailer.first
    assert_template 'edit'
  end

  def test_update_invalid
    Retailer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Retailer.first
    assert_template 'edit'
  end

  def test_update_valid
    Retailer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Retailer.first
    assert_redirected_to retailer_url(assigns(:retailer))
  end

  def test_destroy
    retailer = Retailer.first
    delete :destroy, :id => retailer
    assert_redirected_to retailers_url
    assert !Retailer.exists?(retailer.id)
  end
end
