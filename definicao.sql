-- Inicio do código do projeto de Banco de Dados em SQL, 
-- manipulação de  dados fictícios de um restaurante. 
-- O primeiro passo será montar a estrutura que irá receber os dados.

create database if not exists restaurante; # Criação do banco de dados caso não exista com nome:'restaurante'
use restaurante;                           # Solicitação para que o programa ultilize o banco de dados criado


-- Criação da Tabela de Funcionários

create table if not exists Funcionario(
id_funcionario int auto_increment primary key,      # dentificador único para cada funcionário.
nome varchar(255),                                  # Nome completo do funcionário.
cpf varchar(14),                                    # CPF do funcionário.
data_nascimento date,                               # Data de nascimento do funcionário.
endereco varchar(255),                              # Endereço residencial do funcionário.
telefone varchar(15),                               # Número de telefone do funcionário.
email varchar(100),                                 # E-mail do funcionário.
cargo varchar(100),                                 # Cargo do funcionário no restaurante.
salario decimal(10,2),                              # Salário do funcionário.
data_admissao date                                  # Data de admissão do funcionário no restaurante.
);


-- Criação da Tabela de Clientes

create table if not exists clientes(
id_cliente int auto_increment primary key,           #  Identificador único para cada cliente.
nome varchar(255),                                   #  Nome completo do cliente.
cpf varchar(14),                                     #  CPF do cliente.
data_nascimento date,                                #  Data de nascimento do cliente.
endereco varchar(255),                               #  Endereço residencial do cliente.
telefone varchar(15),                                #  Número de telefone do cliente.
email varchar(100),                                  #  E-mail do cliente.
data_cadastro date                                   # Data em que o cliente foi cadastrado no sistema.
);

-- Criação da Tabela de Produtos

create table if not exists produtos(
id_produto int auto_increment primary key,            # Identificador único para cada produto.
nome varchar(255),                                    # Nome do produto.
descricao text,                                       # Descrição detalhada do produto.
preco decimal(10,2),                                  # Preço do produto.
categoria varchar(100)                                # Categoria do produto (ex: bebida, entrada, prato principal, sobremesa).
);

-- Criação da Tabela de Pedidos

create table if not exists pedidos(
id_pedido int auto_increment primary key,             # Identificador único para cada pedido.
id_cliente int,                                       # Referência ao cliente que fez o pedido.
id_funcionario int,                                   # Referência ao funcionário que atendeu o pedido.
id_produto int,                                       # Referência ao produto pedido.
quantidade int,                                       # Quantidade do produto pedido.
preco decimal(10,2),                                  # Preço do produto no momento do pedido.
data_pedido date,                                     # Data em que o pedido foi realizado.
status_pedido varchar(50)                             # Status do pedido (ex: pendente, concluído, cancelado).
);

-- Definição das chaves estrangeiras da tabela de pedidos

alter table pedidos add foreign key (id_cliente) references clientes (id_cliente);            # Referência ao cliente que fez o pedido com a tabela clientes.
alter table pedidos add foreign key (id_funcionario) references funcionario (id_funcionario); # Referência ao funcionário que atendeu o pedido com tabela funcionários.
alter table pedidos add foreign key (id_produto) references produtos (id_produto);            # Referência ao produto pedido com a tabela produtos.

-- Criação da tabela de Informações adicionais


create table if not exists info_produtos (
id_info int auto_increment primary key,               # Identificador único para cada informação.
id_produto int,                                       # Referência ao produto.
ingredientes text,                                    # Lista de ingredientes do produto.
fornecedor varchar(255)                               # Nome do fornecedor do produto.
);

-- chave estrangeira da tabela info_produtos

alter table info_produtos add foreign key (id_produto) references produtos (id_produto);  # Referência ao produto com a tabela de produtos.



