# Projeto de Consumo da API do Sandbox da Kobana

Este é um projeto Ruby on Rails que consome a API do sandbox da Kobana para gerenciar clientes e seus boletos.

## Configuração

### Requisitos
- Ruby 3.2.0
- Rails 7.1.3

### Instalação
1. Clone o repositório:
  ```bash
  git clone https://github.com/BrunoLima-dev/teste_boleto.git
  cd teste_boleto 
````

 2. Instale as dependências:
 ```bash
    bundle install
```

3. Configure as variáveis de ambiente:
   Crie um arquivo .env na raiz do projeto com as seguintes variáveis:
 ```bash
    KOBANA_API_URL=https://sandbox.api.kobana.com.br
    KOBANA_API_TOKEN=seu_token_de_autenticacao_sandbox
```

4. Execute as migrações do banco de dados:
   Crie um arquivo .env na raiz do projeto com as seguintes variáveis:
 ```bash
    rails db:migrate
```

<details>
  <summary>GEMS</summary>
  <ul>
    <li><a href="https://github.com/BoletoSimples/boletosimples-ruby">BoletoSimples</a></li>
    <li><a href="https://github.com/petergoldstein/dalli">Dalli</a></li>
    <li><a href="https://rspec.info/documentation">Rspec</a></li>
    <li><a href="https://github.com/thecodecrate/city-state">City-State</a></li>
  </ul>
</details>
- A Gem City-State deixei ela instalada mais ainda não foi aplicada nesta versão do projeto. Esta em andamento.

### 💻 Uso
## Listar Clientes
- Rota: /sandbox/clients
- Método: GET
- Descrição: Lista todos os clientes cadastrados na Kobana.
### Criar Cliente
- Rota: /sandbox/clients
- Método: POST
- Descrição: Cria um novo cliente na Kobana.
### Parâmetros:
- person_name (string): Nome do cliente
- cnpj_cpf (string): E-mail do cliente
- phone_number (string): Telefone do cliente
- address (string): Endereço do cliente

## Listar Boletos
- Rota: /sandbox/boletos
- Método: GET
- Descrição: Lista todos os boletos cadastrados na Kobana.
### Criar Boleto
- Rota: /sandbox/boletos
- Método: POST
- Descrição: Cria um novo boleto na Kobana.
### Parâmetros:
- amount (string): Valor do boleto
- expire_at (date): Data de vencimento do boleto
- cliente_id (inteiro): Seleciona um cliente
# Executando o Servidor
### Para iniciar o servidor Rails, execute o seguinte comando:
```bash
rails server
```
O servidor estará acessível em `http://localhost:3000`.

# Autor
#### Bruno Lima - brunolima.dev703@gmail.com

#### Este README fornecerá informações claras sobre como configurar, usar e contribuir para o seu projeto.





