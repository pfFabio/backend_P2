# CRUD de Categorias com Laravel e Docker

Este projeto é uma aplicação simples para gerenciar um CRUD (Criar, Ler, Atualizar, Excluir) de Categorias, utilizando Laravel, Nginx, e MySQL rodando em containers Docker.

## Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados na sua máquina:

- [Docker](https://www.docker.com/get-started/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Como Rodar o Projeto

Siga os passos abaixo para configurar e iniciar a aplicação. Todos os comandos devem ser executados a partir da pasta raiz do projeto (a pasta que contém o arquivo `docker-compose.yml`).

### 1. Construir e Iniciar os Containers

Este comando irá construir as imagens dos containers (se ainda não existirem) e iniciá-los em segundo plano.

```bash
docker-compose up -d --build
```

### 2. Instalar as Dependências do PHP

Execute o Composer dentro do container da aplicação para instalar todas as dependências do Laravel.

```bash
docker-compose exec app composer install
```

### 3. Executar as Migrations

Este é o passo final. Ele irá criar as tabelas no banco de dados, incluindo a tabela `categorias` que o nosso CRUD utiliza.

```bash
docker-compose exec app php artisan migrate
```

## Acessando a Aplicação

Após seguir todos os passos, a aplicação estará pronta para ser acessada:

- **Página Inicial do Laravel:** [http://localhost:8000](http://localhost:8000)
- **CRUD de Categorias:** [http://localhost:8000/categorias](http://localhost:8000/categorias)

Pronto! O ambiente está configurado e o CRUD de categorias está funcionando.