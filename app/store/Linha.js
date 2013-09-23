/*
 * File: app/store/Linha.js
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

Ext.define('Ubibus.store.Linha', {
    extend: 'Ext.data.Store',
    alias: 'store.linha',

    requires: [
        'Ubibus.model.Linha'
    ],

    config: {
        autoSync: false,
        model: 'Ubibus.model.Linha',
        storeId: 'linha',
        proxy: {
            type: 'ajax',
            api: {
                create: 'php/linha/criaLinha.php',
                read: 'php/linha/listaLinha.php'
                //update: 'php/linha/atualizaLinha.php',
                //destroy: 'php/linha/deletaLinha.php'
            },
            reader: {
                type: 'json',
                rootProperty: 'linhas'
            },
            writer: {
                type: 'json',
                writeAllFields: false,
                encode: true,
                rootProperty: 'linhas'
            }
        }
    }
});