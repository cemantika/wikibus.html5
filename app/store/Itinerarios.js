/*
 * File: app/store/Itinerarios.js
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

Ext.define('Ubibus.store.Itinerarios', {
    extend: 'Ext.data.Store',
    alias: 'store.itinerarios',

    requires: [
        'Ubibus.model.Itinerario'
    ],

    config: {
        autoLoad: false,
        autoSync: false,
        model: 'Ubibus.model.Itinerario',
        storeId: 'itinerarios',
        proxy: {
            type: 'ajax',
            api: {
                create: 'php/itinerario/criaItinerario.php',
                read: 'php/itinerario/listaItinerario.php',
                //update: 'php/itinerario/atualizaItinerario.php',
                //destroy: 'php/itinerario/deletaItinerario.php'
            },
            reader: {
                type: 'json',
                rootProperty: 'itinerarios'
            },
            writer: {
                type: 'json',
                encode: true,
                rootProperty: 'itinerarios'
            }
        }
    }
});