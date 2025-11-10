USE projeto_api_livros;
 
CALL exportar_assuntos_por_titulo();
SELECT * FROM export_titulos_assuntos ORDER BY titulo;

CALL p_livros('history');

CALL p_livros_por_assunto('Romance');

CALL p_livros_por_autor('JANE');