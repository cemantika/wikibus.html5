/*
 * File: app/model/Favorito.js
 */

Ext.define('Ubibus.model.Favorito', {
    extend: 'Ext.data.Model',
    alias: 'model.favorito',

    config: {
        fields: [
            {
                name: 'id_usuario',
                type: 'int'
            },
            {
                name: 'tipo',
                type: 'char'
            },
            {
                name: 'id_entidade',
                type: 'int'
            }
        ],
        proxy: {
            type: 'rest',
            url : 'php/favorito/post.php',
            reader: {
                type: 'json',
                rootProperty: 'favorito'
            },
            writer: {
            	type: 'json',
            	rootProperty: 'favorito',
                encode: true
            }
        }
    }
});