/*
 * File: app/view/Feed.js
 */

Ext.define('Ubibus.view.Feed', {
    extend: 'Ext.dataview.List',
    alias: 'widget.feed',

    config: {
        id: 'feed',
        ui: 'round',
        emptyText: '<div>Não há novidades!</div>',
        store: 'ocorrencia',
        striped: true,
        itemTpl: new Ext.XTemplate(
	        '<tpl if="this.isPonto(tipo_entidade)">' +
	          '<p style="font-size:15px">{[ this.nomeOcorrencia(values.tipo) ]} no ponto {id_entidade} <div style="font-size:12px;font-color:#cccccc">{[ this.since(values.data) ]}</div></p>' +
	          '<p>"{descricao}"</p>' +
	          '<p style="font-size:14px">-- Por {nome}</p>' +
        	'</tpl>' +
	        '<tpl if="this.isLinha(tipo_entidade)">' + 
	          '<p style="font-size:15px">{[ this.nomeOcorrencia(values.tipo) ]} na linha {id_entidade} <div style="font-size:12px;font-color:#cccccc"">{[ this.since(values.data) ]}</div></p>' +
	          '<p>"{descricao}"</p>' +
	          '<p style="font-size:14px">-- Por {nome}</p>' +
	        '</tpl>',
	        {
	            compiled: true,
	            isPonto: function(tipo) {
	        		return tipo == 'P';
	        	},
	        	isLinha: function(tipo) {
	        		return tipo == 'L';
	        	},
	        	nomeOcorrencia: function(tipo){
	        		switch(tipo) {
	        		case 'R':
	        			return "Reclamação";
	        		case 'S':
	        			return "Sugestão";
	        		case 'E':
	        			return "Elogio";
	        		}
	        	},
	        	since: function(time){

	        		switch (typeof time) {
	        		    case 'number': break;
	        		    case 'string': time = +new Date(time); break;
	        		    case 'object': if (time.constructor === Date) time = time.getTime(); break;
	        		    default: time = +new Date();
	        		}
	        		var time_formats = [
	        		    [60, 'segundos', 1], // 60
	        		    [120, '1 minuto atrás', '1 minuto a partir de agora'], // 60*2
	        		    [3600, 'minutos', 60], // 60*60, 60
	        		    [7200, '1 hora atrás', 'daqui a 1 hora'], // 60*60*2
	        		    [86400, 'horas', 3600], // 60*60*24, 60*60
	        		    [172800, 'Ontem', 'Amanhã'], // 60*60*24*2
	        		    [604800, 'dias', 86400], // 60*60*24*7, 60*60*24
	        		    [1209600, 'Última semana', 'Próxima semana'], // 60*60*24*7*4*2
	        		    [2419200, 'semanas', 604800], // 60*60*24*7*4, 60*60*24*7
	        		    [4838400, 'Último mês', 'Próximo mês'], // 60*60*24*7*4*2
	        		    [29030400, 'meses', 2419200], // 60*60*24*7*4*12, 60*60*24*7*4
	        		    [58060800, 'Último ano', 'Proximo ano'], // 60*60*24*7*4*12*2
	        		    [2903040000, 'anos atrás', 29030400], // 60*60*24*7*4*12*100, 60*60*24*7*4*12
	        		    [5806080000, 'século atrás', 'próximo século'], // 60*60*24*7*4*12*100*2
	        		    [58060800000, 'séculos atrás', 2903040000] // 60*60*24*7*4*12*100*20, 60*60*24*7*4*12*100
	        		];
	        		var seconds = (+new Date() - time) / 1000,
	        		    token = 'ago', list_choice = 1;

	        		if (seconds == 0) {
	        		    return 'Just now'
	        		}
	        		if (seconds < 0) {
	        		    seconds = Math.abs(seconds);
	        		    token = 'from now';
	        		    list_choice = 2;
	        		}
	        		var i = 0, format;
	        		while (format = time_formats[i++])
	        		    if (seconds < format[0]) {
	        		        if (typeof format[2] == 'string')
	        		            return format[list_choice];
	        		        else
	        		            return Math.floor(seconds / format[2]) + ' ' + format[1] + ' ' + token;
	        		    }
	        		return time;
	        		}
	        }
	    ),
        listeners: [
            {
                fn: 'onFeedActivate',
                event: 'activate'
            },
            {
                fn: 'onFeedDeactivate',
                event: 'deactivate'
            }
        ]
    },

    onFeedActivate: function(container, newActiveItem, oldActiveItem, options) {
        Ext.getCmp('btnRefreshFeed').setHidden(false);
    },

    onFeedDeactivate: function(container, newActiveItem, oldActiveItem, options) {
        Ext.getCmp('btnRefreshFeed').setHidden(true);
    }

});