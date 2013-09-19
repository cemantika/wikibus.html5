/*
 * File: app/view/mapa.js
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

Ext.define('Ubibus.view.mapa', {
    extend: 'Ext.Map',
    alias: 'widget.mapa',

    config: {
        autoUpdate: true,
        geo: {
            autoLoad: false
        },
        mapOptions: {
            zoom: 17,
            mapTypeId: 'satellite'//,
            //draggableCursor: 'url(http://localhost/ubibus/app/images/posicaoAtual.png), move'
        },
        listeners: [
            {
                fn: 'onMapMaprender',
                event: 'maprender'
            },
            {
                fn: 'onMapInitialize',
                event: 'initialize'
            }
        ]
    },

    onMapMaprender: function(map, gmap, options) {
        var image = 'app/images/posicaoAtual.png';
        that = this;

        contadorLinha = 0;

        var latLng;
        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = new google.maps.LatLng(position.coords.latitude,
                position.coords.longitude);
                latLng = pos;
                
                alert(pos);
                //that.placeMarker(pos, gmap);

                var marker = new google.maps.Marker({
                    position: pos,
                    map: gmap,
                    draggable: false,
                    icon: image
                });

                //Centraliza mapa
                gmap.setCenter(pos);

            }, function() {
                that.handleNoGeolocation(true);
            });
        } else {
            // Browser doesn't support Geolocation
            that.handleNoGeolocation(false);
        }

        var endereco;
        myListener = google.maps.event.addListener(gmap, 'click', function(event) {

            podeAdicionar = Ext.getCmp('opcoesMapaPonto').isPressed(Ext.getCmp('btnAtivaAdicao'));

            if(podeAdicionar){        

                //Exibe promp de confirmaÃ§Ã£o
                Ext.Msg.prompt(null, 
                'Informe uma referencia:',
                function(btn, text){
                    if(btn == 'ok'){

                        var lat = event.latLng.lat();
                        var lng = event.latLng.lng();
                        latLng = new google.maps.LatLng(lat, lng);

                        var marcador = that.placeMarker(latLng, gmap, '');

                        that.geoCodePosition(latLng, text);

                        markers.push(marcador);

                    }
                },
                this, false, '', {placeHolder: 'Ex: Ponto do Shopping...'});


            }else{
                //alert('NO');
            }
        });

        google.maps.event.addListener(gmap, 'idle', function(event) {
            //bounds = gmap.getBounds();
            //console.log(bounds);
            //console.log(bounds.getNorthEast());
            //console.log(bounds.getSouthWest());
        });

        var storePontos = Ext.create('Ubibus.store.Pontos');

        storePontos.load({
            scope: this,
            callback: function(records) {
                //debugger;
                that.processaPontos(records, gmap);  
            }
        });

    },

    onMapInitialize: function(component, options) {

    },

    handleNoGeolocation: function(browserSupportFlag) {
        if (errorFlag) {
            var content = 'Erro: O serviÃ§o de geolocalizaÃ§Ã£o falhou.';
        }else{
            var content = 'Error: Seu navegador nÃ£o suporta geolocalizaÃ§Ã£o';
        }
    },

    placeMarker: function(location, map, numero) {
        //Ã�cone padrao para pontos de onibus
        var image = 'app/images/parada.png';
        //image = 'http://localhost/ubibus/testes/ubibus/app/images/10.jpg';

        //Tres digitos
        //var image = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.65|0|FF8844|10|_|';

        //Dois digitos
        //var image = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|FF8844|12|_|';

        //Cria marcador
        var marker = new google.maps.Marker({
            position: location,
            map: map,
            draggable: false,
            icon: image,// + numero,
            animation: google.maps.Animation.DROP,
            id: numero
        });


        //Clique duplo no marcador
        google.maps.event.addListener(marker, 'dblclick', function() {

            Ext.Msg.prompt(null, 
            'Informe uma referencia:',
            function(btn, text){
                if(btn == 'ok'){

                    var lat = event.latLng.lat();
                    var lng = event.latLng.lng();
                    latLng = new google.maps.LatLng(lat, lng);

                }
            },
            this, false, '', {placeHolder: 'Ponto: ' + marker.get('id')});
        });

        //ICONE_STATUS = 'origem';
        //ICONE_STATUS = 'ida';
        //ICONE_STATUS = 'volta';
        //ICONE_STATUS = 'fim';

        //Clique simples no marcador
        google.maps.event.addListener(marker, 'click', function() {

            pontoAtual = numero;

            switch(telaAtual){
                case 'ponto':

                var navHome = Ext.getCmp('home-view');
                navHome.push({
                    xtype: 'pontodetalhe',
                    title: 'Ponto nÂº ' + numero
                });

                var storeItinerarios = Ext.getStore('itinerarios');

                storeItinerarios.removeAll();
                storeItinerarios.getProxy().setExtraParam('id_ponto', numero);

                storeItinerarios.load();

                break;            
                case 'linha':


                iconeIda = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|00E64D|12|_|';
                iconeVolta = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|FD7567|12|_|';
                //var iconeIdaVolta = 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=0.6|0|FF9900|12|_|';
                iconeIdaVolta = 'http://maps.google.com/mapfiles/marker_orange.png';
                iconeOrigem = 'http://maps.google.com/mapfiles/dd-start.png';
                iconeDestino = 'http://maps.google.com/mapfiles/dd-end.png';

                criandoRota = Ext.getCmp('opcoesMapaLinha').isPressed(Ext.getCmp('btnRota'));

                if(criandoRota){     

                    contadorLinha++;

                    if(marker.posicao){

                        //console.log('m: ' + marker.posicao);
                        //console.log('c: ' + contadorLinha);
                        //console.log('a: ' + idPontoAnterior);
                        //console.log('s: ' + marker.sequencia);

                        if(marker.posicao=='x'){
                            marker.posicao = idPontoAnterior;

                            marker.sequencia = contadorLinha;

                            var storeItinerarios = Ext.getStore('itinerarios');

                            storeItinerarios.removeAll();
                            storeItinerarios.getProxy().setExtraParam('id_ponto', numero);
                            storeItinerarios.getProxy().setExtraParam('id_ponto_anterior', idPontoAnterior);
                            storeItinerarios.getProxy().setExtraParam('id_linha', idLinha);
                            storeItinerarios.getProxy().setExtraParam('numero', numeroLinha);
                            storeItinerarios.getProxy().setExtraParam('sequencia', contadorLinha);
                            storeItinerarios.getProxy().setExtraParam('atualiza', 1);

                            storeItinerarios.load();

                            idPontoAnterior = numero;

                        }else{
                            //Ext.Viewport.add(Ext.widget('menupontos'));
                            //console.log('P: ' + marker.posicao);
                            //contadorLinha--;    

                            //marker.posicao = idPontoAnterior;
                            idPontoAnterior = marker.posicao;

                            if(contadorLinha == 1){
                                contadorLinha = marker.sequencia;
                            }

                            var storeItinerarios = Ext.getStore('itinerarios');

                            storeItinerarios.removeAll();
                            storeItinerarios.getProxy().setExtraParam('id_ponto', numero);
                            storeItinerarios.getProxy().setExtraParam('id_ponto_anterior', marker.posicao);
                            storeItinerarios.getProxy().setExtraParam('id_linha', idLinha);
                            storeItinerarios.getProxy().setExtraParam('numero', numeroLinha);
                            storeItinerarios.getProxy().setExtraParam('sequencia', contadorLinha);
                            storeItinerarios.getProxy().setExtraParam('atualiza', 1);

                            storeItinerarios.load();

                            idPontoAnterior = numero;

                        }

                    }else{
                        marker.posicao = contadorLinha;

                        var dados = Ext.create('model.itinerario', {
                            numero: numeroLinha,
                            id_ponto: numero,
                            id_ponto_anterior: idPontoAnterior,
                            sequencia: contadorLinha
                        });

                        //console.log('D: ' + idPontoAnterior);

                        //Cria uma instancia da store
                        var store = Ext.create('store.itinerarios');

                        //Adiciona o model a store e envia pro servidor
                        store.add(dados);        
                        store.sync();

                        idPontoAnterior = numero;
                    }    

                    switch(ICONE_STATUS){
                        case 'origem':
                        //alert('1');
                        icone = iconeOrigem;
                        ICONE_STATUS = 'ida';
                        break;
                        case 'ida':
                        //alert('2');
                        icone = iconeIda + contadorLinha;
                        break;        
                        case 'volta':
                        //alert('3');
                        icone = iconeVolta + marker.posicao;
                        break;
                        case 'fim':
                        //alert('4');
                        icone = iconeDestino;
                        break;        

                    }

                    if(marker.posicao){
                        //icone = iconeIdaVolta;
                    }

                    marker.setIcon(icone);
                }else{
                    if(marker.posicao){
                        Ext.Viewport.add(Ext.widget('menupontos'));
                        //console.log(menuPontos);
                        //menuPontos.show();
                    }else{               

                        marker.posicao = 'x';
                        var dados = Ext.create('model.itinerario', {
                            numero: numeroLinha,
                            id_ponto: numero
                        });

                        //Cria uma instancia da store
                        var store = Ext.create('store.itinerarios');

                        //Adiciona o model a store e envia pro servidor
                        store.add(dados);        
                        store.sync();

                        marker.setIcon(iconeIdaVolta);
                    } 
                }

                break;
            }




        });

        return marker;
    },

    geoCodePosition: function(pos, referencia) {
        var geocoder = new google.maps.Geocoder();
        endereco = Ext.create('Ubibus.model.Ponto');

        geocoder.geocode({
            latLng: pos
        }, function(responses) {
            if (responses && responses.length > 0) {

                endereco.set('latitude', pos.lat());
                endereco.set('longitude', pos.lng());

                var component = responses[0]['address_components'];

                for (i=0; i<component.length;i++) {	
                    switch (component[i]['types'][0]) {
                        case "street_number":
                        endereco.set('numero', component[i].long_name);
                        break;
                        case "route":
                        endereco.set('logradouro', component[i].long_name);
                        break;
                        case "sublocality":
                        endereco.set('bairro', component[i].long_name);
                        break;
                        case "locality":
                        endereco.set('cidade', component[i].long_name);
                        break;
                        case "administrative_area_level_1":
                        endereco.set('estado', component[i].long_name);
                        break;
                        case "country":
                        endereco.set('pais', component[i].short_name);
                        break;
                        case "postal_code":
                        endereco.set('cep', component[i].long_name);
                        break;
                        default:
                        // se nÃ£o for nenhum dos cases acima, entÃ£o:				
                    }			
                }

            } else {
                //updateMsg('Cannot determine address at this location.');
            }

            endereco.set('referencia', referencia);


            var storeEndereco = Ext.create('Ubibus.store.Pontos');

            storeEndereco.add(endereco);
            storeEndereco.sync();


            return endereco;
        });
    },

    processaPontos: function(listaPontos, map) {
        //console.log(listaPontos);
        markers = [];
        ids = [];
        MAPA = map;
        for (var i = 0, ln = listaPontos.length; i < ln; i++) {
            var ponto = listaPontos[i].data;
            if (ponto.latitude && ponto.longitude) {
                latLng = new google.maps.LatLng(ponto.latitude, ponto.longitude);
                var marcador = this.placeMarker(latLng, map, i+1);

                markers[ponto.id_ponto] = marcador;    
                ids.push(ponto.id_ponto);
            }
        }

        ICONE_STATUS = 'origem';
    }

});