USE projeto_api_livros;

INSERT INTO titulos_autores (id_titulo, id_autor)
SELECT DISTINCT tu.id, au.id
FROM livros l
JOIN titulos_unicos tu ON tu.titulo = l.titulo_padronizado
JOIN autores_unicos au ON au.autor = l.autor_padronizado;
select * from titulos_autores;

INSERT INTO titulos_assuntos (id_titulo, id_assunto)
SELECT DISTINCT tu.id, asu.id
FROM livros l
JOIN titulos_unicos tu ON tu.titulo = l.titulo_padronizado
JOIN assuntos_unicos asu ON asu.assunto = l.assunto_padronizado;

INSERT INTO titulos_anos (id_titulo, id_ano)
SELECT DISTINCT tu.id, anu.id
FROM livros l
JOIN titulos_unicos tu ON tu.titulo = l.titulo_padronizado
JOIN anos_unicos anu ON anu.ano = l.ano_publicacao;
