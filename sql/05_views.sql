USE projeto_api_livros;

#Lista de titulo e autor (nomes)
CREATE VIEW vw_titulo_autor AS 
SELECT tu.id, tu.titulo, au.autor
FROM titulos_autores ta
JOIN titulos_unicos tu ON tu.id = ta.id_titulo
JOIN autores_unicos au ON au.id = ta.id_autor
ORDER BY tu.id;

#Lista de titulo e assuntos (nomes)
CREATE VIEW vw_titulo_assunto AS
SELECT tu.id, tu.titulo, asu.assunto
FROM titulos_assuntos ta
JOIN titulos_unicos tu ON tu.id = ta.id_titulo
JOIN assuntos_unicos asu ON asu.id = ta.id_assunto
ORDER BY tu.id;

#Lista de titulo e ano de publicação
CREATE VIEW vw_titulo_ano AS
SELECT tu.id, tu.titulo, au.ano
FROM titulos_anos ta
JOIN titulos_unicos tu ON tu.id = ta.id_titulo
JOIN anos_unicos au ON au.id = ta.id_ano
ORDER BY tu.id;

#Quantidade de titulos por ano de publicação
CREATE VIEW vw_titulo_por_ano AS
SELECT 
	au.id, au.ano,
    COUNT(*) AS quant_titulos
FROM titulos_anos ta
JOIN anos_unicos au ON au.id = ta.id_ano
GROUP BY au.id, au.ano
ORDER BY au.id;

#Quantidade de assuntos por titulo
CREATE VIEW vw_assuntos_por_titulo AS 
SELECT 
	id, 
    titulo, 
    quant_assunto_por_titulo(id) AS total_assuntos 
FROM titulos_unicos
ORDER BY total_assuntos DESC;

#Quantidade de titulos por assunto
CREATE VIEW vw_titulos_por_assunto AS
SELECT 
	id, 
    assunto, 
    quant_titulo_por_assunto(id) AS total_titulos
FROM assuntos_unicos
ORDER BY total_titulos DESC;

#Quantidade de titulos por autor
CREATE VIEW vw_titulos_por_autor AS
SELECT 
	id,
    autor,
    quant_titulo_por_autor(id) AS total_titulos
FROM autores_unicos
ORDER BY total_titulos DESC;