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
end
