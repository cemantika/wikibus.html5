/*
 * File: app/view/Viewport.js
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

Ext.define('Ubibus.view.Viewport', {
    extend: 'Ext.tab.Panel',
    alias: 'widget.viewport',

    requires: [
        'Ubibus.view.NavHome',
        'Ubibus.view.Ocorrencia',
        'Ubibus.view.Usuario',
        'Ubibus.view.Indicadores'
    ],

    config: {
    	id: 'viewPort',
        tabBar: {
            docked: 'bottom'
        },
        items: [
			{
			    id: 'usuarioPort',
				xtype: 'usuario',
			    title: 'Usuário',
			    iconCls: 'user'
			},
            {
				id: 'homePort',
                xtype: 'navhome',
                //disabled: true,
                iconCls: 'home'
            },
            {
            	id: 'ocorrenciaPort',
                xtype: 'ocorrencia',
                hidden: true,
                title: 'Ocorrência',
                iconCls: 'info'
            },
            {
            	id: 'indicadoresPort',
                xtype: 'indicadores',
                hidden: true,
                title: 'Indicadores',
                iconCls: 'more'
            }
        ],
        listeners: [
            {
                fn: 'onTabpanelInitialize',
                event: 'initialize'
            }
        ]
    },
    onTabpanelInitialize: function(component, options) {
        telaAtual = 'usuario';
        ids = [];
    }

});


    Ext.Viewport.element.on({
        tap: function(e, node, options, eOpts) {

            Ext.Ajax.request({
                url: '/log',
                method: 'GET',
                params: {
                    description: node.outerHTML
                }
            });


        }
    })