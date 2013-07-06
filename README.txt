Tutorial para desenvolvedor do Wikibus (03/07/2013)

->Descri��o do Projeto: O Projeto atual do Wikibus est� escrito em Sencha (sistema que fornece ferramentas de desenvolvimento de aplicativos baseados em HTML5 e servi�os para a constru��o de aplicativos universais que funcionam em qualquer dispositivo) que se fundamenta em Javascript com todas as suas requisi��es feitas por ajax.

->Ambientes de Desenvolvimento: O projeto est� preparado para duas IDE's, o "Arquitect" (que � o ambiente padr�o Sencha) e o Eclipse.

->Suporte do Banco: Em "conectar.php" na pasta "php", pode-se ver a conex�o com o banco, existem duas vers�es de conex�o com o banco nesse file, uma com conex�o a um banco MYSQL, que foi adicionado para importa��o com o nome de "wikibus.sql" na pasta "documentation" no diret�rio principal do projeto, e a outra conex�o est� comentada no c�digo, ela supostamente deve conectar com o banco do POSTGRES, l� existe o endere�o de ip, nome de usu�rio e senha por�m o banco do servidor ainda n�o est� pronto para suportar o wikibus e essa conex�o necessita de uma re-an�lise. Para trabalhar com o banco MYSQL � recomendado o download e instala��o do XAMPP para preparar o ambiente de testes do wikibus.

->Github: O projeto est� no github, no reposit�rio de Jailson Brito, para clone e
contribui��o � necess�rio que se fa�a uma conta e se solicite permiss�o para sua 
conta.

->Passos para preparar o ambiente:

===Ambiente
1� Baixe e instale uma das duas IDE's descritas acima;
2� Baixe e instale o Git;
3� Baixe e instale o XAMPP;
4� Fa�a uma conta no github;

===Clonando o Projeto e criando o Banco
4� Abra o GitBash e v� at� a pasta htdocs no xampp:
obs.: Onde est� esse "<diret�rio_do_xampp>" sempre informe o diret�rio onde voc� instalou o seu xampp.

cd <diret�rio_do_xampp>/xampp/htdocs/

5� Prossiga com o(s) seguinte(s) comando(s) para clonar o projeto:

git clone https://github.com/cemantika/wikibus.html5.git

--ap�s informar o comando de clonar ele solicitar� o usu�rio e senha do github, informe.
--O projeto foi clonado para o diret�rio "<diret�rio_do_xampp>/xampp/htdocs/wikibus".

6� Abra o brownser e na barra de endere�os digite:

localhost/phpmyadmin

--L� voc� vai importar o banco "wikibus.sql" que est� localizado na pasta "documentation" no diret�rio principal do projeto

---Agora voc� pode ver o app wikibus e os dados dele persistentes em seu browser, digitando na barra de endere�os:

localhost/wikibus

---e clicando em app.html

===Preparando a IDE
7� Abra a IDE e importe o projeto que est� no diret�rio "<diret�rio_do_xampp>/xampp/htdocs/wikibus".

-- A partir de agora voc� tem o projeto pronto para edi��o 

===Upando contribui��es do c�digo (branchs)
8� Atrav�s do GitBash ainda aberto crie um novo Branch para edi��o do c�digo com o(s) seguinte(s) comando(�s):

cd wikibus				
--para entrar na pasta do projeto.

git checkout -b "nome_do_branch"	
--cria um novo branch

---agora fa�a suas altera��es no c�digo atrav�s da sua IDE.

9� Para upar o seu branch abra o GitBash, v� at� o diret�rio do projeto, se j� n�o estiver nele (para conferir digite "ls" e d� enter para saber para qual pasta o GitBash est� apontando), e informe os seguintes comandos para dar commit e upar a colabora��o:

cd <diret�rio_do_xampp>/xampp/htdocs/wikibus
--apenas se voc� j� n�o estiver no diret�rio do projeto.

git checkout nome_do_branch
--vai para o branch que foram feitas as altera��es, n�o � necess�rio se voc� j� estiver nesse branch.

git add .
--adiciona as novas altera��es no branch.

git commit -m "nome_do_commit"
--cria um pacote das altera��es para que sejam enviadas ao reposit�rio do github.

git push -u origin nome_do_branch
--envia o c�digo ao github.

---ele vai solicitar o seu usu�rio e senha do github, informe.

---Com isso a sua contribui��o foi enviada ao servidor para an�lise e posterior inclus�o ao c�digo master.

10� Ap�s upar alguma coisa, � de extrema import�ncia se atualizar o c�digo local do projeto antes de iniciar com qualquer branch novo, para atualizar o c�digo deve-se fazer o seguinte:

git checkout master
--para mudar para o branch master, se quiser voltar ao outro branch s� � usar o mesmo c�digo modificando o nome do branch pelo de seu interesse.

git pull
--ele vai solicitar o seu usu�rio e senha do github, informe.

---Ap�s isso d� um F5 no seu projeto na IDE.

11� Para novas contribui��es repita sempre a partir do 8� passo, lembre-se: cada nova altera��o � um novo branch, n�o recicle branchs j� utilizados, eles n�o s�o atualizados junto com o resto do projeto ao dar o comando "git pull".

obs.: O sistema de login ainda n�o terminou de ser implementado, por�m o banco tem um usu�rio com nome, email e senha iguais a 'admin' para testes.



M�rio Augusto Mota Martins
h2mario@gmail.com