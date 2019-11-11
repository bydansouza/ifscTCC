%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instituto Federal de Educa��o, ci�ncia e tecnologia de Santa Catarina                   
%---------------------------------------------------------------------------
% Arquivo para classe LaTex - Normas para apresenta��o de TCC do IFSC C�MPUS Florian�polis (3� Edi��o - Novembro de 2018
%---------------------------------------------------------------------------
% Vers�o 20191 - Baseada na classe 2018/11/24 v-1.9.7 abnTeX2 e UFSCthesis Vers�o 20100631
%                                                           
% (c)2019 Daniel Henrique Camargo de Souza (dansouza.mail@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% This file may be distributed and/or modified              
%
% 1. under the LaTeX Project Public License and/or          
% 2. under the GNU Public License.                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\NeedsTeXFormat{LaTeX2e}    % Identifica a vers�o de LaTeX em uso
\ProvidesClass{ifscTCC}     % Informa o tipo de documentclass

%---------------------------------------------------------------------------
% Passa as op��es n�o interessantes para a classe base abnTeX2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions

%---------------------------------------------------------------------------
% Carrega classe abnTeX2, com padr�o de p�gina A4, fonte 12pt, frente e verso
\LoadClass[
	% -- op��es da classe memoir --
	12pt,				% tamanho da fonte - Norma para TCC IFSC
	openright,			% cap�tulos come�am em p�g �mpar (insere p�gina vazia caso preciso)
	oneside,			% Impress�o em um Lado
	a4paper,			% tamanho do papel. 
	% -- op��es da classe abntex2 --
	chapter=TITLE,		% t�tulos de cap�tulos convertidos em letras mai�sculas
	%section=TITLE,		% t�tulos de se��es convertidos em letras mai�sculas
	%subsection=TITLE,	% t�tulos de subse��es convertidos em letras mai�sculas
	%subsubsection=TITLE,% t�tulos de subsubse��es convertidos em letras mai�sculas
	% -- op��es do pacote babel --
	english,			% idioma adicional para hifeniza��o
	french,             % idioma adicional para hifeniza��o
	spanish,			% idioma adicional para hifeniza��o
	brazil,				% o �ltimo idioma � o principal do documento
	]{abntex2}

% ----------------------------------------------------------
% PACOTES
% ----------------------------------------------------------
\usepackage{enumitem}

\usepackage{helvet}             % Fonte Arial 
\usepackage{lmodern}			% Usa a fonte Latin Modern
\usepackage[T1]{fontenc}		% Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}		% Codificacao do documento (convers�o autom�tica dos acentos)
\usepackage{indentfirst}		% Indenta o primeiro par�grafo de cada se��o.
\usepackage{color}				% Controle das cores
\usepackage{graphicx}			% Inclus�o de gr�ficos
\usepackage{subfig}             % Inclus�o de subfiguras
\usepackage{listings}           % Inclus�o de c�digos de softwares
\usepackage{float}              % Inclus�o de numeros float
\usepackage[final]{pdfpages}    % Inclus�o de PDFs
\usepackage{microtype}          % para melhorias de justifica��o

% Pacotes adicionais, usados no anexo do modelo de folha de identifica��o
\usepackage{multicol}
\usepackage{multirow}

% Pacotes adicionais, usados apenas no �mbito do Modelo Can�nico do abnteX2
\usepackage{lipsum}				% para gera��o de dummy text

% Pacotes de cita��es
\usepackage[brazilian,hyperpageref]{backref}	% Paginas com as cita��es na bibl
\usepackage[alf,ifscbib]{abntex2cite}				% Cita��es padr�o ABNT

\usepackage[brazil]{babel}	% coloca as coisas em portugues no sum�rio.
\usepackage[normalem]{ulem}	% prov� sublinhados para textos (\ul)

\usepackage{indentfirst}	% indenta a primeira linha dos paragrafos
\usepackage{remreset}		% reinicia contadores
\usepackage{url}

% usado por abntex2-fichacatalografica.tex
\usepackage{lastpage}

% pacote para espa�amentos
\usepackage{setspace}

% pacote para simbolos REGISTERED e ESPECIAL
\usepackage{textcomp}

%---------------------------------------------------------------------------
% Definicao da geometria da p�gina - Conforme Norma para TCC IFSC
\RequirePackage[
    inner=3.0cm,
    outer=2.0cm,
    top=3.0cm,
    bottom=2.0cm,
    head=0.7cm,
    foot=0.7cm
    ]{geometry}

\RequirePackage{ifscTCC}        % Inclui ifscTCC.sty

% ----------------------------------------------------------
% CONFIGURA��ES DE PACOTES
% ----------------------------------------------------------
\renewcommand{\familydefault}{\sfdefault}             % Fonte Arial

% Defini��es para T�tulo(chapter), subt�tulo(Section) e demais - Conforme norma para TCC IFSC
\renewcommand{\ABNTEXchapterfontsize}{\normalsize\scshape\bfseries} % Mai�scula e negrito
\renewcommand{\ABNTEXsectionfontsize}{\normalsize\bfseries} %Negrito
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}  %Normal
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize\itshape} %Italico

\renewcommand{\ABNTEXsectionfont}{\sffamily}

% Remover Cabe�alho nas paginas Pares
\makepagestyle{parpage}
\makeevenhead{parpage}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{parpage}{}{}{\ABNTEXfontereduzida\thepage}
  
% Espa�o 1,5 ap�s os capitulos
\setlength{\afterchapskip}{0.5cm} %\lineskip single space

% Espa�amentos entre linhas e par�grafos 
\setlength{\parindent}{2.0cm}   % Identa��o do paragrafo conforme norma para TCC IFSC

% Controle do espa�amento entre um par�grafo e outro:
\setlength{\parskip}{0.1cm}  % tente tamb�m \onelineskip

% Configura��es do pacote backref
% Usado sem a op��o hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p�gina(s):~}
% Texto padr�o antes do n�mero das p�ginas
\renewcommand{\backref}{}
% Define os textos da cita��o
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma cita{\c c}\~ao no texto.%
	\or
		Citado na p\'agina #2.%
	\else
		Citado #1 vezes nas p\'aginas #2.%
	\fi}%

% Comandos criados pelo usu�rio
\newcommand{\afazer}[1]{{\color{red}{#1}}} % Para destacar uma parte a ser trabalhada

% Fontes das figuras
\renewcommand{\fonte}[1]{\legend{\hspace{-218pt}Fonte: {#1}}}

% Configura��es de apar�ncia do PDF final
\definecolor{blue}{RGB}{41,5,195}
\definecolor{pretoifsc}{RGB}{0,0,0}

% informa��es do PDF
\makeatletter
\hypersetup{
    %pagebackref=true,
	pdftitle={\@title}, 
	pdfauthor={\@author},
   	pdfsubject={\imprimirpreambulo},
	%pdfcreator={LaTeX with abnTeX2},
	%pdfkeywords={abnt}{latex}{abntex}{abntex2}{relat�rio t�cnico}, 
	colorlinks=true,       		% false: boxed links; true: colored links
    linkcolor=pretoifsc,		          	% color of internal links
    citecolor=pretoifsc,        		% color of links to bibliography
    filecolor=pretoifsc,      		% color of file links
	urlcolor=pretoifsc,
	bookmarksdepth=4
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substituicao e criacao de elementos de documento do ABNTex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
