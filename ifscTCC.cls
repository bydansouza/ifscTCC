%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instituto Federal de Educação, ciência e tecnologia de Santa Catarina                   
%---------------------------------------------------------------------------
% Arquivo para classe LaTex - Normas para apresentação de TCC do IFSC CÂMPUS Florianópolis (3ª Edição - Novembro de 2018
%---------------------------------------------------------------------------
% Versão 20191 - Baseada na classe 2018/11/24 v-1.9.7 abnTeX2 e UFSCthesis Versão 20100631
%                                                           
% (c)2019 Daniel Henrique Camargo de Souza (dansouza.mail@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                         
% This file may be distributed and/or modified              
%
% 1. under the LaTeX Project Public License and/or          
% 2. under the GNU Public License.                          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\NeedsTeXFormat{LaTeX2e}    % Identifica a versão de LaTeX em uso
\ProvidesClass{ifscTCC}     % Informa o tipo de documentclass

%---------------------------------------------------------------------------
% Passa as opções não interessantes para a classe base abnTeX2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions

%---------------------------------------------------------------------------
% Carrega classe abnTeX2, com padrão de página A4, fonte 12pt, frente e verso
\LoadClass[
	% -- opções da classe memoir --
	12pt,				% tamanho da fonte - Norma para TCC IFSC
	openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	twoside,			% para impressão em verso e anverso. Oposto a oneside
	a4paper,			% tamanho do papel. 
	% -- opções da classe abntex2 --
	chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	%section=TITLE,		% títulos de seções convertidos em letras maiúsculas
	%subsection=TITLE,	% títulos de subseções convertidos em letras maiúsculas
	%subsubsection=TITLE,% títulos de subsubseções convertidos em letras maiúsculas
	% -- opções do pacote babel --
	english,			% idioma adicional para hifenização
	french,             % idioma adicional para hifenização
	spanish,			% idioma adicional para hifenização
	brazil,				% o último idioma é o principal do documento
	]{abntex2}

% ----------------------------------------------------------
% PACOTES
% ----------------------------------------------------------

\usepackage{helvet}             % Fonte Arial 
\usepackage{lmodern}			% Usa a fonte Latin Modern
\usepackage[T1]{fontenc}		% Selecao de codigos de fonte.
\usepackage[utf8]{inputenc}		% Codificacao do documento (conversão automática dos acentos)
\usepackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\usepackage{color}				% Controle das cores
\usepackage{graphicx}			% Inclusão de gráficos
\usepackage{subfig}             % Inclusão de subfiguras
\usepackage{listings}           % Inclusão de códigos de softwares
\usepackage{float}              % Inclusão de numeros float
\usepackage[final]{pdfpages}    % Inclusão de PDFs
\usepackage{microtype}          % para melhorias de justificação

% Pacotes adicionais, usados no anexo do modelo de folha de identificação
\usepackage{multicol}
\usepackage{multirow}

% Pacotes adicionais, usados apenas no âmbito do Modelo Canônico do abnteX2
\usepackage{lipsum}				% para geração de dummy text

% Pacotes de citações
\usepackage[brazilian,hyperpageref]{backref}	% Paginas com as citações na bibl
\usepackage[alf]{abntex2cite}				% Citações padrão ABNT                                                 

\usepackage[brazil]{babel}	% coloca as coisas em portugues no sumário.
\usepackage[normalem]{ulem}	% provê sublinhados para textos (\ul)

\usepackage{indentfirst}	% indenta a primeira linha dos paragrafos
\usepackage{remreset}		% reinicia contadores
\usepackage{url}

% usado por abntex2-fichacatalografica.tex
\usepackage{lastpage}

%---------------------------------------------------------------------------
% Definicao da geometria da página - Conforme Norma para TCC IFSC
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
% CONFIGURAÇÕES DE PACOTES
% ----------------------------------------------------------
\renewcommand{\familydefault}{\sfdefault}             % Fonte Arial

% Definições para Título(chapter), subtítulo(Section) e demais - Conforme norma para TCC IFSC
\renewcommand{\ABNTEXchapterfontsize}{\normalsize\scshape\bfseries} % Maiúscula e negrito
\renewcommand{\ABNTEXsectionfontsize}{\normalsize\bfseries} %Negrito
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}  %Normal
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize\itshape} %Italico

\renewcommand{\ABNTEXsectionfont}{\sffamily}

% Remover Cabeçalho nas paginas Pares
\makepagestyle{parpage}
\makeevenhead{parpage}{\ABNTEXfontereduzida\thepage}{}{}
  
% Espaço 1,5 após os capitulos
\setlength{\afterchapskip}{\lineskip}

% Espaçamentos entre linhas e parágrafos 
\setlength{\parindent}{2.0cm}   % Identação do paragrafo conforme norma para TCC IFSC

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

% Configurações do pacote backref
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%
	
% Comandos criados pelo usuário
\newcommand{\afazer}[1]{{\color{red}{#1}}} % Para destacar uma parte a ser trabalhada

% Configurações de aparência do PDF final
% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\makeatletter
\hypersetup{
     	%pagebackref=true,
	pdftitle={\@title}, 
	pdfauthor={\@author},
   	pdfsubject={\imprimirpreambulo},
	%pdfcreator={LaTeX with abnTeX2},
	%pdfkeywords={abnt}{latex}{abntex}{abntex2}{relatório técnico}, 
	colorlinks=true,       		% false: boxed links; true: colored links
    linkcolor=blue,		          	% color of internal links
    citecolor=blue,        		% color of links to bibliography
    filecolor=magenta,      		% color of file links
	urlcolor=blue,
	bookmarksdepth=4
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Substituicao e criacao de elementos de documento do ABNTex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
