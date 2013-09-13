/*
 * File: app/store/Favoritos.js
 */

Ext.define('Ubibus.store.Favoritos', {
    extend: 'Ext.data.Store',
    alias: 'store.favoritos',

    requires: [
        'Ubibus.model.Favorito'
    ],

    config: {
        autoLoad: true,
        autoSync: false,
        model: 'Ubibus.model.Favorito',
        storeId: 'favorito',
        proxy: {
            type: 'ajax',
            api: {
                create: 'php/favorito/post.php',
                read: 'php/favorito/get.php',
                update: 'php/favorito/post.php',
                destroy: 'php/favorito/delete.php'
            },
            writer: {
                type: 'json',
                encode: true,
                rootProperty: 'favorito'
            },
            reader: {
                type: 'json',
                rootProperty: 'favorito'
            }
        }
    }
});