<template>

 <div class="row">
    <div v-if="formulario_Auditoria_SAM" class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Filtral datos de Auditoria</h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="consulta()" class="btn btn-primary">Buscar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="form-group col-md-12 col-sm-12" style="width:100%">
                            <label for="exampleInputEmail1"><b>Lista de Usuario</b></label>
                            <multiselect v-model="input_usuario_id" :options="data_foraneo_usuario_id" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true"  label="text" track-by="id" ></multiselect>
                            <b-alert show  v-if="validacion.usuario_id" variant="danger" >{{validacion.usuario_id[0]}}</b-alert>
                      </div>
                      <div class="form-group col-md-12 col-sm-12" style="width:100%">
                            <label for="exampleInputEmail1"><b>Lista de modelo</b></label>
                            <multiselect v-model="input_modelo_id" :options="data_foraneo_modelo_id" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true"  label="text" track-by="id" ></multiselect>
                            <b-alert show  v-if="validacion.modelo_id" variant="danger" >{{validacion.modelo_id[0]}}</b-alert>
                      </div>
                    </div>
            </div>
        </div>
    </div>
    <div v-else  class="col-lg-12" >
        <div class="main-card mb-3 card">
            <div class="card-body"><h1 class="">Auditoria</h1>
              <nav >
                <pagination :limit='20'  :data='consulta_datos' @pagination-change-page='consulta'></pagination>
              </nav>
              <div class='col-12'>
                <b-button v-b-modal.moda-registro @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Buscar registro
                </b-button>
                <div class='flexbox  float-right' >
                  <b-input-group size='sm' class='float-right  margin-bottom-0' prepend=''  style='margin-bottom: 0px;'>
                    <b-form-input type='text' v-model='input_consulta_data' ></b-form-input>
                    <b-input-group-append>
                      <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
                    </b-input-group-append>
                  </b-input-group>
                </div>
              </div>

              <b-table :items='items' :fields='fields' :sort-by.sync='item' striped small :sort-desc.sync='item' sort-icon-left
                        responsive='sm'  :no-border-collapse='noCollapse'>
                        <template v-slot:cell(Acciones)='data'>

                          <b-button-group>
                            <b-button v-if="$can('Auditoria_SAM Editar')"  v-b-modal.moda-registro size='sm' variant='warning' @click='editar_registro(data.item.id)' type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
                            </b-button>
                            <b-button v-if="$can('Auditoria_SAM Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
                            </b-button>

                          </b-button-group>
                          </template>
                          <template v-slot:cell(show_details)="row">
                            <b-button size="sm"  @click="row.toggleDetails" class="mr-2 btn-sm-mass">
                              {{ row.detailsShowing ? 'Menos' : 'Mas'}} Detalle
                            </b-button>
                          </template>
                          <template v-slot:row-details="row">
                            <b-card class="row">
                              <b-row class="mb-12">
                                <b-col sm="3" class="text-sm-left"><b>Nombre de usuario:</b></b-col>
                                <b-col sm="9" style="white-space: none">{{ row.item.user_id.primer_nombre }}</b-col>
                              </b-row>
                              <hr class="hr-2" />
                               <b-row class="mb-12">
                                <b-col sm="3" class="text-sm-left"><b>Correo de usuario:</b></b-col>
                                <b-col sm="9" style="white-space: none">{{ row.item.user_id.email }}</b-col>
                              </b-row>
                              <hr class="hr-2" />
                               <b-row class="mb-12">
                                <b-col sm="3" class="text-sm-left"><b>Tipo de evento:</b></b-col>
                                <b-col sm="9" style="white-space: none">{{ row.item.event }}</b-col>
                              </b-row>
                              <hr class="hr-2" />





                              <b-row class="mb-6">
                                <b-col sm="12" class="text-sm-left"><b>Datos viejos:</b></b-col>
                                <b-col sm="12" style="white-space: none">
                                  {{ row.item.old_values }}

                                </b-col>
                              </b-row>
                              <hr class="hr-2" />
                              <b-row class="mb-6 row">
                                <b-col sm="12" class="text-sm-left"><b>Datos Nuevos:</b></b-col>
                                <b-col sm="12">
                                {{ row.item.new_values }}
                                </b-col>
                                <!--
                                <b-col sm="6" class="text-sm-left"><b>Datos Nuevos:</b></b-col>
-->                             <hr class="hr-2" />

                                <b-col sm="6" class="bg-light"><b>Datos Nuevos:</b>
                                  <ul >
                                    <li v-for="(item, index) in verificar_direcencias(row.item.new_values)" :key="index" ><b>{{index}} :</b>  {{ item }}</li>
                                  </ul>
                                </b-col>
                                <!--
                                <b-col sm="6" class="text-sm-left"><b>Datos Viejos:</b></b-col>
                                -->
                                <b-col sm="6" class="bg-light"><b>Datos Viejos:</b>
                                  <ul>
                                    <li v-for="(item, index) in verificar_direcencias(row.item.old_values)" :key="index"><b>{{index}} :</b>  {{ item }}</li>
                                  </ul>
                                </b-col>
                              </b-row>
                              <hr class="hr-2" />
                              <b-row class="mb-6">
                                <b-col sm="2" class="text-sm-left"><b>Fecha:</b></b-col>
                                <b-col sm="10" style="white-space: none">{{ row.item.created_at }}</b-col>
                              </b-row>
                              <hr class="hr-2" />
                               <b-row class="mb-6">
                                <b-col sm="2" class="text-sm-left"><b>Modelo:</b></b-col>
                                <b-col sm="10" style="white-space: none">{{ row.item.auditable_type }}</b-col>
                              </b-row>
                              <hr class="hr-2" />



                              <b-button size="sm" @click="row.toggleDetails">Menos detalles</b-button>
                            </b-card>
                          </template>
                        <!--
                          <template v-slot:head(Acciones)='scope'>
                            <div class='text-nowrap'>Acciones</div>
                          </template>
                        -->
                </b-table>
            </div>
        </div>
    </div>


    <b-modal id="moda-eliminar"  size="xl" hide-footer >
      <template slot="modal-title">Eliminar un Registro </template>
      <div class="d-block text-center">
        <h3>¿Desea eliminar el registro permanente?</h3>
        <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
      </div>
    </b-modal>
  </div>

</template>




<script type="application/javascript">
import Vue from "vue";
import VueSingleSelect from "vue-single-select";

//import VueToast from "vue-toast-notification";
//import "vue-toast-notification/dist/index.css";
import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
//import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
import Multiselect from 'vue-multiselect';
Vue.component('multiselect', Multiselect)
Vue.use(VueToastr2);

export default {
  components: {
    VueSingleSelect,
    VueToastr2,
    Select2
  },
  data() {

    return {
      formulario_Auditoria_SAM:false,
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
      fields: [
     // { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
      //{ key: 'id', sortable:true},
      //{ key: 'user_type', sortable:true},
      { key:'show_details'},

      { key: 'user_id.primer_nombre',label:'Nombre Usuario', sortable:true},
      { key: 'user_id.email',label:'Correo Usuario', sortable:true},
      { key: 'event', sortable:true},
      { key: 'auditable_id', sortable:true},
      { key: 'auditable_type', sortable:true},
      //{ key: 'old_values', sortable:true},
      //{ key: 'new_values', sortable:true},
      //{ key: 'url', sortable:true},
      //{ key: 'ip_address', sortable:true},
      //{ key: 'user_agent', sortable:true},
      //{ key: 'tags', sortable:true},
      { key: 'created_at', sortable:true},
      //{ key: 'updated_at', sortable:true},

      ],


      input_Auditoria_SAM_id:[],
      data_foraneo_user_id:[],
      data_foraneo_auditable_id:[],
      consulta_datos: {},
      errors: {},
      data_foraneo_usuario_id: {},
      data_foraneo_modelo_id: {},
      mensaje_formulario: "",
      input_usuario_id:[],
      input_modelo_id:[],

    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
  },
  methods: {


    consulta(page = 1){

    const data = {
        usuario_id: this.input_usuario_id,
        modelo_id :this.input_modelo_id,
        consulta_data :this.input_consulta_data

      }

      axios.post(`${this.$url}/Api/Auditoria_SAM/consulta?page=${page}&consulta_data=${this.input_consulta_data}`, data).then(response => {
              const datos = response.data;
                this.consulta_datos = response.data;
                this.datas=response.data.data;
                this.items=response.data.data;
                this.formulario_Auditoria_SAM=false;
      })

    },
    data_foraneo(){
      axios.get(`${this.$url}/Api/Auditoria_SAM/create`).then(response => {
        this.productos_all = response.data;
        this.data_foraneo_user_id= response.data.user_id
        this.data_foraneo_auditable_id= response.data.auditable_id
        this.data_foraneo_us= response.data.auditable_id
        this.data_foraneo_auditable_id= response.data.auditable_id
        this.data_foraneo_usuario_id = response.data.usuario_id
        this.data_foraneo_modelo_id = response.data.modelo_id


      });
    },



    cancelar_registro(){
      this.formulario_Auditoria_SAM=false;
    },
    $can(permissionName) {
      return Permissions.indexOf(permissionName) !== -1;
    },

    verificar_direcencias(data){
     return  JSON.parse(data);

    },


  }
};


</script>



