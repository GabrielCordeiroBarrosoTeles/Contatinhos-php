migrar-database:
	@echo "\n" 
	@echo ">>> Criando banco de dados...\n"

	@docker compose exec mysql mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS db_contatinhos;" > /dev/null 2>&1
	
	@echo "\n>>> Sucesso, banco criado!...\n"

	@echo "\n>>> Criando tabela de CONTATOS\n"
	@docker compose exec mysql mysql -u root -proot -e "USE db_contatinhos; CREATE TABLE IF NOT EXISTS	 tb_contatos ( id INT PRIMARY KEY AUTO_INCREMENT, nome VARCHAR(50) NOT NULL, email VARCHAR(100) NULL, telefone VARCHAR(20) NOT NULL  );" > /dev/null 2>&1
	@echo "\n>>> Sucesso, tabela de contatos criado!...\n"

load-fixtures:
	@echo "\n>>> Inserindo dados fictícios na tabela de CONTATOS...\n"
	@docker compose exec mysql mysql -u root -proot -e "USE db_contatinhos; INSERT INTO tb_contatos (nome, email, telefone) VALUES \
		('João Silva', 'joao.silva@email.com', '(11) 98765-4321'), \
		('Maria Oliveira', 'maria.oliveira@email.com', '(21) 98765-4321'), \
		('Pedro Costa', 'pedro.costa@email.com', '(31) 98765-4321'), \
		('Ana Pereira', 'ana.pereira@email.com', '(41) 98765-4321'), \
		('Carlos Souza', 'carlos.souza@email.com', '(51) 98765-4321'), \
		('Luciana Santos', 'luciana.santos@email.com', '(61) 98765-4321'), \
		('Felipe Rocha', 'felipe.rocha@email.com', '(71) 98765-4321'), \
		('Fernanda Alves', 'fernanda.alves@email.com', '(81) 98765-4321'), \
		('Marcos Lima', 'marcos.lima@email.com', '(91) 98765-4321'), \
		('Cláudia Martins', 'claudia.martins@email.com', '(11) 91234-5678');" > /dev/null 2>&1
	
	@echo "\n>>> Sucesso, dados fictícios inseridos!...\n"
