Feature: Testando API do aplicativo Hourglass

Background: 
    * def url_base = 'https://hourglass-api.azurewebsites.net/'

Scenario: Testando retorno da API para uma confirmação de email
    Given url url_base
    And path 'api/v1/auth/resend-email-confirmation?email=mairaalves%40gec.inatel.br'
    When method get
    Then status 200

Scenario: Testando retorno da API para um login
    * def login =
    """
    {
        "email": "mairaalves@gec.inatel.br",
        "password": "Senhanova4@"
    }
    """

    Given url url_base
    And path 'api/v1/auth/login'
    And request login
    When method post
    Then status 200

Scenario: Testando retorno da API para um cadastro
    * def cadastro =
    """
    {
        "name": "Joao Carlos",
        "email": "joaocarlos@gmail.com",
        "password": "SenhaJoa0#",
        "confirmPassword": "SenhaJoa0#",
        "cpf": "773.153.686-63"
    }
    """

    Given url url_base
    And path 'api/v1/auth/registration'
    And request cadastro
    When method post
    Then status 201

    * def resposta = response
    And print resposta
    And match resposta == "User created & email sent to joaocarlos@gmail.com successfully"

Scenario: Testando retorno da API para um cadastro ja existente [caso negativo]
    * def cadastro =
    """
    {
        "name": "Joao Souza",
        "email": "joaosouza@gmail.com",
        "password": "SenhaJoa0#",
        "confirmPassword": "SenhaJoa0#",
        "cpf": "182.548.213-64"
    }
    """

    Given url url_base
    And path 'api/v1/auth/registration'
    And request cadastro
    When method post
    Then status 403

    * def resposta = response
    And match resposta == "User already exists!"

Scenario: Testando retorno da API para serviços cadastrados
    Given url url_base
    And path 'api/v1/services'
    When method get
    Then status 200

    * def respostaName = response[0].name
    And match respostaName == "Programador FullStack"

    * def respostaDescricao = response[0].description
    And match respostaDescricao == "Faço qualquer site da sua escolha"

    * def respostaServico = response[0].serviceCategory
    And match respostaServico == "Programação"