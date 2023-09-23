# Coffers_in

Projeto de conclusão de curso da faculdade Cruzeiro do Sul no curso Sistema de Informação.

## Informações Iniciais

O Projeto consiste em um aplicativo hibrido aceito em IOS e Android desenvolvido pela linguagem de programação [Dart](https://dart.dev/), o framework [Flutter](https://flutter.dev/) e no backend usamos o Back4App.

### Contexto

O Aplicativo foi desenvolvido para atender a uma necessidade de uma cafeteria gourmet que precisava expandir suas vendas alem da cafeteria fisica.

---

### Principais funcionalidades

---

- Dashboard - Apresenta todos os tipos de cafés disponiveis para compra, quando clicado no café escolhido abre o detalhamento do café demonstrando:
  -- Nome
  -- Ingredientes
  -- Descrição
  -- Preço

- Carrinho - Apresenta todos os cafés selecionado pelo cliente para a confirmação dos preços e finalizar sua compra, escolhendo qual forma de pagamento.

- Conta - O menu do aplicativo, onde é possivel deslogar do aplicativo, visualizar rotas de entregas...

---

Notamos que o aplicativo possui o sistema de login com sessões e identifica quando o usuario já esta logado, sendo assim não há a necessidade de logar toda vez que abrir o aplicativo.

---

# Testes

A arquiterura usada nos testes, foram os testes unitarios com no modelo TDD.

Onde iniciamos o desenvolvimento apartir dos testes e após isso realizamos o desenvolvimento das funcionalidades do aplicativo.

Arquivos Testes:
- UserRepository
- ItemRepository
- DashboardPage
- ProdutoPage
- PagamentoPage
- NavegaçãoPage
- CarrinhoPage
- SplashScreen


