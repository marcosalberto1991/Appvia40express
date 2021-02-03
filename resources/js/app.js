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



/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('unidadfuncional-vue', require('./components/UnidadFuncional-vue.vue'));
Vue.component('pagination', require('laravel-vue-pagination')); //https://www.npmjs.com/package/laravel-vue-pagination
Vue.component('concretodetalles-vue', require('./components/ConcretoDetalles-vue.vue').default);


import home from './components/ExampleComponent.vue';

import UnidadFuncional from './components/UnidadFuncional-vue.vue';
import UnidadFuncionalForm from './components/UnidadFuncionalForm-vue.vue';
import EstadoTramite from './components/EstadoTramite-vue.vue';
import EstadoTramiteForm from './components/EstadoTramiteForm-vue.vue';
import Concreto from './components/Concreto-vue.vue';
import ConcretoForm from './components/ConcretoForm-vue.vue';

import ConcretoDetalles from './components/ConcretoDetalles-vue.vue';
import ConcretoDetallesForm from './components/ConcretoDetallesForm-vue.vue';


const router = new VueRouter({
    mode:'history',
    routes:[


        {path:'home',component:home,name:'home' },
        //Unidad funcional
        { path: '/UnidadFuncional', component: UnidadFuncional, name: 'unidadfuncional' },
        { path: '/UnidadFuncional/:id/edit', component: UnidadFuncionalForm, name: 'unidadfuncionalform' },
        { path: '/UnidadFuncional/create', component: UnidadFuncionalForm, name: 'unidadfuncionalformadd' },
        //EstadoTramite
        { path: '/EstadoTramite', component: EstadoTramite, name: 'estadotramite' },
        { path: '/EstadoTramite/:id/edit', component: EstadoTramiteForm, name: 'estadotramiteform' },
        { path: '/EstadoTramite/create', component: EstadoTramiteForm, name: 'estadotramiteformadd' },
        //concreto
        { path: '/Concreto', component: Concreto, name: 'concreto' },
        { path: '/Concreto/:id/edit', component: ConcretoForm, name: 'concretoform' },
        { path: '/Concreto/create', component: ConcretoForm, name: 'concretoformadd'},

        //ConcretoDetalles
        { path: '/ConcretoDetalles', component: ConcretoDetalles, name: 'concretodetalles' },
        { path: '/ConcretoDetalles/:id/edit', component: ConcretoDetallesForm, name: 'concretodetallesform' },
        { path: '/ConcretoDetalles/create', component: ConcretoDetallesForm, name: 'concretodetallesformadd' },

    ] // short for `routes: routes`
  })

const app = new Vue({
    router,
    //el: '#app',
}).$mount('#app');

