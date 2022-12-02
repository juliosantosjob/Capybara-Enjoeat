class Rest < SitePrism::Page
  set_url "/"
  element :btn_delivery, 'p[style*="margin-top: "]'
  element :btn_restaurant, 'a[class="btn btn-danger btn-lg"]'
  element :btn_green_food, 'a[href="/restaurants/green-food"]'
  element :txt_all_restaurant, 'section[class="content-header"] h1'
  element :txt_coffee_corner, 'a[href="/restaurants/coffee-corner"]'
end

module Actions
  def go_to
    @rest.load
    expect(page).to have_current_path("https://enjoeat-sp2.herokuapp.com/", url: true)
  end

  def access_session_restaurants
    expect(@rest.btn_delivery).to have_text "Delivery pra qualquer fome:"
    expect(@rest.btn_delivery).to have_text "peça e receba em casa"
    expect(@rest.btn_restaurant).to have_text "Restaurantes"
    
    @rest.btn_restaurant.click
  end

  def click_green_food(green_food)
    expect(page).to have_current_path("https://enjoeat-sp2.herokuapp.com/restaurants", url: true)
    expect(@rest.txt_all_restaurant).to have_text("Todos os Restaurantes")
    expect(page).to have_css('span[class="place-info-box-text"]', :text => green_food)
    
    @rest.btn_green_food.click
  end
end
