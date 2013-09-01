/*
 * File: app/controller/Main.js
 *
 * This file was generated by Sencha Architect version 2.2.2.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Sencha Touch 2.0.x library, under independent license.
 * License of Sencha Architect does not include license for Sencha Touch 2.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('Ubibus.controller.Main', {
    extend: 'Ext.app.Controller',
    alias: 'controller.main',

    config: {
        stores: [
            'Onibus',
            'Pontos',
            'Linha',
            'Usuarios'
        ],

        refs: {
            empresa: 'empresa',
            onibusView: '#onibusView',
            onibusForm: '#onibusForm',
            navegador: 'navegadoronibus',
            navegadorLinha: 'navegadorlinha',
            linhaView: '#linhaView',
            linhaForm: '#linhaForm',
            navHome: 'navhome',
            pontodetalhe: 'pontodetalhe',
            listalinhas: 'listalinhas',
            mapa: 'mapa',
            usuario: '#usuario'
        },

        control: {
            "navhome #btnNavAdicionarEmpresa": {
                tap: 'salvarEmpresa'
            },
            "onibusform #btnSalvarOnibus": {
                tap: 'salvarOnibus'
            },
            "linhaform #btnSalvarLinha": {
                tap: 'salvarLinha'
            },
            "onibus #btnOnibusPesquisar": {
                tap: 'pesquisarOnibus'
            },
            "linha #btnLinhaPesquisar": {
                tap: 'pesquisarLinha'
            },
            "onibusform #btnOnibusOcorrencia": {
                tap: 'exibeOcorrencia'
            },
            "linhaform #btnLinhaOcorrencia": {
                tap: 'exibeOcorrenciaLinha'
            },
            "empresa": {
                disclose: 'selecionaEmpresa'
            },
            "menu": {
                itemtap: 'onListItemTap'
            },
            "linhaform #btnLinhaDetalhe": {
                tap: 'exibeMapaLinha'
            },
            "pontodetalhe #btnItinerarioSugerir": {
                tap: 'sugereItinerario'
            },
            "pontodetalhe #btnPontoOcorrencia": {
                tap: 'exibeOcorrenciaPonto'
            },
            "usuario #btnUsuarioConfirmar": {
                tap: 'confirmarUsuario'
            }
        }
    },

    salvarEmpresa: function(button, e, eOpts) {
        Ext.Msg.prompt(null, 
        'Cadastre uma empresa:',
        function(btn, text){
            if(btn == 'ok'){

                //Cria o model com os dados da empresa a ser cadastrada
                var dados = Ext.create('model.empresa', {            
                    nome: text
                });

                //Cria uma instancia da store
                //var store = Ext.create('store.empresas');

                //Adiciona o model a store e envia pro servidor
                //store.add(dados);        
                //store.sync();

                //Adicionao o model a lista que é exibida na tela
                //this.getEmpresa().getStore().add(dados);
                //this.getEmpresa().getStore().load();

                var storeEmpresas = Ext.getStore('empresa');
                storeEmpresas.removeAll();
                storeEmpresas.add(dados);
                storeEmpresas.sync();
                storeEmpresas.load();

            }
        },
        this, false, '', {placeHolder: 'Nome da empresa'});
    },

    salvarOnibus: function(button, e, eOpts) {
        var dadosOnibus = this.getOnibusForm().getValues();
        var storeOnibus = Ext.getStore('onibus');

        var editar = Ext.getCmp('opcoesOnibus').isPressed(Ext.getCmp('btnOnibusEditar'));

        //O framework passa 'null' ao inves de 'false' caso o checkbox não seja selecionado
        //Este valor é corrijido antes de ser enviado para o servidor
        dadosOnibus.adaptado = ((dadosOnibus.adaptado) ? true : false);

        //limpa o store antes de enviar os dados
        storeOnibus.removeAll();


        if(editar){
            //storeOnibus.set(dadosOnibus);?? //TODO:update

            //Altera o campo instructions do fieldset
            //Ext.getCmp('fieldPesquisaOnibus').setInstructions('Atualizado com sucesso!   \\o/');
            Ext.getCmp('lblOnibusStatusPesquisa').setHtml('Atualizado com sucesso!   \\o/');

            //Exibe os botões de 'opções'
            Ext.getCmp('opcoesOnibus').setHidden(false);

            //Habilita os botões de 'opções'
            Ext.getCmp('btnOnibusLocalizacao').setDisabled(false);
            Ext.getCmp('btnOnibusOcorrencia').setDisabled(false);
            Ext.getCmp('btnOnibusEditar').setDisabled(false);
            Ext.getCmp('btnOnibusDetalhe').setDisabled(false);

            //Exibe o botão de 'Salvar'
            Ext.getCmp('btnSalvarOnibus').setHidden(true);

            //Desmarca o botão de 'editar'
            Ext.getCmp('opcoesOnibus').setPressedButtons(Ext.getCmp('btnOnibusHidden'));
        }else{
            //adiciona dados e envia pro servidor
            storeOnibus.add(dadosOnibus);

            //Altera o campo instructions do fieldset
            //Ext.getCmp('fieldPesquisaOnibus').setInstructions('Cadastrado com sucesso!   \\o/');
            Ext.getCmp('lblOnibusStatusPesquisa').setHtml('Cadastrado com sucesso!   \\o/');

            //Exibe os botões de 'opções'
            Ext.getCmp('opcoesOnibus').setHidden(false);

            //Habilita os botões de 'opções'
            Ext.getCmp('btnOnibusLocalizacao').setDisabled(false);
            Ext.getCmp('btnOnibusOcorrencia').setDisabled(false);
            Ext.getCmp('btnOnibusEditar').setDisabled(false);
            Ext.getCmp('btnOnibusDetalhe').setDisabled(false);

            //Oculta o botão de 'Salvar'
            Ext.getCmp('btnSalvarOnibus').setHidden(true);

        }
        storeOnibus.sync();
    },

    salvarLinha: function(button, e, eOpts) {
        var dadosLinha = this.getLinhaForm().getValues();

        var storeLinha = Ext.getStore('linha');

        var editar = Ext.getCmp('opcoesLinha').isPressed(Ext.getCmp('btnLinhaEditar'));

        //limpa o store antes de enviar os dados
        storeLinha.removeAll();


        if(editar){
            //storeLinha.set(dadosLinha);?? //TODO:update

            //Altera o campo instructions do fieldset
            //Ext.getCmp('fieldPesquisaLinha').setInstructions('Atualizado com sucesso!   \\o/');
            Ext.getCmp('lblLinhaStatusPesquisa').setHtml('Atualizado com sucesso!   \\o/');

            //Exibe os botões de 'opções'
            Ext.getCmp('opcoesLinha').setHidden(false);

            //Habilita os botões de 'opções'
            Ext.getCmp('btnLinhaLocalizacao').setDisabled(false);
            Ext.getCmp('btnLinhaOcorrencia').setDisabled(false);
            Ext.getCmp('btnLinhaEditar').setDisabled(false);
            Ext.getCmp('btnLinhaDetalhe').setDisabled(false);

            //Exibe o botão de 'Salvar'
            Ext.getCmp('btnSalvarLinha').setHidden(true);

            //Desmarca o botão de 'editar'
            Ext.getCmp('opcoesLinha').setPressedButtons(Ext.getCmp('btnLinhaHidden'));
        }else{
            //adiciona dados e envia pro servidor
            storeLinha.add(dadosLinha);

            //Altera o campo instructions do fieldset
            //Ext.getCmp('fieldPesquisaLinha').setInstructions('Cadastrado com sucesso!   \\o/');
            Ext.getCmp('lblLinhaStatusPesquisa').setHtml('Cadastrado com sucesso!   \\o/');

            //Exibe os botões de 'opções'
            Ext.getCmp('opcoesLinha').setHidden(false);

            //Habilita os botões de 'opções'
            Ext.getCmp('btnLinhaLocalizacao').setDisabled(false);
            Ext.getCmp('btnLinhaOcorrencia').setDisabled(false);
            Ext.getCmp('btnLinhaEditar').setDisabled(false);
            Ext.getCmp('btnLinhaDetalhe').setDisabled(false);

            //Oculta o botão de 'Salvar'
            Ext.getCmp('btnSalvarLinha').setHidden(true);

        }
        storeLinha.sync();
    },

    pesquisarOnibus: function(button, e, eOpts) {

        var dadosOnibus = this.getOnibusView().getValues();
        var storeOnibus = Ext.getStore('onibus');

        storeOnibus.removeAll();
        storeOnibus.getProxy().setExtraParam('numero', dadosOnibus.numeroOnibus);


        storeOnibus.load({
            scope: this,
            callback: function(registro) {

                //Guarda o numero pesquisado
                numeroPesquisado = this.getOnibusView().getValues().numeroOnibus;

                //Exibe a tela de formulário do onibus
                this.getNavHome().push({
                    xtype: 'onibusform',
                    title: 'Onibus: ' + numeroPesquisado
                });

                //Verifica se a consulta retornou algum onibus
                if(registro[0]){//Onibus encontrado

                    //Altera o campo instructions do fieldset
                    //Ext.getCmp('fieldPesquisaOnibus').setInstructions('Onibus cadastrado!   ;)');
                    Ext.getCmp('lblOnibusStatusPesquisa').setHtml('Onibus já cadastrado!   ;)');

                    //Preenche os campos com o resultado da pesquisa
                    this.getOnibusForm().setValues(registro[0].data);

                    //Exibe os botões de 'opções'
                    Ext.getCmp('opcoesOnibus').setHidden(false);

                    //Habilita os botões de 'opções'
                    Ext.getCmp('btnOnibusLocalizacao').setDisabled(false);
                    Ext.getCmp('btnOnibusOcorrencia').setDisabled(false);
                    Ext.getCmp('btnOnibusEditar').setDisabled(false);
                    Ext.getCmp('btnOnibusDetalhe').setDisabled(false);

                    //Desabilita os campos para edição
                    Ext.getCmp('selectEmpresa').setDisabled(true);
                    Ext.getCmp('checkAdaptado').setDisabled(true);

                    //Oculta o botão de 'Salvar'
                    Ext.getCmp('btnSalvarOnibus').setHidden(true);

                    Ext.getCmp('formOnibus').setHidden(false);

                    //Exibe ou não o botão de remover.
                    var sessionObject = localStorage.getItem('sessionObject');            
                    var perfilModerador = JSON.parse(sessionObject).perfilModerador;
                    var esconder = !perfilModerador;

                    Ext.getCmp('btnOnibusExcluir').setHidden(esconder);



                }else{//Onibus não encontrado

                    //Guarda o numero pesquisado
                    numeroPesquisado = this.getOnibusView().getValues().numeroOnibus;

                    //Limpa os campos do formulário
                    Ext.getCmp('onibusView').reset();

                    //Preenche os campo 'Numero do onibus' com o numero pesquisado
                    Ext.getCmp('numeroOnibus').setValue(numeroPesquisado);
                    Ext.getCmp('txtNumeroOnibus').setValue(numeroPesquisado);

                    //Altera o campo instructions do fieldset
                    //Ext.getCmp('fieldPesquisaOnibus').setInstructions('Onibus não cadastrado!   :(');
                    Ext.getCmp('lblOnibusStatusPesquisa').setHtml('Onibus não cadastrado!   :(');

                    //Exibe os botões de 'opções'
                    Ext.getCmp('opcoesOnibus').setHidden(true);

                    //Disabilita os botões de 'opções'
                    Ext.getCmp('btnOnibusLocalizacao').setDisabled(true);
                    Ext.getCmp('btnOnibusOcorrencia').setDisabled(true);
                    Ext.getCmp('btnOnibusEditar').setDisabled(true);
                    Ext.getCmp('btnOnibusDetalhe').setDisabled(true);

                    //Habilita os campos para edição
                    Ext.getCmp('selectEmpresa').setDisabled(false);
                    Ext.getCmp('checkAdaptado').setDisabled(false);

                    //Exibe o botão de 'Salvar'
                    Ext.getCmp('btnSalvarOnibus').setHidden(false);

                    //Exibe o formulário
                    Ext.getCmp('formOnibus').setHidden(false);
                }

            }
        });
    },

    pesquisarLinha: function(button, e, eOpts) {
        var dadosLinha = this.getLinhaView().getValues();
        var storeLinha = Ext.getStore('linha');

        storeLinha.removeAll();
        storeLinha.getProxy().setExtraParam('numero', dadosLinha.numeroLinha);


        storeLinha.load({
            scope: this,
            callback: function(registro) {

                //Guarda o numero pesquisado
                numeroPesquisado = this.getLinhaView().getValues().numeroLinha;

                //Exibe a tela de formulário do linha
                this.getNavHome().push({
                    xtype: 'linhaform',
                    title: 'Linha: ' + numeroPesquisado
                });

                //Verifica se a consulta retornou alguma linha
                if(registro[0]){//Linha encontrada

                    //Altera o campo instructions do fieldset
                    //Ext.getCmp('fieldPesquisaLinha').setInstructions('Linha cadastrada!   ;)');
                    Ext.getCmp('lblLinhaStatusPesquisa').setHtml('Linha já cadastrada!   ;)');

                    //Preenche os campos com o resultado da pesquisa
                    this.getLinhaForm().setValues(registro[0].data);

                    //Exibe os botões de 'opções'
                    Ext.getCmp('opcoesLinha').setHidden(false);

                    //Habilita os botões de 'opções'
                    Ext.getCmp('btnLinhaLocalizacao').setDisabled(false);
                    Ext.getCmp('btnLinhaOcorrencia').setDisabled(false);
                    Ext.getCmp('btnLinhaEditar').setDisabled(false);
                    Ext.getCmp('btnLinhaDetalhe').setDisabled(false);

                    //Desabilita os campos para edição
                    Ext.getCmp('txtLinhaOrigem').setDisabled(true);
                    Ext.getCmp('txtLinhaDestino').setDisabled(true);
                    Ext.getCmp('txtLinhaVia').setDisabled(true);

                    //Oculta o botão de 'Salvar'
                    Ext.getCmp('btnSalvarLinha').setHidden(true);

                    Ext.getCmp('formLinha').setHidden(false);


                    //Exibe ou não o botão de remover.
                    var sessionObject = localStorage.getItem('sessionObject');            
                    var perfilModerador = JSON.parse(sessionObject).perfilModerador;
                    var esconder = !perfilModerador;

                    Ext.getCmp('btnLinhaExcluir').setHidden(esconder);


                }else{//Linha não encontrado

                    //Guarda o numero pesquisado
                    numeroPesquisado = this.getLinhaView().getValues().numeroLinha;

                    //Limpa os campos do formulário
                    Ext.getCmp('linhaView').reset();

                    //Preenche os campo 'Numero do linha' com o numero pesquisado
                    Ext.getCmp('numeroLinha').setValue(numeroPesquisado);
                    Ext.getCmp('txtNumeroLinha').setValue(numeroPesquisado);

                    //Altera o campo instructions do fieldset
                    //Ext.getCmp('fieldPesquisaLinha').setInstructions('Linha não cadastrada!   :(');
                    Ext.getCmp('lblLinhaStatusPesquisa').setHtml('Linha não cadastrada!   :(');

                    //Exibe os botões de 'opções'
                    Ext.getCmp('opcoesLinha').setHidden(true);

                    //Disabilita os botões de 'opções'
                    Ext.getCmp('btnLinhaLocalizacao').setDisabled(true);
                    Ext.getCmp('btnLinhaOcorrencia').setDisabled(true);
                    Ext.getCmp('btnLinhaEditar').setDisabled(true);
                    Ext.getCmp('btnLinhaDetalhe').setDisabled(true);

                    //Habilita os campos para edição            
                    Ext.getCmp('txtLinhaOrigem').setDisabled(false);
                    Ext.getCmp('txtLinhaDestino').setDisabled(false);
                    Ext.getCmp('txtLinhaVia').setDisabled(false);

                    //Exibe o botão de 'Salvar'
                    Ext.getCmp('btnSalvarLinha').setHidden(false);

                    //Exibe o formulário
                    Ext.getCmp('formLinha').setHidden(false);
                }

            }
        });
    },

    exibeOcorrencia: function(button, e, eOpts) {
        //console.log(Ext.Viewport.getActiveItem());

        this.getNavHome().push({
            xtype: 'ocorrencia',
            title: 'Ocorrencia'
        });
        numeroOnibus = this.getOnibusView().getValues().numeroOnibus;
        Ext.getCmp('lblInformacaoOcorrencia').setHtml('Onibus: ' + numeroOnibus);
        Ext.getCmp('opcoesOnibus').setPressedButtons(Ext.getCmp('btnOnibusHidden'));

        //Controla a exibição dos componentes da tela
        Ext.getCmp('toolbarOcorrencia').setHidden(true);
        Ext.getCmp('lblInformacaoOcorrencia').setHidden(false);
        Ext.getCmp('ocorrenciaOrigem').setHidden(true);

        //Seta o valor do select field (oculto na tela) com o codigo para onibus
        Ext.getCmp('selectOcorrenciaOrigem').setValue(3);
    },

    exibeOcorrenciaLinha: function(button, e, eOpts) {
        //console.log(Ext.Viewport.getActiveItem());

        this.getNavHome().push({
            xtype: 'ocorrencia',
            title: 'Ocorrencia'
        });

        numeroLinha = this.getLinhaView().getValues().numeroLinha;
        Ext.getCmp('lblInformacaoOcorrencia').setHtml('Linha: ' + numeroLinha);
        Ext.getCmp('opcoesLinha').setPressedButtons(Ext.getCmp('btnLinhaHidden'));

        //Controla a exibição dos componentes da tela
        Ext.getCmp('toolbarOcorrencia').setHidden(true);
        Ext.getCmp('lblInformacaoOcorrencia').setHidden(false);
        Ext.getCmp('ocorrenciaOrigem').setHidden(true);

        //Seta o valor do select field (oculto na tela) com o codigo para onibus
        Ext.getCmp('selectOcorrenciaOrigem').setValue(1);
    },

    selecionaEmpresa: function(list, record, target, index, e, eOpts) {
        this.getNavegador().push({
            xtype: 'mapa',
            title: 'Mapae'
        });
    },

    onListItemTap: function(dataview, index, target, record, e, eOpts) {
        this.getNavHome().push({
            xtype: record.data.view,
            title: record.data.item
        });
    },

    exibeMapaLinha: function(button, e, eOpts) {
        numeroLinha = this.getLinhaView().getValues().numeroLinha;
        this.getNavHome().push({
            xtype: 'linhamapa',
            title: 'Mapeamento'
        });

        //Desmarca o botão de detalhes
        Ext.getCmp('opcoesLinha').setPressedButtons(Ext.getCmp('btnLinhaHidden'));
        Ext.getCmp('opcoesAdicionarPontos').setPressedButtons(Ext.getCmp('btnExibePontosHidden'));

        mapaLinha = this.getMapa()._map;

        mapaLinha.setZoom(13);

        var storePontosPorLinha = Ext.create('Ubibus.store.Itinerarios');

        storePontosPorLinha.getProxy().setExtraParam('numero', numeroLinha);
        //console.log('Linha numero: ' + numeroLinha);

        idsLinhas = [];

        var iconeIda = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|00E64D|12|_|';
        var iconeVolta = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|FD7567|12|_|';
        //var iconeIdaVolta = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|FF9900|12|_|';
        var iconeIdaVolta = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|6991FD|12|_|';
        var iconeOrigem = 'http://maps.google.com/mapfiles/dd-start.png';
        var iconeDestino = 'http://maps.google.com/mapfiles/dd-end.png';

        storePontosPorLinha.load({
            scope: this,
            callback: function(records) {      

                if(ids){
                    for (var i = 0; i < ids.length; i++) {
                        markers[ids[i]].setMap(null);            
                    }
                }


                if(records.length > 0){          
                    //var aux = 0;

                    for (var i = 0; i <  records.length; i++) {                

                        var ponto = records[i].data;
                        var m = markers[ponto.id_ponto];
                        m.setMap(mapaLinha);

                        if(ponto.sequencia){                    

                            m.setIcon(iconeIda + ponto.sequencia);
                            m.sequencia = ponto.sequencia;

                        }else{
                            m.setIcon('http://maps.google.com/mapfiles/marker_orange.png');
                        }
                        if(ponto.id_ponto_anterior){
                            m.posicao = ponto.id_ponto_anterior;
                        }else{
                            m.posicao = 'x';                    
                        }

                        idsLinhas.push(ponto.id_ponto);                
                    }

                    idLinha = records[0].data.id_linha;
                    idPontoAnterior = 0;

                }else{
                    Ext.Msg.alert('Ajude-nos', 'Ainda não há pontos informados para esta linha', Ext.emptyFn);

                }

            }
        });
    },

    sugereItinerario: function(button, e, eOpts) {
        //Cria o model com os dados da linha sugerida
        var dados = Ext.create('model.itinerario', {
            numero: Ext.getCmp('txtItinerarioNumeroLinha').getValue(),
            id_ponto: pontoAtual
        });

        //Cria uma instancia da store
        var store = Ext.create('store.itinerarios');

        //Adiciona o model a store e envia pro servidor
        store.add(dados);        
        store.sync();

        Ext.getCmp('txtItinerarioNumeroLinha').setValue('');
        Ext.getCmp('btnItinerarioSugerir').setHidden(true);

        //Atualizando a store da exibida na tela
        //this.getListalinhas().getStore().add(dados);
        var store = this.getListalinhas().getStore();

        store.getProxy().setExtraParam('id_ponto', pontoAtual);

        store.load();
        store.clearFilter();
        //console.log(this.getListalinhas().getStore());
    },

    exibeOcorrenciaPonto: function(button, e, eOpts) {
        this.getNavHome().push({
            xtype: 'ocorrencia',
            title: 'Ocorrencia'
        });

        Ext.getCmp('lblInformacaoOcorrencia').setHtml('Ponto: ' + pontoAtual);
        Ext.getCmp('opcoesPontoLinha').setPressedButtons(Ext.getCmp('btnPontoHidden'));

        //Controla a exibição dos componentes da tela
        Ext.getCmp('toolbarOcorrencia').setHidden(true);
        Ext.getCmp('lblInformacaoOcorrencia').setHidden(false);
        Ext.getCmp('ocorrenciaOrigem').setHidden(true);

        //Seta o valor do select field (oculto na tela) com o codigo para onibus
        Ext.getCmp('selectOcorrenciaOrigem').setValue(2);
    },

    confirmarUsuario: function(button, e, eOpts) {
        //Cria o model com os dados do usuario a ser cadastrado
        var dados = Ext.create('model.usuario', {            
            nome: Ext.getCmp('txtUsuarioNome').getValue(),
            email: Ext.getCmp('txtUsuarioEmail').getValue(),
            senha: Ext.getCmp('txtUsuarioSenha').getValue()
        });

        var nome_botao = button.getText();

        var sessionObject = { 'perfilModerador': true };

        if(nome_botao == 'Logar'){

            //Fix-me!! O perfil de moderador deve ser obtido via consulta à base, através de script php!
            //var usuarioLogado = usuario retornado do login
            //if (usuarioLogado.idPerfil == 1){
            //sessionObject = { 'perfilModerador': true };
            //}else{
            sessionObject = { 'perfilModerador': false };
            //}


            //log the session object
            localStorage.setItem('sessionObject', JSON.stringify(sessionObject ));



        }else{

            var storeUsuario = Ext.getStore('usuarios');

            storeUsuario.removeAll();

            storeUsuario.add(dados);

            storeUsuario.sync();
        }
    }

});