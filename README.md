# OracleSqlDeveloper_pesquisa

# Instalação:

 - https://www.oracle.com/br/database/technologies/xe-downloads.html

 - https://www.oracle.com/database/sqldeveloper/technologies/download/


# Criando uma conexão para o usuario do systema, o usuario sys:

 - Video: https://www.youtube.com/watch?v=mD5bnuj7f7c

 - Tem que criar uma conexao para o usuario "sys"(usuario padrão do systema), primeiro para poder criar o seu usuario.

 - Clica no botão de + verde.

 - Preenche dados do campo de : 
    - Nome(ADMIN)
    - senha(senha que foi colocada quando instalou) 
    - nome usuario: sys
    - Atribuição: SYSDBA
    - Nome do serviço: XEPDB1

 - O usuario sys ja vem na instalação, não deve ser usado como usuario para projetos.

 - deve ser criado um usuario do zero para o projeto.

  ### Criando o usuario do projeto.

   - Clica em "Outros usuarios", e escolhe a opção de criar usuario, no banco ADMIN.

   - Escolhe um nome e uma senha.(ADMIN,admin123)

   - Pode editar o usuario ou deletar.

   - Tem a opção de editar as permições ou os privilegios.

   - Bota todos as permições e privilegio, principalmente o de criar e alterar tabela.

  ### Criando conexão para o usuario do projeto

   - cria o nome da conexão: conexaoLincoln.
   - bota a senha e usuario que foi criado anteriormente.
   - atribuição: normal
   - serviço: XEPDB1

# Criando tabela

<blockquete>

        CREATE TABLE ProdutoTeste (
            IdProduto int,
            NomeProduto varchar(255),
            Fornecedor varchar(255)
        );

</blockquete>





