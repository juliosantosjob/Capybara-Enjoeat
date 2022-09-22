Dado("que o usuário acesse a sessão restaurantes do site") do
  go_to
  access_session_restaurants
end

Quando("ele procurar pelo restaurante {string}") do |green_food|
  click_green_food(green_food)
end

Então("ele visualiza as informações:") do |table|
  @infos = table.rows_hash
  @element = find("#detail")

  expect(@element).to have_text @infos["categoria"]
  expect(@element).to have_text @infos["descricao"]
  expect(@element).to have_text @infos["horarios"]
end
