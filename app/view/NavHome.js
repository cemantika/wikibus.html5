/*
 * File: app/view/NavHome.js
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

Ext.define('Ubibus.view.NavHome', {
    extend: 'Ext.navigation.View',
    alias: 'widget.navhome',

    requires: [
        'Ubibus.view.Menu'
    ],

    config: {
        title: 'Ubibus',
        id: 'home-view',
        ui: '',
        defaultBackButtonText: 'Voltar',
        useTitleForBackButtonText: true,
        items: [
            {
                xtype: 'menu',
                title: 'Ubibus'
            }
        ],
        navigationBar: {
            id: 'navHomeBar',
            items: [
				{
				    xtype: 'button',
				    align: 'right',
				    id: 'btnLogout',
				    itemId: 'mybutton34',
				    iconCls: 'arrow_left',
				    iconMask: true,
				    text: 'Logout'
				},
                {
                    xtype: 'button',
                    align: 'right',
                    hidden: true,
                    id: 'btnNavConfig',
                    itemId: 'mybutton35',
                    iconCls: 'settings',
                    iconMask: true,
                    text: ''
                },
                {
                    xtype: 'button',
                    align: 'right',
                    hidden: true,
                    id: 'btnNavAdicionarEmpresa',
                    itemId: 'mybutton36',
                    iconCls: 'add',
                    iconMask: true,
                    text: ''
                },
                {
                    xtype: 'button',
                    align: 'right',
                    hidden: true,
                    id: 'btnRefreshFeed',
                    itemId: 'refreshFeed',
                    iconCls: 'refresh',
                    iconMask: true,
                    text: ''
                }
            ]
        },
        listeners: [
            {
                fn: 'onBtnNavConfigTap',
                event: 'tap',
                delegate: '#btnNavConfig'
            }
        ]
    },

    onBtnNavConfigTap: function(button, e, options) {
        var tela = Ext.getCmp('homePort').getActiveItem().id;

        switch(tela){
            case 'ponto':
            Ext.getCmp('toolbarPonto').setHidden(!Ext.getCmp('toolbarPonto').getHidden());
            break;
            case 'painelLinha':
            Ext.getCmp('toolbarPonto').setHidden(!Ext.getCmp('toolbarPonto').getHidden());

            break;
        }
    }

});