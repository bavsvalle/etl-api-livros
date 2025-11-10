USE projeto_api_livros;

#Busca de livros de acordo com assunto desejado
DELIMITER //
CREATE PROCEDURE p_livros_por_assunto (IN assunto_nome VARCHAR(255)) -- Parametro de entrada (IN) = assunto_nome do tipo varchar (texto) com até 255 caracteres
BEGIN
    SELECT DISTINCT tu.id, tu.titulo, au.assunto
    FROM titulos_assuntos ta
    JOIN titulos_unicos tu ON tu.id = ta.id_titulo
    JOIN assuntos_unicos au ON au.id = ta.id_assunto
    WHERE au.assunto LIKE CONCAT('%', assunto_nome, '%')
    ORDER BY tu.titulo;
END //

#Busca de livros de acordo com autor desejado
CREATE PROCEDURE p_livros_por_autor (IN autor_nome VARCHAR(255)) -- Parametro de entrada (IN) = autor_nome do tipo varchar (texto) com até 255 caracteres
BEGIN
    SELECT tu.id, tu.titulo, au.autor
    FROM titulos_autores ta
    JOIN titulos_unicos tu ON tu.id = ta.id_titulo
    JOIN autores_unicos au ON au.id = ta.id_autor
    WHERE au.autor LIKE CONCAT('%', autor_nome, '%')
    ORDER BY tu.titulo;
END //

#Busca de informações do livro desejado
CREATE PROCEDURE p_livros (IN livro_nome VARCHAR(255)) -- Parametro de entrada (IN) = livro_nome do tipo varchar (texto) com até 255 caracteres
BEGIN
    SELECT DISTINCT tu.id, tu.titulo, au.autor, asu.assunto
    FROM livros l
    JOIN titulos_unicos tu ON tu.titulo = l.titulo_padronizado
    JOIN autores_unicos au ON au.autor = l.autor_padronizado
    JOIN assuntos_unicos asu ON asu.assunto = l.assunto_padronizado
    WHERE tu.titulo LIKE CONCAT('%', livro_nome, '%')
    ORDER BY tu.titulo;
END //

#Esportação de assuntos por título. Dependendo do caso se faz necessário utilizar tabelas temporárias.
CREATE PROCEDURE exportar_assuntos_por_titulo ()
BEGIN 
	DECLARE old_gcl INT DEFAULT 0;
    SELECT @@SESSION.group_concat_max_len INTO old_gcl;
    SET SESSION group_concat_max_len = greatest(1048576, old_gcl);
    DROP TEMPORARY TABLE IF EXISTS export_titulos_assuntos;
    CREATE TEMPORARY TABLE export_titulos_assuntos AS
	SELECT 
		tu.id AS id,
        tu.titulo AS titulo,
        GROUP_CONCAT(DISTINCT au.assunto ORDER BY au.assunto SEPARATOR '; ') AS assunto
	FROM titulos_unicos tu
    LEFT JOIN titulos_assuntos ta ON tu.id = ta.id_titulo
    LEFT JOIN assuntos_unicos au ON au.id = ta.id_assunto
    GROUP BY tu.id, tu.titulo;
    SET SESSION group_concat_max_len = old_gcl;
    END //
    DELIMITER ; 
    



