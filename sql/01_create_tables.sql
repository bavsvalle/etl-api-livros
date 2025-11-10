USE projeto_api_livros;

#Alteração de tabelas únicas, com inclusão de PK
ALTER TABLE anos_unicos
ADD COLUMN ID INT PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE assuntos_unicos
ADD COLUMN ID INT PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE autores_unicos
ADD COLUMN ID INT PRIMARY KEY AUTO_INCREMENT FIRST;

ALTER TABLE titulos_unicos
ADD COLUMN ID INT PRIMARY KEY AUTO_INCREMENT FIRST;

#Criação de tabelas intermediárias
CREATE TABLE titulos_autores (
id_titulo INT,
id_autor INT,
PRIMARY KEY (id_titulo, id_autor),
FOREIGN KEY (id_titulo) REFERENCES titulos_unicos(id),
FOREIGN KEY (id_autor) REFERENCES autores_unicos(id)
);

CREATE TABLE titulos_assuntos (
id_titulo INT,
id_assunto INT,
PRIMARY KEY (id_titulo, id_assunto),
FOREIGN KEY (id_titulo) REFERENCES titulos_unicos(id),
FOREIGN KEY (id_assunto) REFERENCES assuntos_unicos(id)
);

CREATE TABLE titulos_anos (
id_titulo INT,
id_ano INT,
PRIMARY KEY (id_titulo, id_ano),
FOREIGN KEY (id_titulo) REFERENCES titulos_unicos(id),
FOREIGN KEY (id_ano) REFERENCES anos_unicos(id)
);