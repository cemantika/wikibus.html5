/*
 * File: app/view/Ocorrencia.js
 *
 * This file was generated by Sencha Architect version 2.1.0.
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

Ext.define('Ubibus.view.Ocorrencia', {
    extend: 'Ext.form.Panel',
    alias: 'widget.ocorrencia',

    config: {
        id: 'ocorrencia',
        items: [
            {
                xtype: 'toolbar',
                docked: 'top',
                hidden: true,
                id: 'toolbarOcorrencia',
                title: 'Ocorrência'
            },
            {
                xtype: 'label',
                hidden: true,
                html: 'Título: informação!',
                id: 'lblInformacaoOcorrencia',
                style: 'text-align:center;font-style:italic;'
            },
            {
                xtype: 'fieldset',
                id: 'ocorrenciaOrigem',
                style: 'margin-top:-20px;',
                title: 'Origem',
                items: [
                    {
                        xtype: 'selectfield',
                        id: 'selectOcorrenciaOrigem',
                        itemId: 'myselectfield',
                        value: 'Selecionadorrr',
                        options: [
                            {
                                text: 'Selecione',
                                value: -1
                            },
                            {
                                text: 'Linha',
                                value: 1
                            },
                            {
                                text: 'Ponto',
                                value: 2
                            },
                            {
                                text: 'Onibus',
                                value: 3
                            },
                            {
                                text: 'Empresa',
                                value: 4
                            },
                            {
                                text: 'Ubibus',
                                value: 5
                            }
                        ]
                    },
                    {
                        xtype: 'textfield',
                        hidden: true,
                        id: 'txtOcorrenciaIdentificador',
                        placeHolder: 'Identificador'
                    }
                ]
            },
            {
                xtype: 'fieldset',
                style: 'margin-top:-20px;',
                ui: '',
                title: 'Tipo Ocorrencia',
                items: [
                    {
                        xtype: 'radiofield',
                        label: 'Reclamação',
                        labelAlign: 'right',
                        labelWidth: '75%',
                        name: 'tipo_ocorrencia',
                        value: 'reclamacao'
                    },
                    {
                        xtype: 'radiofield',
                        label: 'Elogio',
                        labelAlign: 'right',
                        labelWidth: '75%',
                        name: 'tipo_ocorrencia',
                        value: 'elogio'
                    },
                    {
                        xtype: 'radiofield',
                        label: 'Sugestão',
                        labelAlign: 'right',
                        labelWidth: '75%',
                        name: 'tipo_ocorrencia',
                        value: 'sugestao'
                    },
                    {
                        xtype: 'textareafield',
                        id: 'txtDescricaoOcorrencia',
                        placeHolder: 'Descriçao da Ocorrência'
                    }
                ]
            },
            {
                xtype: 'button',
                id: 'btnOcorrenciaRegistrar',
                itemId: 'mybutton22',
                style: 'margin-top:-20px;',
                text: 'Registrar'
            }
        ],
        listeners: [
            {
                fn: 'onSelectOcorrenciaOrigemChange',
                event: 'change',
                delegate: '#selectOcorrenciaOrigem'
            },
            {
                fn: 'onBtnOcorrenciaRegistrarTap',
                event: 'tap',
                delegate: '#btnOcorrenciaRegistrar'
            },
            {
                fn: 'onFormpanelActivate',
                event: 'activate'
            }
        ]
    },

    onSelectOcorrenciaOrigemChange: function(selectfield, newValue, oldValue, options) {
        var txtIdentidicador = Ext.getCmp('txtOcorrenciaIdentificador');

        txtIdentidicador.setValue('');

        switch(newValue){
            case 1: //Linha
            txtIdentidicador.setHidden(false);
            txtIdentidicador.setPlaceHolder('nº da linha');
            break;

            case 2: //Ponto
            txtIdentidicador.setHidden(false);
            txtIdentidicador.setPlaceHolder('nº do ponto / referência');
            break;

            case 3: //Onibus
            txtIdentidicador.setHidden(false);
            txtIdentidicador.setPlaceHolder('nº do onibus');
            break;

            case 4: //Empresa
            txtIdentidicador.setHidden(false);
            txtIdentidicador.setPlaceHolder('nome da empresa');
            break;

            case 5: //Ubibus
            txtIdentidicador.setHidden(true);
            txtIdentidicador.setPlaceHolder('');
            txtIdentidicador.setValue('');
            break;

            default:
            txtIdentidicador.setHidden(true);

        }
    },

    onBtnOcorrenciaRegistrarTap: function(button, e, options) {
        Ext.Msg.confirm(
        "Confirmação",
        "Deseja registrar esta ocorrência?",
        function(buttonId) {
            if(buttonId === 'yes') {
                Ext.Msg.alert('Obrigado', 'Sua ocorrência foi registrada com sucesso!', Ext.emptyFn);

                Ext.getCmp('selectOcorrenciaOrigem').setValue(-1);

                Ext.getCmp('ocorrencia').reset();
            }
        }, 
        this // scope of the controller 
        );


    },

    onFormpanelActivate: function(container, newActiveItem, oldActiveItem, options) {
        Ext.getCmp('toolbarOcorrencia').setHidden(false);
        Ext.getCmp('lblInformacaoOcorrencia').setHidden(true);
        Ext.getCmp('ocorrenciaOrigem').setHidden(false);
    }

});