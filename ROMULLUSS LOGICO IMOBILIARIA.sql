/* Lógico_1Romullus: */

CREATE DATABASE Romullus;
use Romullus;
CREATE TABLE Usuario (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome varchar(120),
    Senha NCHAR(32),
    DataHoraCrianao DATE,
    DataHoraUltimoAcesso DATE,
    Email varchar(120),
    fk_TipoUsuario_ID INT
);



CREATE TABLE TipoUsuario (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Tipo VARCHAR(80)
);
CREATE TABLE Cidade (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome_cidade VARCHAR(60),
    fk_UF_ID INT
);

CREATE TABLE Bairro (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome_bairro varchar(120)
);

CREATE TABLE UF (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome_UF varchar(120),
    Sigla_UF varchar(120)
);
CREATE TABLE Endereco (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Logradouro VARCHAR(120),
    Numero INT,
    Complemento TEXT,
    fk_Bairro_ID INT
);

CREATE TABLE TipoAnuncio (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome_Tipo_Anuncio varchar(120)
);

CREATE TABLE Imovel (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Qtd_vaga INT,
    Qtd_quarto INT,
    Qtd_suite INT,
    Qtd_banheiro INT,
    Area_util INT,
    Valor_imovel DECIMAL,   
    Observacoes TEXT,
    fk_TipoImovel_ID INT,
    fk_Endereco_ID INT,
    fk_TipoAnuncio_ID INT
);

CREATE TABLE TipoImovel (
    ID INT PRIMARY KEY IDENTITY(1,1),
    NomeTipoImovel varchar(120)
);
CREATE TABLE Imagem (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nome_Imagem varchar(120),
    url varchar(120),
    fk_Imovel_ID INT
);

CREATE TABLE Login (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Email varchar(120),
    Senha NCHAR(32),
    fk_Usuario_ID INT
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_ID)
    REFERENCES TipoUsuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_1
    FOREIGN KEY (fk_UF_ID)
    REFERENCES UF (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Bairro_ID)
    REFERENCES Bairro (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_2
    FOREIGN KEY (fk_TipoImovel_ID)
    REFERENCES TipoImovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_3
    FOREIGN KEY (fk_Endereco_ID)
    REFERENCES Endereco (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_4
    FOREIGN KEY (fk_TipoAnuncio_ID)
    REFERENCES TipoAnuncio (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_2
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (fk_Usuario_ID)
    REFERENCES Usuario (ID);

	insert into TipoUsuario (Tipo) values ('Corretor'),('Cliente');

	insert into UF (Nome_UF,Sigla_UF) values ('Distrito Federal','DF'),('Acre','AC'),('Alagoas','AL'),
('Amapá','AP'),('Amazonas','AM'),('Bahia','BA'),('Ceará','CE'),('Espírito Santo','ES'),('Goiás','GO'),('Maranhão','MA'),
('Mato Grosso','MT'),('Mato Grosso do Sul','MS'),('Minas Gerais','MG'),('Pará','PA'),('Paraíba','PB'),('Paraná','PR'),('Pernambuco','PE'),
('Piauí','PI'),('Rio de Janeiro','RJ'),('Rio Grande do Norte','RN'),('Rio Grande do Sul','RS'),('Rondônia','RO'),('Roraima','RR'),('Santa Catarina','SC'),
('São Paulo','SP'),('Sergipe','SE'),('Tocantins','TO');

insert into TipoImovel(NomeTipoImovel) values ('Casa'),('Apartamento'),('Lote'),('Sobrado');

insert into TipoAnuncio (Nome_Tipo_Anuncio) values ('Venda'),('Aluguel');

insert into Imovel (Qtd_vaga,Qtd_quarto,Qtd_suite,Qtd_banheiro,Area_util,
Valor_imovel,Observacoes,fk_TipoImovel_ID,fk_Endereco_ID,fk_TipoAnuncio_ID) 
values (2,4,2,3,50,500000,'Vende-se',1,1,1);
insert into Imovel (Qtd_vaga,Qtd_quarto,Qtd_suite,Qtd_banheiro,Area_util,
Valor_imovel,Observacoes,fk_TipoImovel_ID,fk_Endereco_ID,fk_TipoAnuncio_ID) 
values (2,4,2,3,50,4000,'Aluguel',2,22,1),(2,2,2,3,50,200000,'Vende-se',3,9,1),(2,4,2,3,50,500000,'Vende-se',1,10,1),
(2,4,2,3,50,300000,'Vende-se',1,16,1),(2,2,1,1,50,5000,'Aluguel',2,1,1),(2,3,2,3,50,300000,'Vende-se',1,3,1),(2,4,2,3,50,200000,'Vende-se',1,11,1),
(2,4,2,3,50,400000,'Vende-se',1,17,1),(2,2,1,2,30,3000,'Aluguel',2,1,1),(2,2,2,3,50,200000,'Vende-se',1,4,1),(2,4,2,3,50,300000,'Vende-se',1,12,1),
(2,4,2,3,50,500000,'Vende-se',1,18,1),(1,2,1,1,10,2000,'Aluguel',2,1,1),(2,4,2,3,50,600000,'Vende-se',1,5,1),(2,4,2,3,50,400000,'Vende-se',1,13,1),
(2,4,2,3,50,600000,'Vende-se',1,19,1),(2,2,2,2,20,4000,'Aluguel',2,1,1),(2,4,2,3,50,700000,'Vende-se',1,6,1),(2,4,2,3,50,500000,'Vende-se',1,14,1),
(2,4,2,3,50,700000,'Vende-se',1,20,1),(1,2,1,1,20,2000,'Aluguel',2,1,1),(2,4,2,3,50,200000,'Vende-se',1,7,1),(2,4,2,3,50,600000,'Vende-se',1,15,1),
(2,4,2,3,50,800000,'Vende-se',1,21,1),(2,2,2,2,20,5000,'Aluguel',2,1,1),(2,4,2,3,50,400000,'Vende-se',1,8,1),(2,4,2,3,50,700000,'Vende-se',1,23,1),
(2,4,2,3,50,900000,'Vende-se',1,24,1),(2,4,2,3,50,500000,'Vende-se',1,25,1),(2,4,2,3,50,500000,'Vende-se',1,26,1),(2,4,2,3,50,800000,'Vende-se',1,27,1),
(2,4,2,3,50,4000,'Aluguel',2,28,1),(2,2,2,3,50,200000,'Vende-se',3,35,1),(2,4,2,3,50,500000,'Vende-se',1,42,1),(2,4,2,3,50,300000,'Vende-se',1,49,1),
(2,2,1,1,50,5000,'Aluguel',2,29,1),(2,3,2,3,50,300000,'Vende-se',1,36,1),(2,4,2,3,50,200000,'Vende-se',1,43,1),(2,4,2,3,50,400000,'Vende-se',1,50,1),
(2,2,1,2,30,3000,'Aluguel',2,30,1),(2,2,2,3,50,200000,'Vende-se',1,37,1),(2,4,2,3,50,300000,'Vende-se',1,44,1),(2,4,2,3,50,500000,'Vende-se',1,51,1),
(1,2,1,1,10,2000,'Aluguel',2,31,1),(2,4,2,3,50,600000,'Vende-se',1,38,1),(2,4,2,3,50,400000,'Vende-se',1,45,1),(2,4,2,3,50,600000,'Vende-se',1,52,1),
(2,2,2,2,20,4000,'Aluguel',2,32,1),(2,4,2,3,50,700000,'Vende-se',1,39,1),(2,4,2,3,50,500000,'Vende-se',1,46,1),(2,4,2,3,50,700000,'Vende-se',1,53,1),
(1,2,1,1,20,2000,'Aluguel',2,33,1),(2,4,2,3,50,200000,'Vende-se',1,40,1),(2,4,2,3,50,600000,'Vende-se',1,47,1),(2,4,2,3,50,800000,'Vende-se',1,54,1),
(2,2,2,2,20,5000,'Aluguel',2,34,1),(2,4,2,3,50,400000,'Vende-se',1,41,1),(2,4,2,3,50,700000,'Vende-se',1,48,1),(2,4,2,3,50,900000,'Vende-se',1,55,1),
(2,4,2,3,50,500000,'Vende-se',1,25,1),(2,4,2,3,50,500000,'Vende-se',1,26,1),(2,4,2,3,50,800000,'Vende-se',1,56,1);

--feito o restante dos imóveis--

insert into Imagem (Nome_Imagem,url,fk_Imovel_ID) values ('1-1','\ASSETS\1-1.jpg',1),('1-2','\ASSETS\1-2.jpg',1),('2-1','\ASSETS\2-1.jpeg',2),
('2-2','\ASSETS\2-2.jpeg',2),('3-1','\ASSETS\3-1.jpg',3),('3-2','\ASSETS\3-2.jpg',3),('4-1','\ASSETS\4-1.jpeg',4),('4-2','\ASSETS\4-2.jpeg',4),
('5-1','\ASSETS\5-1.jpeg',5),('5-2','\ASSETS\5-2.jpeg',5),('6-1','\ASSETS\6-1.jpeg',6),('6-2','\ASSETS\6-2.jpeg',6),('7-1','\ASSETS\7-1.jpeg',7),
('7-2','\ASSETS\7-2.jpeg',7),('8-1','\ASSETS\8-1.jpeg',8),('8-2','\ASSETS\8-2.jpeg',8),('9-1','\ASSETS\9-1.jpeg',9),('9-2','\ASSETS\9-2.jpeg',9),
('10-1','\ASSETS\10-1.jpeg',10),('10-2','\ASSETS\10-2.jpeg',10);

select * from Imovel;
select * from Endereco;
select * from Usuario;
select * from TipoUsuario;
select * from TipoImovel;
select * from TipoAnuncio;

alter table dbo.Bairro add fk_Cidade_ID int;

alter table Bairro add constraint fk_Cidade_ID foreign key  (fk_Cidade_ID) references Cidade (ID);

insert into Cidade (Nome_cidade,fk_UF_ID) values ('Taguatinga',1),('Guara',1);
insert into Cidade (Nome_cidade,fk_UF_ID) values ('Taruaca',2),('Cruzeiro do Sul',2),('Pilar',3),('Murici',3),
('Macapá',4),('Santana',4),('Manaus',5),('Autazes',5),('Ilheus',6),('Salvador',6),('Fortaleza',7),('Aracati',7),
('Colatina',8),('Vila Velha',8),('Cristalina',9),('Anapolis',9),('São Luís',10),('Codó',10),('Cuiabá',11),('Sinop',11),
('Ponta Porã',12),('Corumba',12),('Uberlândia',13),('Montes Claros',13),('Parauapebas',14),('Belém',14),('João Pessoa',15),('Campina Grande',15),
('Londrina',16),('Paranagua',16),('Recife',17),('Jabotão dos Guarapes',17),('Teresina',18),('Campo Maior',18),('Duque de Caxias',19),('Petropólis',19),
('Natal',20),('Mossoró',20),('Porto Alegre',21),('Araricá',21),('Porto Velho',22),('Ji-Paraná',22),('Boa Vista',23),('Rorainópolis',23),('Florianópolis',24),('Balneário Camboriú',24)
,('São Paulo',25),('Campinas',25),('Aracaju',26),('Itabaiana',26),('Palmas',26),('Porto Nacional',26);
--inserir o restante da cidades--
insert into Bairro (Nome_bairro,fk_Cidade_ID) values ('QNA',1),('QNC',1),('SQB',2),('QI',2);
insert into Bairro (Nome_bairro,fk_Cidade_ID) values ('CAB',3),('XYZ',3),('RIO',4),('LOP',4),('BRS',5),('VPL',5),('CAP',6),('EPO',6),('FLO',7),('CRS',7),
('LUM',8),('MVC',8),('LAL',9),('PDS',9),('GVL',10),('CGO',10),('SAP',11),('BVP',11),('MDN',12),('HPS',12),('RTS',13),('ZNA',13),('SCP',14),('LIM',14),('TTM',15),('LPS',15),('SVO',16),
('LAR',16),('NVL',17),('GNO',17),('CTO',18),('BAL',18),('RCL',19),('PNC',19),('BMC',20),('LRS',20),('SDO',21),('VLA',21),('TNO',22),('GVP',22),
('SLV',23),('PTM',23),('LZO',24),('RSM',24),('NVA',25),('GLO',25),('CTP',26),('TLO',26);
--inserir o restante dos bairros--
insert into Endereco (Logradouro,Numero,Complemento,fk_Bairro_ID) values ('Avenida Palmeira',25,'Casa',2),('Avenida Coqueiro',37,'Casa',1),
('Avenida Quiteria',77,'Casa',4),('Avenida Flores',66,'Casa',3);
insert into Endereco (Logradouro,Numero,Complemento,fk_Bairro_ID) values ('Vale Florido',1,'Casa',3),('Rio Azul',1,'Casa',20),('Serra Dourada',2,'Casa',10),('Jardim Sereno',2,'Casa',15),
('Praia da Lua',3,'Casa',11),('Morro Verde',3,'Casa',18),('Bela Vista Nova',4,'Casa',10),('Sol Quente',4,'Casa',14),('Flores do Cerrado',5,'Casa',12),('Nova Esperança',5,'Casa',16),('Cidade Harmonia',6,'Casa',10),
('Bosque Encantado',6,'Casa',27),('Colina Alegre',7,'Casa',15),('Pedra do Sol',7,'Casa',19),('Vila Aurora',8,'Casa',18),('Lagoa Tranquila',8,'Casa',19),('Parque das Palmeiras',9,'Casa',11),('Recanto das Águas',9,'Casa',16),
('Terra da Serra',10,'Casa',10),('Lua Bella',10,'Casa',20),('Monte Cristal',11,'Casa',15),('Vila Primavera',11,'Casa',16),('Praça da Amizade',12,'Casa',20),('Alto do Horizonte',12,'Casa',30),('São Miguel do Bosque',13,'Casa',15),
('Cidade do Ouro',13,'Casa',20),('Ribeirão Sereno',14,'Casa',15),('Jardim das Palmeiras',14,'Casa',20),('Lagoa Azul',15,'Casa',7),('Vista Verde',15,'Casa',14),('Pôr do Dia',16,'Casa',10),('Estrela do Sul',16,'Casa',25),('Santo Antônio das Flores',17,'Casa',28),
('Canto da Serra',17,'Casa',41),('Recanto do Céu',18,'Casa',10),('Belmonte Novo',18,'Casa',20),('Fonte da Juventude',19,'Casa',15),('Porto das Águas',19,'Casa',18),('Céu Aberto',20,'Casa',15),('Nova Aurora',20,'Casa',16),
('Vale Encantado',21,'Casa',26),('Mirante do Sol',21,'Casa',30),('Cidade das Artes',22,'Casa',27),('Bairro das Estrelas',22,'Casa',45),('Serra do Silêncio',23,'Casa',18),('Lagoa Serena',23,'Casa',27),
('Praia do Ouro',24,'Casa',18),('Jardim das Maravilhas',24,'Casa',34),('Canto da Natureza',25,'Casa',18),('Alameda dos Ipês',25,'Casa',19),('Vista da Lua',26,'Casa',10),('Cidade das Colinas',26,'Casa',15);
/*inserir primeiro uf, cidade e bairro*/
go
create procedure imagensporimovel
	 @imovelID int 
as 
begin
	select * from imagem
	where fk_imovel_ID = @imovelID;
end;


execute imagensporimovel @imovelID = 1;
go
create procedure inserirlog
*	
	@email varchar (120),
	@senha varchar (32),
	@fk_Usuario int
as
begin
 insert into Login (Email,Senha, fk_Usuario_ID)
 values (@Email,@Senha,@fk_Usuario);
end;

go

select * from Usuario;

exec inserirlog  @Email = 'email3321', @senha = 'adminadmin',@fk_Usuario = 1;
/*deu erro no execute pois não há usuario cadastrado*/
/*drop procedure inserirlog;*/
go

create procedure deletelog
	@id int --diferenciar uma variavel de uma coluna
	as
	begin --inicio do escopo
	 delete from Login --funcionalidade da procedures
	 where id = @id;
	end; --final do escopo
go
exec deletelog @id = 1; 

go
/*buscar imovel por tipo de anuncio*/
create procedure ImoveisTipoAnuncio
@idTipo int
as
begin
	select *
	from Imovel
	where fk_TipoAnuncio_ID = @idTipo;
end;
go
exec ImoveisTipoAnuncio @idTipo = 2;
go
/*criação de procedure aumento de 10%, obs exec Aumento @fatorAumento = 0.5; reduz o valor */
/*obs exec Aumento @fatorAumento = 1.5; aumenta o valor*/
create procedure Aumento
	@fatorAumento float
	as
	begin
		update Imovel
		set Valor_imovel = Valor_imovel * @fatorAumento;
	end;
go
exec Aumento @fatorAumento = 2.5;
go

select * from Imovel;
create procedure inserirUsuario
	@Nome varchar (120),
	@Senha varchar (32),
	@Email varchar (120),
	@fk_TipoUsuario_ID int
	 as 
	 begin
	 insert into Usuario (Nome,Senha,DataHoraCrianao,DataHoraUltimoAcesso,Email,fk_TipoUsuario_ID)
	 values (@Nome,@Senha,getdate(),getdate(),@Email,@fk_TipoUsuario_ID);
	 end;
go	 
exec inserirUsuario @Nome = 'Thiago',@Senha = 'admin1616',@Email = 'thiago@corretor.com', @fk_TipoUsuario_ID = 1;
exec inserirUsuario @Nome = 'Romulo',@Senha = 'admin1234',@Email = 'romulo@corretor.com', @fk_TipoUsuario_ID = 1;
exec inserirUsuario @Nome = 'Celso',@Senha = 'admin9827',@Email = 'celso@corretor.com', @fk_TipoUsuario_ID = 1;
exec inserirUsuario @Nome = 'Tatiene',@Senha = 'admin7184',@Email = 'tatiene@corretor.com', @fk_TipoUsuario_ID = 1;
exec inserirUsuario @Nome = 'Gomes',@Senha = 'meulotenovo',@Email = 'gomes@email.com', @fk_TipoUsuario_ID = 2;
exec inserirUsuario @Nome = 'Perseguin',@Senha = 'casanova',@Email = 'lucas@email.com', @fk_TipoUsuario_ID = 2;
exec inserirUsuario @Nome = 'Pedro',@Senha = '8427331',@Email = 'pedro@email.com', @fk_TipoUsuario_ID = 2;
exec inserirUsuario @Nome = 'Jaja',@Senha = 'jajafk',@Email = 'jaja@email.com', @fk_TipoUsuario_ID = 2;
/*já adicionados*/
go
create view vw_DetalhesImovelDF as
select
	i.ID,
	i.Valor_imovel,
	e.Logradouro,
	e.Numero,
	b.Nome_bairro,
	c.Nome_cidade,
	u.Nome_UF
from Imovel i
join Endereco e
	on i.fk_Endereco_ID = e.ID
Join Bairro b
	on e.fk_Bairro_ID = b.ID
join Cidade c
	on b.fk_Cidade_ID = c.ID
join UF u
	on c.fk_UF_ID = u.ID
where Nome_UF = 'Distrito Federal';

select * from vw_DetalhesImovelDF;
go
--crie uma view para mostrar a quantidade de imóveis por cidade--
go
create view vw_QuantidadedeImoveis as 
 select c.Nome_cidade,
 count (c.Nome_cidade) as qtd_Imoveis
 from Imovel i
join Endereco e 
on i.fk_Endereco_ID = e.ID
join Bairro b
on e.fk_Bairro_ID = b.ID
join Cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
group by Nome_cidade;
go
--view de quantidade de imoveis por anuncio--
go 
create view imoveisportipodeanuncio as
select i.ID,Qtd_vaga,Qtd_quarto,Qtd_suite,Qtd_banheiro,Area_util,Valor_imovel,Observacoes,fk_TipoImovel_ID,fk_Endereco_ID,fk_TipoAnuncio_ID
from Imovel i 
join TipoAnuncio ta 
on i.fk_TipoAnuncio_ID = ta.ID
;
go
go 
create view vwsomaimoveis as 
select ti.NomeTipoImovel,
sum (i.Valor_imovel) as somadostipos
from Imovel i 
join TipoImovel ti
on  i.fk_TipoImovel_ID = ti.ID
group by ti.NomeTipoImovel
;
go

select * from vwsomaimoveis;
select * from imoveisportipodeanuncio;
select * from vw_QuantidadedeImoveis where vw_QuantidadedeImoveis.Nome_cidade = 'Ponta Porã';
select * from Imovel;
select * from Endereco;
select * from Usuario;
select * from TipoUsuario;
select * from TipoImovel;
select * from TipoAnuncio;
select * from Cidade;
select * from Bairro;
select * from UF;