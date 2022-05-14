Create  Database CheckList
go

Use Checklist
go

CREATE  TABLE Loguin(
Cod_func INT PRIMARY KEY IDENTITY(1,1),
                         Nome Varchar(50) NOT NULL,
						 Cargo Varchar(50) NOT NULL,
						 Senha INT NOT NULL
)
go

insert into Loguin(Nome,Cargo,Senha)
	Values('Ederval','Auditor',1234);
insert into Loguin(Nome,Cargo,Senha)
	Values('Messi','Auditor',2222);
insert into Loguin(Nome,Cargo,Senha)
	Values('Ronaldo','Supervisor',9999);
insert into Loguin(Nome,Cargo,Senha)
	Values('Maradona','Lider',1111);
go

CREATE  TABLE Modelo(
Cod_Modelo INT PRIMARY KEY IDENTITY(1,1),
				M_descricao Varchar(50) NOT NULL,
				M_Imagem varchar(500) NOT NULL
)
go

insert into Modelo(M_descricao,M_Imagem)
	Values('Arbus 200','jpeg1');
insert into Modelo(M_descricao,M_Imagem)
	Values('Bc_pec 610','jpeg2');
insert into Modelo(M_descricao,M_Imagem)
	Values('Aj_LH','jpeg3');
insert into Modelo(M_descricao,M_Imagem)
	Values('JATÃO 600','jpeg4');
insert into Modelo(M_descricao,M_Imagem)
	Values('jATÃO 400','jpeg5');
go
 
 CREATE  TABLE Inicio(
 Cod_inicio INT PRIMARY KEY IDENTITY(1,1),
				
							I_horaInicial Time,
							I_DataInicial Date,
							l_lote Int NOT NULL,
							I_Checar Varchar(30)NOT NULL,
							I_Finalizar Varchar (200) NOT NULL,
							I_Status char(1) NOT NULL,
							I_Quantidade Int NOT NULL,
							I_Historico Varchar (100) NOT NULL,
							ID_func INT,
							ID_Modelo INT
 )
 go
 
  insert into Inicio(I_horaInicial,I_DataInicial,l_lote,I_Checar,
 I_Finalizar,I_Status,I_Quantidade,I_Historico)
	Values('10:19:00','01/05/2022',123456,'Comcluido','Em operação','S',1,'Em operação');
insert into Inicio(I_horaInicial,I_DataInicial,l_lote,I_Checar,
 I_Finalizar,I_Status,I_Quantidade,I_Historico)
	Values('11:18:00','02/01/2022',222222,'Pendencia','Em operação','N',2,'Em Andamento');
insert into Inicio(I_horaInicial,I_DataInicial,l_lote,I_Checar,
 I_Finalizar,I_Status,I_Quantidade,I_Historico)
	Values('08:40:00','08/08/2022',333333,'Prioridade','Em operação','S',1,'Finalizdo');
insert into Inicio(I_horaInicial,I_DataInicial,l_lote,I_Checar,
 I_Finalizar,I_Status,I_Quantidade,I_Historico)
	Values('16:19:00','01/01/2022',444444,'Concluido','Em operação','N',1,'Bloqueada');
insert into Inicio(I_horaInicial,I_DataInicial,l_lote,I_Checar,
 I_Finalizar,I_Status,I_Quantidade,I_Historico)
	Values('11:19:00','11/05/2021',555555,'Pendente','Em operação','S',1,'Em Auditoria')	
	
go

ALTER TABLE Inicio ADD CONSTRAINT FK_Loguin_Inicio
FOREIGN KEY(ID_func) REFERENCES Loguin (Cod_func)
GO

ALTER TABLE Inicio ADD CONSTRAINT FK_Modelo_Inicio
FOREIGN KEY(ID_Modelo) REFERENCES Modelo (Cod_Modelo)
GO




   
  CREATE  TABLE Inspecao(
	Cod_Inspecao INT PRIMARY KEY IDENTITY(1,1),
	Insp_Tproblemas Varchar(50) NOT NULL,
	Insp_Nproblema  Varchar(50) NOT NULL,
	Insp_Cproblema	Varchar(50) NOT NULL,
	Insp_Inspecionado Varchar(50) NOT NULL,
	Insp_Descricao		Varchar(50) ,
	Insp_Checar		Varchar(30) NOT NULL,
	Insp_Funcional	Varchar(50) NOT NULL,
	Insp_Quantiade Int,
	Insp_Modificado	Varchar(50) NOT NULL,
	ID_func INT,
	ID_inicio INT
  )
  go

insert into Inspecao(Insp_Tproblemas,Insp_Nproblema,Insp_Cproblema,Insp_Inspecionado,Insp_Descricao,
  Insp_Checar,Insp_Funcional,Insp_Quantiade,Insp_Modificado)
	Values('Mecânico','Grave','Montagem','conformidade','ok','C','Vazamento',1,'Alterado');
insert into Inspecao(Insp_Tproblemas,Insp_Nproblema,Insp_Cproblema,Insp_Inspecionado,Insp_Descricao,
  Insp_Checar,Insp_Funcional,Insp_Quantiade,Insp_Modificado)
	Values('Acabamento','Gravissimo','Logistica','Aprovado','ok','N',' falta Lubrificação',1,'Modificado');
insert into Inspecao(Insp_Tproblemas,Insp_Nproblema,Insp_Cproblema,Insp_Inspecionado,Insp_Descricao,
  Insp_Checar,Insp_Funcional,Insp_Quantiade,Insp_Modificado)
	Values('Pintura','Médio','Estrutura(SOLDA)','conformidade','ok','C','Mal funcionamento',2,'CCCC');

go
ALTER TABLE Inspecao ADD CONSTRAINT FK_Loguin_Inspecao
FOREIGN KEY(ID_func) REFERENCES Inspecao (Cod_Inspecao)
GO

ALTER TABLE Inspecao ADD CONSTRAINT FK_Inicio_Inspecao
FOREIGN KEY(ID_Inicio) REFERENCES Inicio (Cod_inicio)
GO



    CREATE TABLE  Imagem(
				Cod_imagens INT PRIMARY KEY IDENTITY(1,1),
				Imag_descricao Varchar(500) NOT NULL,
				ID_Inspecao INT 
	)
	go

	insert into Imagem(Imag_descricao)
	Values('Teste.jpg');
	insert into Imagem(Imag_descricao)
	Values('Teste1.jpg');
	insert into Imagem(Imag_descricao)
	Values('Teste2.jpg');
	insert into Imagem(Imag_descricao)
	Values('Teste3.jpg');
	go

ALTER TABLE Imagem ADD CONSTRAINT FK_Inspecao_Imagem
FOREIGN KEY(ID_Inspecao) REFERENCES Inspecao (Cod_Inspecao)
GO
	
	
 select* from Inspecao