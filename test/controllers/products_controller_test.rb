require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path

    assert_response :success
    assert_select '.product', 2
  end

  test 'render a detailed product page' do
    get product_path(products(:one))

    assert_response :success
    assert_select '.title', 'Title: PS4'
    assert_select '.description', 'Description: Is a PS4'
    assert_select '.price', 'Price: 400'
  end

  test 'render a new product form' do
    get new_product_path

    assert_response :success
    assert_select 'form'
  end

  test 'allow to create a new product' do
    post products_path, params: {
      product: {
        title: 'Nintendo 64',
        description: 'Is a Nintendo 64',
        price: 200
      }
    }

    assert_redirected_to products_path
    assert_equal flash[:notice], 'Successful operation'
  end

  test 'does not allow to create a new product with empty fields' do
    post products_path, params: {
      product: {
        title: '',
        description: 'Is a Nintendo 64',
        price: 200
      }
    }

    assert_response :unprocessable_entity
  end
end
