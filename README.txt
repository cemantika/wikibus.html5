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
4� Abra o GitBash e prossiga com o(s) seguinte(s) comando(s) para clonar o projeto:

git clone https://github.com/cemantika/wikibus.html5.git

--ap�s clonar talvez ele venha a solicitar o usu�rio e senha do github, informe.

5� Atrav�s do GitBash ainda aberto crie um novo Branch para edi��o do c�digo com o(s) seguinte(s) comando(�s):

cd wikibus
git checkout -b "nome_do_branch"

6� O projeto foi clonado para o diret�rio principal do usu�rio atual do SO (Sistema Operacional) (no caso do windows, C:/users/nome_do_usuario/), v� at� l�, copie a pasta do projeto e cole na pasta htdocs que est� localizada no diret�rio onde foi instalado o XAMPP.

7� Abra o brownser e na barra de endere�os digite:

localhost/phpmyadmin

--L� voc� vai importar o banco "wikibus.sql" que est� localizado na pasta "documentation" no diret�rio principal do projeto

---Agora voc� pode ver o app wikibus e os dados dele persistentes em seu browser, digitando na barra de endere�os:

localhost/wikibus

---e clicando em app.html

===Preparando a IDE
8� Abra a IDE e importe o projeto que est� no diret�rio "..xampp/htdocs"

-- A partir de agora voc� tem o projeto pronto para edi��o 

===Upando contribui��es do c�digo (branchs)
9� Para upar o seu branch copie o projeto que est� no "..xampp/htdocs" e cole em cima do projeto que est� no diret�rio principal do usu�rio atual do SO. Ap�s isso abra o GitBash e informe os seguintes comandos:

cd wikibus
git checkout nome_do_branch
git add .
git commit -m "nome_do_commit"
git push -u origin nome_do_branch

---ele vai solicitar o seu usu�rio e senha do github, informe.

---Com isso a sua contribui��o foi enviada ao servidor para an�lise e posterior inclus�o ao c�digo master.

10� Ap�s upar alguma coisa, � de extrema import�ncia se atualizar o c�digo local do projeto antes de iniciar com qualquer branch novo, para atualizar o c�digo deve-se fazer o seguinte:

git checkout master
git pull

---ele vai solicitar o seu usu�rio e senha do github, informe.
---Copie o projeto localizado no diret�rio do usu�rio atual do SO e cole na pasta "..xampp/htdocs/" novamente, para que possa sempre trabalhar com um c�digo atualizado.

11� Para novas contribui��es repita sempre a partir do 9� passo.

obs.: O sistema de login ainda n�o terminou de ser implementado, por�m o banco tem um usu�rio com nome, email e senha iguais a 'admin' para testes.



M�rio Augusto Mota Martins
h2mario@gmail.com