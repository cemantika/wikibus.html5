Tutorial para desenvolvedor do Wikibus (19/09/2013)

->Descri��o do Projeto: O Projeto atual do Wikibus est� escrito em Sencha (sistema que fornece ferramentas de desenvolvimento de aplicativos baseados em HTML5 e servi�os para a constru��o de aplicativos universais que funcionam em qualquer dispositivo) que se fundamenta em Javascript com todas as suas requisi��es feitas por ajax.

->Ambientes de Desenvolvimento: O projeto est� preparado para duas IDE's, o "Arquitect" (que � o ambiente padr�o Sencha) e o Eclipse.

->Suporte do Banco: Em "conectar.php" na pasta "php", pode-se ver a conex�o com um banco POSTGRES, sendo o banco do Simtur o utilizado nesse aplicativo. Pode-se encontrar um dump do banco para trabalhar localmente na pasta "documentation" no diret�rio do projeto.

->Github: O projeto est� no github, no reposit�rio de Jailson Brito, para clone e contribui��o � necess�rio que se fa�a uma conta e se solicite permiss�o para sua conta.

->Passos para preparar o ambiente:

===Ambiente
1� Baixe e instale uma das duas IDE's descritas acima (Arquitect ou Eclipse);
 
--Se optar pelo Eclipse, ap�s baixar voc� deve instalar os plugins para trabalhar com JavaScript e PHP seguindo os passos:

- HELP - Install New Software - Work With (selecione a vers�o do seu eclipse) - (Encontre e selecione os plugins que deseja para instala��o) - Prossiga com os next's

--J� o Arquitect j� vem pronto para trabalhar com JavaScript, mas n�o d� suporte ao PHP, que dever� ent�o ser trabalhado com algum outro software.

2� Baixe e instale o Git;
3� Baixe e instale o pgAdmin;

--No seguinte link existe um tutorial de passo a passo para instalar o postgres local e importar o banco do Simtur:

https://github.com/cemantika/ubibuscars.android/blob/master/PGINSTALL.MD

4� Baixe e instale o XAMPP;

--Para ativar o PostgreSQL no XAMPP basta alterar o arquivo <diret�rio_do_xampp>\xampp\php\php.ini, habilitando as seguintes linhas:

extension=php_pdo_pgsql.dll
extension=php_pgsql.dll

--Para habilitar as extens�es basta retirar o �;� da linha.

--Ap�s isso deve-se copiar o arquivo libpq.dll da pasta <diret�rio_do_xampp>\xampp\php para a pasta <diret�rio_do_xampp>\xampp\apache\bin e reiniciar o Apache.

5� Fa�a uma conta no github;

===Clonando o Projeto
6� Abra o GitBash e v� at� a pasta htdocs no xampp:
obs.: Onde est� esse "<diret�rio_do_xampp>" sempre informe o diret�rio onde voc� instalou o seu xampp.

cd <diret�rio_do_xampp>/xampp/htdocs/

7� Prossiga com o(s) seguinte(s) comando(s) para clonar o projeto:

git clone https://github.com/cemantika/wikibus.html5.git

--ap�s informar o comando de clonar ele solicitar� o usu�rio e senha do github, informe.
--O projeto foi clonado para o diret�rio "<diret�rio_do_xampp>/xampp/htdocs/wikibus".

---Agora voc� pode ver o app wikibus e os dados dele persistentes em seu browser, digitando na barra de endere�os:

localhost/wikibus

---e clicando em app.html

===Preparando a IDE
8� Abra a IDE e importe o projeto que est� no diret�rio "<diret�rio_do_xampp>/xampp/htdocs/wikibus".

-- A partir de agora voc� tem o projeto pronto para edi��o 

===Upando contribui��es do c�digo (branchs)
9� Atrav�s do GitBash ainda aberto crie um novo Branch para edi��o do c�digo com o(s) seguinte(s) comando(�s):

cd wikibus				
--para entrar na pasta do projeto.

git checkout -b "nome_do_branch"	
--cria um novo branch

---agora fa�a suas altera��es no c�digo atrav�s da sua IDE.

10� Para upar o seu branch abra o GitBash, v� at� o diret�rio do projeto, se j� n�o estiver nele (para conferir digite "ls" e d� enter para saber para qual pasta o GitBash est� apontando), e informe os seguintes comandos para dar commit e upar a colabora��o:

cd <diret�rio_do_xampp>/xampp/htdocs/wikibus
--apenas se voc� j� n�o estiver no diret�rio do projeto.

git checkout nome_do_branch
--vai para o branch que foram feitas as altera��es, n�o � necess�rio se voc� j� estiver nesse branch.

git add -A
--adiciona as novas altera��es no branch.

git commit -m "nome_do_commit"
--cria um pacote das altera��es para que sejam enviadas ao reposit�rio do github.

git push -u origin nome_do_branch
--envia o c�digo ao github.

---ele vai solicitar o seu usu�rio e senha do github, informe.

---Com isso a sua contribui��o foi enviada ao servidor para an�lise e posterior inclus�o ao c�digo master.

11� Ap�s upar alguma coisa, � de extrema import�ncia se atualizar o c�digo local do projeto antes de iniciar com qualquer branch novo, para atualizar o c�digo deve-se fazer o seguinte:

git checkout master
--para mudar para o branch master, se quiser voltar ao outro branch s� � usar o mesmo c�digo modificando o nome do branch pelo de seu interesse.

git pull
--ele vai solicitar o seu usu�rio e senha do github, informe.

---Ap�s isso d� um F5 no seu projeto na IDE.

12� Para novas contribui��es repita sempre a partir do 8� passo, lembre-se: cada nova altera��o � um novo branch, n�o recicle branchs j� utilizados, eles n�o s�o atualizados junto com o resto do projeto ao dar o comando "git pull".





M�rio Augusto Mota Martins
h2mario@gmail.com