create  database Bd_Restaurante;
use Bd_Restaurante;

CREATE TABLE Tb_Cliente(
Id_Cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nome_Sobrenome VARCHAR(200) NOT NULL,
Telefone VARCHAR(20) NOT NULL,
Email VARCHAR(200) NOT NULL);

CREATE TABLE Tb_pedido(
Id_Pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Data_Hora DATETIME NOT NULL);

CREATE TABLE Tb_Prato(
Id_Prato INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Preço FLOAT NOT NULL,
Nome_Prato VARCHAR(200) NOT NULL,
Descricao VARCHAR(400) NOT NULL,
Categoria ENUM('Entrada','Prato Principal', 'Sobremesa','Bebida') NOT NULL);

CREATE TABLE Tb_Mesa(
Id_Mesa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Data_Hora_Reserva DATETIME NOT NULL,
Numero_Pessoas INT NOT NULL,
Status_Mesa ENUM('Confirmado','Cancelado') NOT NULL);

CREATE TABLE Tb_Reserva(
Id_Mesa INT NOT NULL,
Id_Cliente INT NOT NULL,
PRIMARY KEY (Id_Mesa,Id_Cliente),
CONSTRAINT Reserva_FK1 FOREIGN KEY (Id_Mesa) REFERENCES Tb_Mesa (Id_Mesa),
CONSTRAINT Reserva_FK2 FOREIGN KEY (Id_Cliente) REFERENCES Tb_Cliente (Id_Cliente)
);

CREATE TABLE Tb_Faz(
Id_Pedido INT NOT NULL,
Id_Cliente INT NOT NULL,
PRIMARY KEY (Id_Pedido,Id_Cliente),
CONSTRAINT Faz_FK1 FOREIGN KEY (Id_Pedido) REFERENCES Tb_Pedido (Id_Pedido),
CONSTRAINT Faz_FK2 FOREIGN KEY (Id_Cliente) REFERENCES Tb_Cliente (Id_Cliente)
);

CREATE TABLE Tb_Contem(
Id_Prato INT NOT NULL,
Id_Pedido INT NOT NULL,
PRIMARY KEY (Id_Prato,Id_Pedido),
CONSTRAINT Contem_FK1 FOREIGN KEY (Id_Prato) REFERENCES Tb_Prato (Id_Prato),
CONSTRAINT Contem_FK2 FOREIGN KEY (Id_Pedido) REFERENCES Tb_Pedido (Id_Pedido)
);


INSERT INTO Tb_Cliente(Nome_Sobrenome,Telefone,Email ) 
VALUES	('Maria Joaquina','81940028922','Joaquinadeusadomundo@gmail.com'),
		('Cilindro da Silva', '81988989820', 'Namoradodajoaquinaoficial@gmail.com'),
		('Jorge Muitagrana', '8190000001', 'Talaricodocilindro@gmail.com');

SELECT Id_Cliente,Nome_Sobrenome,Telefone,Email 
FROM Tb_Cliente;

INSERT INTO Tb_Pedido(Data_Hora) 
VALUES	('2024-05-20 19:30:00'),
		('2024-11-17 17:00:00');

SELECT Data_Hora FROM Tb_Pedido;

INSERT INTO Tb_Prato(Preço,Nome_Prato,Descricao,Categoria)
VALUES	('79.99', 'Batata Do Imalaia Frita', 'Uma explosão de sabores comparados a iroshima e nagazaki em forma de batata frita', 'Entrada'),
		('299.99', 'Vinho Seco Carreteiro do Antigo', 'Um ótimo acompanhamento para pratos finos que retrata uma vaga lembraça a locais com campus verdes', 'Bebida'),
        ('249.99', 'Miojo of Tumate', 'Um Prato excepcional com sabor de tomate criado pelo grande chef mauricio de souza','Prato Principal');

SELECT Id_Prato,Preço,Nome_Prato,Descricao,Categoria
FROM  Tb_Prato;

INSERT INTO Tb_Mesa(Data_Hora_Reserva,Numero_Pessoas,Status_Mesa)
VALUES 	('2024-11-25 17:00:00',4,'Confirmado'),
		('2025-01-17 20:00:00',2,'Confirmado'),
        ('2024-11-25 17:00:00',1,'Cancelado');
        
SELECT Id_Mesa,Data_Hora_Reserva,Numero_Pessoas,Status_Mesa
FROM Tb_Mesa;