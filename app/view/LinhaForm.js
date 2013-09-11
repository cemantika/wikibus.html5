/*
 * File: app/view/LinhaForm.js
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

Ext.define('Ubibus.view.LinhaForm', {
    extend: 'Ext.form.Panel',
    alias: 'widget.linhaform',

    config: {
        id: 'linhaForm',
        items: [
            {
                xtype: 'label',
                html: 'status da pesquisa',
                id: 'lblLinhaStatusPesquisa',
                style: 'text-align:center;margin-top:-10px;font-style: italic;'
            },
            {
                xtype: 'spacer',
                height: 5
            },
            {
                xtype: 'container',
                id: 'formLinha',
                itemId: 'mycontainer',
                items: [
                    {
                        xtype: 'segmentedbutton',
                        hidden: true,
                        id: 'opcoesLinha',
                        itemId: 'mysegmentedbutton1',
                        defaults: {
                            disabled: false
                        },
                        allowDepress: true,
                        layout: {
                            align: 'center',
                            pack: 'center',
                            type: 'hbox'
                        },
                        items: [
                            {
                                xtype: 'button',
                                id: 'btnLinhaOcorrencia',
                                badgeText: '',
                                iconCls: 'info',
                                iconMask: true,
                                text: ''
                            },
                            {
                                xtype: 'button',
                                hidden: true,
                                id: 'btnLinhaLocalizacao',
                                iconCls: 'locate',
                                iconMask: true,
                                text: ''
                            },
                            {
                                xtype: 'button',
                                hidden: true,
                                id: 'btnLinhaHidden'
                            },
                            {
                                xtype: 'button',
                                id: 'btnLinhaFavorito',
                                iconCls: 'star',
                                iconMask: true,
                                text: ''
                            },
                            {
                                xtype: 'button',
                                id: 'btnLinhaEditar',
                                itemId: 'mybutton10',
                                iconCls: 'compose',
                                iconMask: true,
                                text: ''
                            },
                            {
                                xtype: 'button',
                                id: 'btnLinhaExcluir',
                                itemId: 'mybutton11',
                                iconCls: 'delete',
                                iconMask: true,
                                text: ''
                            },
                            {
                                xtype: 'button',
                                id: 'btnLinhaDetalhe',
                                iconCls: 'maps',
                                iconMask: true,
                                text: ''
                            }
                        ]
                    },
                    {
                        xtype: 'fieldset',
                        id: 'infoLinha',
                        defaults: {
                            disabled: false
                        },
                        instructions: 'Dados da linha',
                        title: 'Informações',
                        items: [
                            {
                                xtype: 'textfield',
                                disabled: true,
                                id: 'txtNumeroLinha',
                                labelWidth: '45%',
                                name: 'numero',
                                placeHolder: 'Número da linha'
                            },
                            {
                                xtype: 'textfield',
                                disabled: true,
                                id: 'txtLinhaOrigem',
                                labelWidth: '45%',
                                name: 'origem',
                                placeHolder: 'Origem'
                            },
                            {
                                xtype: 'textfield',
                                disabled: true,
                                id: 'txtLinhaDestino',
                                labelWidth: '45%',
                                name: 'destino',
                                placeHolder: 'Destino'
                            },
                            {
                                xtype: 'textfield',
                                disabled: true,
                                id: 'txtLinhaVia',
                                labelWidth: '45%',
                                name: 'via',
                                placeHolder: 'Via'
                            },
                            {
                                xtype: 'textfield',
                                disabled: true,
                                hidden: false,
                                id: 'txtLinhaId',
                                labelWidth: '45%',
                                name: 'id_linha',
                                placeHolder: 'Id'
                            }
                        ]
                    },
                    {
                        xtype: 'button',
                        id: 'btnSalvarLinha',
                        style: 'margin-top:-20px;',
                        ui: 'confirm',
                        iconMask: true,
                        text: 'Salvar'
                    }
                ]
            }
        ],
        listeners: [
            {
                fn: 'onOpcoesLinhaToggle',
                event: 'toggle',
                delegate: '#opcoesLinha'
            }
        ]
    },

    onOpcoesLinhaToggle: function(segmentedbutton, button, isPressed, eOpts) {
        //Variavel que habilita os campos do formulario apenas quando 'btnLinhaEditar' estiver ativo
        var habilitaCamposForm = true;

        switch(button.id)
        {
            case 'btnLinhaLocalizacao':
            alert('de boa');
            //TODO
            break;
            case 'btnLinhaOcorrencia':
            //TODO
            break;
            case 'btnLinhaEditar':
            habilitaCamposForm = !isPressed;
            break;
            case 'btnLinhaDetalhe':
            //TODO
            break;
            default:         
        }

        //Habilita os campos para edição
        Ext.getCmp('txtLinhaOrigem').setDisabled(habilitaCamposForm);
        Ext.getCmp('txtLinhaDestino').setDisabled(habilitaCamposForm);
        Ext.getCmp('txtLinhaVia').setDisabled(habilitaCamposForm);


        //Exibe o botão de 'Salvar'
        Ext.getCmp('btnSalvarLinha').setHidden(habilitaCamposForm);
    }

});