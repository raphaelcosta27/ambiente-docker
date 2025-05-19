# 🐳 Ambiente Docker - PJAP

Este repositório fornece um ambiente Docker completo para desenvolvimento de aplicações PHP com MySQL e phpMyAdmin. Ele é ideal para rodar localmente projetos PHP sem necessidade de configurar servidores manualmente.

## 📦 O que está incluído?

- **PHP 8.2** com Apache  
- **MySQL 8.0**  
- **phpMyAdmin** acessível via navegador  
- **Volumes persistentes** para banco de dados e arquivos de projeto  
- **Configuração otimizada** para desenvolvimento local  

## 🚀 Como executar

1. Clone o repositório:

   ```bash
   git clone https://github.com/gruposeres/pjap-docker.git
   cd pjap-docker
   ```

2. Suba os containers com Docker Compose:

   ```bash
   docker-compose up -d
   ```

3. Acesse os serviços:

   - **Aplicação PHP:** [http://localhost:8080](http://localhost:8080)  
   - **phpMyAdmin:** [http://localhost:8081](http://localhost:8081)  
     - Host: `db`  
     - Usuário: `root`  
     - Senha: `root`  

4. O código da aplicação deve ser colocado na pasta `./www`. Ela está mapeada para o container PHP+Apache.

## 📂 Estrutura de Pastas

```
pjap-docker/
├── docker-compose.yml     # Arquivo principal para subir os containers
├── .env                   # Variáveis de ambiente como senhas e portas
├── mysql/                 # Scripts de inicialização do MySQL (opcional)
├── www/                   # Código da aplicação PHP
```

## 🛠️ Comandos úteis

- Parar os containers:
  ```bash
  docker-compose down
  ```

- Ver os logs dos containers:
  ```bash
  docker-compose logs -f
  ```

- Acessar o MySQL via CLI:
  ```bash
  docker exec -it pjap-mysql mysql -u root -p
  ```

## ❓ Dúvidas frequentes

- **Posso usar esse setup com Laravel?**  
  Sim, basta colocar o código do Laravel dentro da pasta `www` e garantir que as dependências estejam instaladas com Composer.

- **Como configurar múltiplos bancos?**  
  Adicione novos serviços no `docker-compose.yml` e defina nomes de bancos distintos com variáveis de ambiente.
