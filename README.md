# SETUP PHP

Uma base de aplicação limpa (sem frameworks), para estudos em PHP Orientado a objetos.

Essa estrutura já está dockerizada, então basta ter o docker compose rodando em seu computador que é pra dar tudo certo.

## Tecnologias

- PHP 8.3
- MySQL
- nginx

## Como usar

Primeiro basta clonar o repositório

`git clone https://github.com/alessandrofeitoza/setup-php-docker`

Agora entre na pasta com o terminal 

`cd setup-php-docker`

E agora basta rodar o docker

`docker-compose up -d`

Pronto,é sucesso!

Acesse o http://localhost:8080

## Como migrar o banco de dados
Execute no seu terminal:
```shell
make migrar-database
```


## Para alterar alguma coisa

Dentro da pasta `public` existe um arquivo `index.php`, altere-o, salve e dê um F5 lá no navegaro <http://localhost:8080>

## Como guiar o processo para subir a sua aplicação no GitHub utilizando uma chave SSH
Claro! Vou te guiar no processo para subir a sua aplicação no GitHub utilizando uma chave SSH. Aqui estão os passos:

### Passo 1: Verificar se você já tem uma chave SSH

1. **Verifique se você já tem uma chave SSH** (ou crie uma nova, caso não tenha).
   
   No terminal, digite:
   ```bash
   ls -al ~/.ssh
   ```

   Se houver arquivos como `id_rsa` e `id_rsa.pub`, isso significa que você já tem uma chave SSH. Caso contrário, você precisará gerar uma nova chave SSH.

### Passo 2: Gerar uma chave SSH (se necessário)

Se você não tiver uma chave SSH, crie uma com o seguinte comando:

1. Execute o comando para gerar a chave SSH:
   ```bash
   ssh-keygen -t rsa -b 4096 -C "seu-email@dominio.com"
   ```

   Esse comando cria uma chave SSH de 4096 bits associada ao seu e-mail. Quando perguntado onde salvar a chave, você pode pressionar **Enter** para aceitar o caminho padrão (`/home/seu-usuario/.ssh/id_rsa`).

2. Durante a criação da chave, será pedido para você criar uma senha. Isso é opcional, mas recomendado por questões de segurança.

### Passo 3: Adicionar sua chave SSH ao agente SSH

Após gerar a chave, você precisa adicionar a chave SSH ao agente SSH. Execute os seguintes comandos:

1. Inicie o agente SSH:
   ```bash
   eval "$(ssh-agent -s)"
   ```

2. Adicione sua chave privada SSH ao agente:
   ```bash
   ssh-add ~/.ssh/id_rsa
   ```

### Passo 4: Copiar a chave SSH pública

Agora, você precisa copiar a chave pública (que tem a extensão `.pub`) para adicionar ao GitHub. Execute o seguinte comando para copiar a chave para a área de transferência:

- No Linux/macOS:
  ```bash
  cat ~/.ssh/id_rsa.pub
  ```

- No Windows (Git Bash):
  ```bash
  cat ~/.ssh/id_rsa.pub | clip
  ```

Isso vai exibir a chave pública no terminal, e ela será copiada para a área de transferência.

### Passo 5: Adicionar a chave SSH ao GitHub

Agora você precisa adicionar essa chave pública ao seu perfil no GitHub.

1. No GitHub, vá até a **configuração de SSH Keys**:  
   [https://github.com/settings/keys](https://github.com/settings/keys)

2. Clique em **New SSH Key** (Nova chave SSH).

3. No campo **Title**, coloque um nome para identificar a chave (por exemplo, "Meu Laptop").

4. No campo **Key**, cole a chave pública que você copiou anteriormente.

5. Clique em **Add SSH Key**.

### Passo 6: Testar a conexão SSH com o GitHub

Agora, você pode testar se a sua chave SSH está funcionando corretamente com o GitHub.

Execute o comando abaixo:

```bash
ssh -T git@github.com
```

Você deve receber uma resposta como:

```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

Isso significa que sua chave SSH foi configurada corretamente.

### Passo 7: Subir sua aplicação para o GitHub

Agora que você configurou sua chave SSH, pode subir sua aplicação para o GitHub.

1. Se você ainda não criou um repositório no GitHub, crie um novo repositório.
2. No terminal, vá até o diretório da sua aplicação (onde o código está localizado).
3. Se ainda não inicializou o Git no seu diretório, faça isso com:

   ```bash
   git init
   ```

4. Adicione o repositório remoto do GitHub:

   ```bash
   git remote add origin git@github.com:usuario/nome-do-repositorio.git
   ```

5. Adicione os arquivos para o commit:

   ```bash
   git add .
   ```

6. Faça o commit das suas alterações:

   ```bash
   git commit -m "Primeiro commit"
   ```

7. Envie os arquivos para o repositório no GitHub:

   ```bash
   git push -u origin master
   ```

Pronto! Agora sua aplicação deve estar no GitHub.

Se você tiver algum problema ou alguma dúvida em algum dos passos, me avise!
  