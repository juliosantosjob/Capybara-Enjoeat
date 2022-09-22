#language:pt
    @all_restaurant_services
    Funcionalidade: Restaurantes do site
    Eu como usuário devo poder interagir com todos os restaurantes da plataforma.

        Cenário: Visualização das infomações do restaurante Green Food
            Dado que o usuário acesse a sessão restaurantes do site
            Quando ele procurar pelo restaurante "GREEN FOOD"
            Então ele visualiza as informações:
            | categoria | Saudável                                                             |
            | descricao | Comida saudável é no Green Food. Compramos barato, vendemos caro. ;) |
            | horarios  | Somente em horário de almoço, das 11h às 15h                         |
