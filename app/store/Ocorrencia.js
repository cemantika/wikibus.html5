/*
 * File: app/store/Ocorrencia.js
 */

Ext.define('Ubibus.store.Ocorrencia', {
    extend: 'Ext.data.Store',
    alias: 'store.ocorrencia',

    requires: [
        'Ubibus.model.Ocorrencia'
    ],

    config: {
        autoLoad: true,
        autoSync: false,
        model: 'Ubibus.model.Ocorrencia',
        storeId: 'ocorrencia',
        proxy: {
            type: 'ajax',
            api: {
                read: 'php/ocorrencia/get.php',
            },
            reader: {
                type: 'json',
                rootProperty: 'ocorrencias'
            }
        }
    }
});
