USE projeto_api_livros;

DELIMITER //
CREATE FUNCTION quant_titulo_por_autor (id_parametro INT) #Quantos titulos estão vinculados a determinado autor?
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT; #Declara a variável "total" para armazenar o resultado da function
    SELECT COUNT(*) INTO total #Faço a contagem e armazeno dentro de "total"
    FROM titulos_autores #Faço a contagem dentro da tabela titulos_autores (id_titulo, id_autor)
    WHERE id_autor = id_parametro; #Faço a contagem de titulo quando id_autor for igual ao id_parametro
    RETURN total; #Retorno o "total" com o resultado de contagem de titulo por autor
END //

CREATE FUNCTION quant_assunto_por_titulo (id_parametro INT) #Quantos assuntos estão vinculados a um determinado título?
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM titulos_assuntos
    WHERE id_titulo = id_parametro; 
    RETURN total;
END //

CREATE FUNCTION quant_titulo_por_assunto (id_parametro INT) #Quantos titulos estão vinculados a um determinado assunto?
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM titulos_assuntos
    WHERE id_assunto = id_parametro;
    RETURN total;
END //
DELIMITER ;

