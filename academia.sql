

drop database if exists academia1; 

create database academia1 character set utf8 COLLATE utf8_general_ci;

use academia1;

create table endereco(
	cep char(9) primary key,
	rua varchar(60)not null,
	bairro varchar(40)not null,
	cidade varchar(40)not null,
	uf char(2)not null);
	
create table aluno(
	matricula integer primary key auto_increment,
	nome varchar(60)not null,
	telefone varchar(15)not null,
	cpf char(14)not null,
	rg varchar(15)not null,
	datanascimento date not null,
	cep char(9) not null,
	numerocasa smallint not null,
	complemento varchar(30), 
	foto varchar(255),
	foreign key(cep)references endereco(cep));
	
create table funcionario(
	cpffuncionario char(14)primary key,
	nome varchar(60)not null,
	telefone varchar(15)not null,
	rg varchar(15)not null,
	cep char(9) not null,
	numerocasa smallint not null,
	complemento varchar(30), 
	foto varchar(255),
	foreign key(cep)references endereco(cep));
	
create table professor(
	idprofessor integer primary key auto_increment,
	disponibilidade varchar(40)not null,
	cpffuncionario char(14)not null,
	foreign key(cpffuncionario)references funcionario(cpffuncionario));


create table atividade(
	idatividade integer primary key auto_increment,
		nomeatividade varchar(60)not null,
		descricao varchar(100)not null);	


		
create table habilitaprofessor(
	idhabilitacao integer primary key auto_increment,
	idatividade integer not null,
	idprofessor integer not null,
	foreign key(idatividade)references atividade(idatividade),
	foreign key(idprofessor)references professor(idprofessor));	
	

create table aula(
	idaula integer primary key auto_increment,
	dataaula date not null,
	horario varchar(30)not null,
	idprofessor integer not null,
	idatividade integer not null,
	foreign key(idprofessor)references professor(idprofessor),
	foreign key(idatividade)references atividade(idatividade));	


create table aulaaluno(
	idaulaaluno integer primary key auto_increment,
	matricula integer not null,
	idaula integer not null,
	foreign key(matricula)references aluno(matricula),
	foreign key(idaula)references aula(idaula));
	
	
create table produto(
	codigoproduto integer primary key auto_increment,
	nome varchar(60)not null,
	cor varchar(30)not null,
	valor double not null,
	tamanho char(2)not null,
	quantidade integer not null);
	

	
create table venda(
	idvenda integer primary key auto_increment,
	data date not null,
	valor double not null,
	quantidade integer not null,
	codigoproduto integer not null,
	cpffuncionario char(14)not null,
	foreign key(codigoproduto)references produto(codigoproduto),
	foreign key(cpffuncionario)references funcionario(cpffuncionario));
	
	

insert into endereco(cep,rua,bairro,cidade,uf)VALUES
('23085-610','Rua Padre Pauwels','Campo Grande','Rio de Janeiro','RJ'),
('26551-090','Travessa Elpidio','Cruzeiro do Sul','Mesquita','RJ');


insert into aluno(nome,telefone,rg,cpf,datanascimento,cep,numerocasa,complemento,foto)VALUES
('Maria','(21)99886-1055','12555','123456893-10','2001-08-01','23085-610',31,'ap 102','vazio'),
('Pedro','(21)99999-1055','00012','123456789-10','1997-10-20','26551-090',100,'fundos','vazio');
	
insert into funcionario(cpffuncionario,nome,telefone,rg,cep,numerocasa,complemento,foto)VALUES
('123','Mário Silva','(21)9999-8888','0001','23085-610',40,'ap 202','vazio'),
('456','Gabriel Silva','(21)9999-7777','0002','26551-090',100,'casa','vazio'),
('789','Mariana Souza','(21)9999-5555','1234','23085-610',1820,'casa','vazio');

insert into professor(disponibilidade,cpffuncionario)VALUES
('segunda e sexta dia todo','123'),
('terca,quarta e quinta dia todo','456');

insert into atividade(nomeatividade,descricao)VALUES
('jumpp','atividade realizada pulando em um trampolim'),
('spinning','atividade realizada em uma bicicleta com subidas');

insert into habilitaprofessor(idatividade,idprofessor)VALUES
(1,1),(2,1),(2,2);

insert into aula(dataaula,horario,idprofessor,idatividade)VALUES
('2022-12-05','de 15:00 às 15:30h',1,1),
('2022-12-09','de 08:00 às 9:00h',1,2),
('2022-12-06','de 07:00 às 08:00h',2,2);

insert into aulaaluno(matricula,idaula)VALUES
(1,1),(1,2),(2,3);

insert into produto(nome,cor,valor,tamanho,quantidade)VALUES
('mochila Paloma','rosa',150,'un',20),
('mochila Raissa','azul',120,'un',30);

insert into venda(data,valor,quantidade,codigoproduto,cpffuncionario)VALUES
('2022-12-05',300,2,1,'789'),
('2022-12-05',120,1,2,'789');




