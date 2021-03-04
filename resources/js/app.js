/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');


window.Vue = require('vue');
import Vue from 'vue'

import VueRouter from 'vue-router'
Vue.use(VueRouter)

import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

// Make BootstrapVue available throughout your project
Vue.use(BootstrapVue)
// Optionally install the BootstrapVue icon components plugin
Vue.use(IconsPlugin)

import Select2 from 'v-select2-component';
Vue.component('Select2', Select2);

import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);


import Multiselect from 'vue-multiselect' //https://vue-multiselect.js.org/
Vue.component('multiselect', Multiselect)

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))
/*
Vue.component('passport-clients',require('./components/passport/Clients.vue').default);
Vue.component('passport-authorized-clients',require('./components/passport/AuthorizedClients.vue').default);
Vue.component('passport-personal-access-tokens',require('./components/passport/PersonalAccessTokens.vue').default);
*/

Vue.component('encuesta_salud-vue', require('./components/Encuesta_Salud-vue.vue').default);

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('unidadfuncional-vue', require('./components/UnidadFuncional-vue.vue'));
Vue.component('pagination', require('laravel-vue-pagination')); //https://www.npmjs.com/package/laravel-vue-pagination
Vue.component('concretodetalles-vue', require('./components/ConcretoDetalles-vue.vue').default);
Vue.component('acerodetalle-vue', require('./components/acerodetalle-vue.vue').default);
Vue.component('fresadodetalle-vue', require('./components/FresadoDetalle-vue.vue').default);
Vue.component('mezclasdetalle-vue', require('./components/MezclasDetalle-vue.vue').default);
Vue.component('granularesdetalle-vue', require('./components/GranularesDetalle-vue.vue').default);
import home from './components/ExampleComponent.vue';

import UnidadFuncional from './components/UnidadFuncional-vue.vue';
import UnidadFuncionalForm from './components/UnidadFuncionalForm-vue.vue';
import EstadoTramite from './components/EstadoTramite-vue.vue';
import EstadoTramiteForm from './components/EstadoTramiteForm-vue.vue';
import Concreto from './components/Concreto-vue.vue';
import ConcretoForm from './components/ConcretoForm-vue.vue';

import ConcretoDetalles from './components/ConcretoDetalles-vue.vue';
import ConcretoDetallesForm from './components/ConcretoDetallesForm-vue.vue';

import Acero from './components/Acero-vue.vue';
import AceroForm from './components/AceroForm-vue.vue';

import Fresado from './components/Fresado-vue.vue';
import FresadoForm from './components/FresadoForm-vue.vue';

import Auditoria from './components/vue-Auditoria_SAM.vue';

import Mezclas from './components/Mezclas-vue.vue';
import MezclasForm from './components/MezclasForm-vue.vue';

//import MezclasDetalle from './components/MezclasDetalle-vue.vue';
import MezclasDetalleForm from './components/MezclasDetalleForm-vue.vue';

import PerfilSalud from './components/PerfilSalud-vue.vue';
import PerfilSaludForm from './components/PerfilSaludForm-vue.vue';

import Granulares from './components/Granulares-vue.vue';
import GranularesForm from './components/GranularesForm-vue.vue';


import GranularesDetalle from './components/GranularesDetalle-vue.vue';
import GranularesDetalleForm from './components/GranularesDetalleForm-vue.vue';

//import FresadoDetalle from './components/FresadoDetalle-vue.vue';
//import FresadoDetalleForm from './components/FresadoDetalleForm-vue.vue';

//
//      PRODUCCCIÓN
//
//Vue.prototype.$url = '/via40online'
//var url='/via40online';

//
//      TEST
//
Vue.prototype.$url = ''
var url='';

const router = new VueRouter({
    mode:'history',
    routes:[


        {path:'home',component:home,name:'home' },
        //Unidad funcional
        { path: url+'/Auditoria', component: Auditoria, name: 'Auditoria' },
        { path: url+'/UnidadFuncional', component: UnidadFuncional, name: 'unidadfuncional' },
        { path: url+'/UnidadFuncional/:id/edit', component: UnidadFuncionalForm, name: 'unidadfuncionalform' },
        { path: url+'/UnidadFuncional/create', component: UnidadFuncionalForm, name: 'unidadfuncionalformadd' },
        //EstadoTramite
        { path: url+'/EstadoTramite', component: EstadoTramite, name: 'estadotramite' },
        { path: url+'/EstadoTramite/:id/edit', component: EstadoTramiteForm, name: 'estadotramiteform' },
        { path: url+'/EstadoTramite/create', component: EstadoTramiteForm, name: 'estadotramiteformadd' },
        //concreto
        { path: url+'/Concreto', component: Concreto, name: 'concreto' },
        { path: url+'/Concreto/:id/edit', component: ConcretoForm, name: 'concretoform' },
        { path: url+'/Concreto/create', component: ConcretoForm, name: 'concretoformadd'},

        //ConcretoDetalles
        { path: url+'/ConcretoDetalles', component: ConcretoDetalles, name: 'concretodetalles' },
        { path: url+'/ConcretoDetalles/:id/edit', component: ConcretoDetallesForm, name: 'concretodetallesform' },
        { path: url+'/ConcretoDetalles/create', component: ConcretoDetallesForm, name: 'concretodetallesformadd' },
        //acero
        { path: url+'/Acero', component: Acero, name: 'acero' },
        { path: url+'/Acero/:id/edit', component: AceroForm, name: 'aceroform' },
        { path: url+'/Acero/create', component: AceroForm, name: 'aceroformadd' },
        //fresado
        { path: url+'/Fresado', component: Fresado, name: 'fresado' },
        { path: url+'/Fresado/:id/edit', component: FresadoForm, name: 'fresadoform' },
        { path: url+'/Fresado/create', component: FresadoForm, name: 'fresadoformadd' },
        //mezclas
        { path: url+'/Mezclas', component: Mezclas, name: 'mezclas' },
        { path: url+'/Mezclas/:id/edit', component: MezclasForm, name: 'mezclasform' },
        { path: url+'/Mezclas/create', component: MezclasForm, name: 'mezclasformadd' },






        //{ path: '/MezclasDetalle', component: MezclasDetalle, name: 'mezclasdetalle' },
        { path: url+'/MezclasDetalle/:id/edit', component: MezclasDetalleForm, name: 'mezclasdetalleform' },
        { path: url+'/MezclasDetalle/create', component: MezclasDetalleForm, name: 'mezclasdetalleformadd' },
        //granulares
        { path: url+'/Granulares', component: Granulares, name: 'granulares' },
        { path: url+'/Granulares/:id/edit', component: GranularesForm, name: 'granularesform' },
        { path: url+'/Granulares/create', component: GranularesForm, name: 'granularesformadd' },
        //
        { path: '/GranularesDetalle', component: GranularesDetalle, name: 'granularesdetalle' },
        { path: '/GranularesDetalle/:id/edit', component: GranularesDetalleForm, name: 'granularesdetalleform' },
        { path: '/GranularesDetalle/create', component: GranularesDetalleForm, name: 'granularesdetalleformadd' },

        //perfil salud
        { path: url+'/PerfilSalud', component: PerfilSalud, name: 'perfilsalud' },
        { path: url+'/PerfilSalud/:id/edit', component: PerfilSaludForm, name: 'perfilsaludform' },
        { path: url+'/PerfilSalud/create', component: PerfilSaludForm, name: 'perfilsaludformadd' },

    ] // short for `routes: routes`
  })

const app = new Vue({
    router,
    url,
    //el: '#app',
}).$mount('#app');

