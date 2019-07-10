drop database if exists faq;

create database faq 
default character set utf8
default collate utf8_general_ci;

use faq;

create table endereco(
	IDendereco int not null auto_increment,
	cep numeric(9) not null,
    uf varchar(2) not null,
    cidade varchar(150) not null,
    bairro varchar(150) not null,
    rua varchar(150) not null,
    numero numeric(10) not null,
    primary key (IDendereco)
) default charset = utf8;

create table consumidor(
	IDconsumidor int not null auto_increment,
    nome varchar(150) not null,
    telefone decimal(12),
    cpf numeric(11) not null,
    dataNasc date,
    email varchar(150),
    
    IDendereco int,
    foreign key (IDendereco) references endereco (IDendereco) on update restrict on delete restrict,
    
    primary key (IDconsumidor)
)default charset = utf8;

create table loja(
	IDloja int not null auto_increment,
	nome varchar(150),
    telefone decimal(12),
    
	IDendereco int,
    foreign key (IDendereco) references endereco (IDendereco) on update restrict on delete restrict,
    
    primary key (IDloja)
) default charset = utf8;

create table produto_servico(
	IDproduto_servico int not null auto_increment,
    nome varchar(150),
    garantia varchar(150),
    preco decimal(10,2),
    descricao varchar(150),
    categoria varchar(150),
    
	IDloja int,
    foreign key (IDloja) references loja (IDloja) on update restrict on delete restrict,
    
    primary key (IDproduto_servico)
) default charset = utf8;


create table faq (
	IDfaq int not null auto_increment,
    pergunta varchar(150),
    resposta varchar(150),
    primary key (IDfaq)
) default charset = utf8;


create table funcionario(
	IDfuncionario int not null auto_increment,
    nome varchar(150),
    
    IDloja int,
    foreign key (IDloja) references loja (IDloja) on update restrict on delete restrict,
    primary key (IDfuncionario)
) default charset = utf8;

create table lojafaq(
	IDfaq int,
    IDloja int,
    primary key (IDfaq,IDloja),
    foreign key (IDfaq) references faq (IDfaq) on update restrict on delete restrict,
    foreign key (IDloja) references loja (IDloja) on update restrict on delete restrict
) default charset = utf8;

create table venda(
	idvenda int not null auto_increment,
	dataVenda datetime not null,
    IDfuncionario int,
    IDproduto_servico int,
    IDloja int,
    IDconsumidor int,
    primary key (idvenda),
    foreign key (IDfuncionario) references funcionario (IDfuncionario) on update restrict on delete restrict,
    foreign key (IDproduto_servico) references produto_servico (IDproduto_servico) on update restrict on delete restrict,
    foreign key (IDloja) references loja (IDloja) on update restrict on delete restrict,
    foreign key (IDconsumidor) references consumidor (IDconsumidor) on update restrict on delete restrict

) default charset = utf8;


create table contato(
	IDcontato int not null auto_increment,
    dataCont datetime,
    assunto varchar(150) not null,
    tipodecontato enum('Telefone','Internet','Loja') default 'Internet',
    descricao varchar (150) not null,
    
    IDconsumidor int,
    foreign key (IDconsumidor) references consumidor (IDconsumidor) on update restrict on delete restrict,
    IDloja int,
    foreign key (IDloja) references loja (IDloja) on update restrict on delete restrict,
    IDvenda int,
    foreign key (IDvenda) references venda (IDvenda) on update restrict on delete restrict,
    
    primary key (IDcontato)
)default charset = utf8;

create table respusu(
	procedimentoAdotado varchar(150),
    dataResp datetime not null,
    respEnviadaAoConsumidor varchar(150) not null,
    IDcontato int,
    IDvenda int,
    IDfuncionario int,
	
    foreign key (IDfuncionario) references funcionario (IDfuncionario) on update restrict on delete restrict,
    foreign key (IDvenda) references venda (IDvenda) on update restrict on delete restrict,
    foreign key (IDcontato) references contato (IDcontato) on update restrict on delete restrict,
    primary key (IDcontato, IDvenda, IDfuncionario)
) default charset = utf8;