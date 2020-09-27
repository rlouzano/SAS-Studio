/*
* ANALISE SOBRE A VARIVEL DE DATA DA BASE DE CADASTRO PRODUTO
*/


PROC FREQ
	data=alura.cadastro_produto;
	table Data;
RUN;


DATA teste1;
set alura.cadastro_produto;
where data is missing;  /* Não vai mostrar a coluna DATA na planilha*/

run;