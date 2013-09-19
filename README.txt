Tutorial para desenvolvedor do Wikibus (19/09/2013)

->Descrição do Projeto: O Projeto atual do Wikibus está escrito em Sencha (sistema que fornece ferramentas de desenvolvimento de aplicativos baseados em HTML5 e serviços para a construção de aplicativos universais que funcionam em qualquer dispositivo) que se fundamenta em Javascript com todas as suas requisições feitas por ajax.

->Ambientes de Desenvolvimento: O projeto está preparado para duas IDE's, o "Arquitect" (que é o ambiente padrão Sencha) e o Eclipse.

->Suporte do Banco: Em "conectar.php" na pasta "php", pode-se ver a conexão com um banco POSTGRES, sendo o banco do Simtur o utilizado nesse aplicativo. Pode-se encontrar um dump do banco para trabalhar localmente na pasta "documentation" no diretório do projeto.

->Github: O projeto está no github, no repositório de Jailson Brito, para clone e contribuição é necessário que se faça uma conta e se solicite permissão para sua conta.

->Passos para preparar o ambiente:

===Ambiente
1º Baixe e instale uma das duas IDE's descritas acima (Arquitect ou Eclipse);
 
--Se optar pelo Eclipse, após baixar você deve instalar os plugins para trabalhar com JavaScript e PHP seguindo os passos:

- HELP - Install New Software - Work With (selecione a versão do seu eclipse) - (Encontre e selecione os plugins que deseja para instalação) - Prossiga com os next's

--Já o Arquitect já vem pronto para trabalhar com JavaScript, mas não dá suporte ao PHP, que deverá então ser trabalhado com algum outro software.

2º Baixe e instale o Git;
3º Baixe e instale o pgAdmin;

--No seguinte link existe um tutorial de passo a passo para instalar o postgres local e importar o banco do Simtur:

https://github.com/cemantika/ubibuscars.android/blob/master/PGINSTALL.MD

4º Baixe e instale o XAMPP;

--Para ativar o PostgreSQL no XAMPP basta alterar o arquivo <diretório_do_xampp>\xampp\php\php.ini, habilitando as seguintes linhas:

extension=php_pdo_pgsql.dll
extension=php_pgsql.dll

--Para habilitar as extensões basta retirar o “;” da linha.

--Após isso deve-se copiar o arquivo libpq.dll da pasta <diretório_do_xampp>\xampp\php para a pasta <diretório_do_xampp>\xampp\apache\bin e reiniciar o Apache.

5º Faça uma conta no github;

===Clonando o Projeto
6º Abra o GitBash e vá até a pasta htdocs no xampp:
obs.: Onde está esse "<diretório_do_xampp>" sempre informe o diretório onde você instalou o seu xampp.

cd <diretório_do_xampp>/xampp/htdocs/

7º Prossiga com o(s) seguinte(s) comando(s) para clonar o projeto:

git clone https://github.com/cemantika/wikibus.html5.git

--após informar o comando de clonar ele solicitará o usuário e senha do github, informe.
--O projeto foi clonado para o diretório "<diretório_do_xampp>/xampp/htdocs/wikibus".

---Agora você pode ver o app wikibus e os dados dele persistentes em seu browser, digitando na barra de endereços:

localhost/wikibus

---e clicando em app.html

===Preparando a IDE
8º Abra a IDE e importe o projeto que está no diretório "<diretório_do_xampp>/xampp/htdocs/wikibus".

-- A partir de agora você tem o projeto pronto para edição 

===Upando contribuições do código (branchs)
9º Através do GitBash ainda aberto crie um novo Branch para edição do código com o(s) seguinte(s) comando(ºs):

cd wikibus				
--para entrar na pasta do projeto.

git checkout -b "nome_do_branch"	
--cria um novo branch

---agora faça suas alterações no código através da sua IDE.

10º Para upar o seu branch abra o GitBash, vá até o diretório do projeto, se já não estiver nele (para conferir digite "ls" e dê enter para saber para qual pasta o GitBash está apontando), e informe os seguintes comandos para dar commit e upar a colaboração:

cd <diretório_do_xampp>/xampp/htdocs/wikibus
--apenas se você já não estiver no diretório do projeto.

git checkout nome_do_branch
--vai para o branch que foram feitas as alterações, não é necessário se você já estiver nesse branch.

git add -A
--adiciona as novas alterações no branch.

git commit -m "nome_do_commit"
--cria um pacote das alterações para que sejam enviadas ao repositório do github.

git push -u origin nome_do_branch
--envia o código ao github.

---ele vai solicitar o seu usuário e senha do github, informe.

---Com isso a sua contribuição foi enviada ao servidor para análise e posterior inclusão ao código master.

11º Após upar alguma coisa, é de extrema importância se atualizar o código local do projeto antes de iniciar com qualquer branch novo, para atualizar o código deve-se fazer o seguinte:

git checkout master
--para mudar para o branch master, se quiser voltar ao outro branch só é usar o mesmo código modificando o nome do branch pelo de seu interesse.

git pull
--ele vai solicitar o seu usuário e senha do github, informe.

---Após isso dê um F5 no seu projeto na IDE.

12º Para novas contribuições repita sempre a partir do 8º passo, lembre-se: cada nova alteração é um novo branch, não recicle branchs já utilizados, eles não são atualizados junto com o resto do projeto ao dar o comando "git pull".





Mário Augusto Mota Martins
h2mario@gmail.com