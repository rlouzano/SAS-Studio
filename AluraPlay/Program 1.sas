LIBNAME alura "/folders/myfolders/AluraPlay";


PROC DATASETS
	lib=alura details;  /*INFORMA O DIRETORIO DA TABELA    LISTA QUANTAS LINHAS POSSUI QTD KBS E NOME DAS TABELAS*/
RUN;

PROC CONTENTS
	data=alura.cadastro_produto;
RUN;

PROC PRINT
	data=alura.cadastro_produto;   /* SELECT * FROM cadastro_produto */
run;

proc freq
	data=alura.cadastro_produto nlevels;  /* BUSCA NA MINHA TABELA POR FILTRO GENERO*/   
	/*nlevels mostra a quantidade de vezes que aparece o filtro que fiz*/
	
	table genero plataforma nome;   /*separando por colunmas*/
run;




DATA teste;
set alura.cadastro_produto;
if data > 201606 
	THEN lancamento = 1;
else  lancamento = 0;

/*  
IF	 	CRIA UMA COLUNA (LANCAMENTO) IF DATA > 201606  ENTÃO RECEBE O VALOR DE 1  
ELSE	CRIA UMA COLUNA (LANCAMENTO) IF DATA < 201606  ENTÃO RECEBE O VALOR DE 0
*/
run;


proc print
	data=teste;  
	/*
		NESTE CASO ELE VAI IMPRIMIR A TABELA cadastro_produto COM A COLUNA lancamento
	*/
run;


proc freq
	data=teste;
	table lancamento;
	/*
		ESTE PODE SER CHAMADO DE CONT-SE
	*/
run;


PROC FREQ
	data=teste;
	table genero*lancamento 
	/nocol norow nopercent;
	/*
		table genero*lancamento;
		REALIZO UM FILTRO POR FREQUENCIA, PORCENTAGEM  ENTRE OUTROS
		para não mostrar:  /nocol norow nopercent;
	*/
run;

proc freq 
	data=alura.cadastro_produto nlevels; /*quantidade de vezes que se repete*/
	table nome;
	table nome*genero
	/list;
	
	/*
		CRIANDO FILTRO NOME E GENERO NA TABELA
	*/
run;

data alura.cadastro_produto_v2;
set teste;
rename lancamento = flag_lancamento;  /*RENOMENDO UM COLUNA*/
label Genero = "Genero"
	lancamento = "Marca 1 para jogos que são lancamento e 0 caso contrário";
run;


PROC contents
	DATA=alura.cadastro_produto_v2;
run;



/*
COM ESTE COMANDO É POSSIVEL IMPORTAR UM PLANILHA DO EXCEL PARA O SAS


FILENAME REFFILE '/folders/myfolders/Arquivo.xlsx';
PROC IMPORT DATAFILE=REFFILE
    DBMS=XLSX
    OUT=WORK.BASE;
    GETNAMES=YES;
RUN;

*/










































