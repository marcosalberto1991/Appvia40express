<template>
<div>

<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario de Concreto </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario(0)" class="btn btn-primary">Guardar </button>
                        <button type="submit"  @click="formulario(1)" class="btn btn-primary">Guardar y volve  </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_Concreto_id">




            <div class="form-group col-md-2 col-sm-12">
              <label for="exampleInputEmail1">Unidad Funcional<span class="tx-danger">*</span></label>
              <Select2 v-model="input_unidad_funcional_id" :options="data_foraneo_unidad_funcional_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.unidad_funcional_id" v-bind:key="data.unidad_funcional_id" >
                                            <b>{{data}}</b>
                </div>
                </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">calzada<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_calzada" placeholder="calzada" class="form-control" :class="{ 'is-invalid':this.validacion.calzada, 'is-valid':!this.validacion.calzada && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.calzada" v-bind:key="data.calzada" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">estrutura<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_estrutura" placeholder="estrutura" class="form-control"  :class="{ 'is-invalid':this.validacion.estrutura, 'is-valid':!this.validacion.estrutura && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estrutura" v-bind:key="data.estrutura" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">elemento<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_elemento" placeholder="elemento" class="form-control" :class="{ 'is-invalid':this.validacion.elemento, 'is-valid':!this.validacion.elemento && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.elemento" v-bind:key="data.elemento" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">plano_codigo<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_plano_codigo" placeholder="plano_codigo" class="form-control"  :class="{ 'is-invalid':this.validacion.plano_codigo, 'is-valid':!this.validacion.plano_codigo && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.plano_codigo" v-bind:key="data.plano_codigo" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-2 col-sm-12">
                <label for="exampleInputEmail1">version<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_version" placeholder="version" class="form-control"  :class="{ 'is-invalid':this.validacion.version, 'is-valid':!this.validacion.version && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.version" v-bind:key="data.version" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-2 col-sm-12">
                <label for="exampleInputEmail1">resistencia_concreto<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_resistencia_concreto" placeholder="resistencia_concreto" class="form-control"  :class="{ 'is-invalid':this.validacion.version, 'is-valid':!this.validacion.version && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.resistencia_concreto" v-bind:key="data.resistencia_concreto" >
                    <b>{{data}}</b>
                </div>
            </div>

            <div class="form-group col-md-2 col-sm-12">
              <label for="exampleInputEmail1">Estado trasmite<span class="tx-danger">*</span></label>
              <Select2 v-model="input_estado_tramite_id" :options="data_foraneo_estado_tramite_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estado_tramite_id" v-bind:key="data.estado_tramite_id" >
                                            <b>{{data}}</b>
                </div>
                </div>
          <!--
            <div class="form-group col-md-12 col-sm-12 text-center">
              <button type="submit" class="btn btn-primary">Enviar</button>
            </div>
            -->
          </div>
        </div>
      </form>
      </div>
      </div>
  </div>
</div>
</div>

<div v-if="input_Concreto_id>=1">
        <concretodetalles-vue  :input_Concreto_id="input_Concreto_id"></concretodetalles-vue>
</div>

</div>
</template>




<script type="application/javascript">
import Vue from "vue";
//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
//import VueToastr2 from "vue-toastr-2";
//import "vue-toastr-2/dist/vue-toastr-2.min.css";
//window.toastr = require("toastr");
//Vue.use(VueToastr2);

export default {
  components: {


 //   Select2
  },
  data() {

    return {
        is_enviar:false,
        validacion: [],
        editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_Concreto_id:[],
      data_foraneo_unidad_funcional_id:[],data_foraneo_estado_tramite_id:[],
      input_id:[],
      input_users_id:[],
      input_unidad_funcional_id:[],
      input_calzada:[],
      input_estrutura:[],
      input_elemento:[],
      input_plano_codigo:[],
      input_version:[],
      input_resistencia_concreto:[],
      input_estado_tramite_id:[],

      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    //this.consulta();
    this.data_foraneo();
    if(this.$route.params.id>0){
        this.show_registro(this.$route.params.id);
    }else{
        this.anadir_registro()
    }
  },
  methods: {



    anadir_registro(){
      this.validacion="";
      this.editar_dato = false;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    data_foraneo(){
      axios.get(`Appvia40express/Api/Concreto/create`).then(response => {
        this.data_foraneo_unidad_funcional_id= response.data.unidad_funcional_id
        this.data_foraneo_estado_tramite_id= response.data.estado_tramite_id
      });
    },
    formulario(is_volve=0){
        this.is_enviar=true
      const data = {
        id: this.input_Concreto_id,
        id :this.input_id,
        users_id :this.input_users_id,
        unidad_funcional_id :this.input_unidad_funcional_id,
        calzada :this.input_calzada,
        estrutura :this.input_estrutura,
        elemento :this.input_elemento,
        plano_codigo :this.input_plano_codigo,
        version :this.input_version,
        resistencia_concreto :this.input_resistencia_concreto,
        estado_tramite_id :this.input_estado_tramite_id,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`Api/Concreto/${this.input_Concreto_id}`, data)
        .then(response => {

            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              if(is_volve==1){
                  window.history.back();
              }



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`Api/Concreto`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              //this.consulta(this.page);
              this.limpiar_form();
              window.history.back();


            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        }

        );

      }

    },
    cancelar_registro(){
      window.history.back();
    },
    $can(permissionName) {
        return true;
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.mensaje_formulario="Editar un registro"


      axios.get(`/Appvia40express/Api/Concreto/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Concreto_id = data.id
              this.input_id = data.id;
              this.input_users_id = data.users_id;
              this.input_unidad_funcional_id = data.unidad_funcional_id;
              this.input_calzada = data.calzada;
              this.input_estrutura = data.estrutura;
              this.input_elemento = data.elemento;
              this.input_plano_codigo = data.plano_codigo;
              this.input_version = data.version;
              this.input_resistencia_concreto = data.resistencia_concreto;
              this.input_estado_tramite_id = data.estado_tramite_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_users_id = '';
      this.input_unidad_funcional_id = '';
      this.input_calzada = '';
      this.input_estrutura = '';
      this.input_elemento = '';
      this.input_plano_codigo = '';
      this.input_version = '';
      this.input_resistencia_concreto = '';
      this.input_estado_tramite_id = '';

      this.validacion="";

    },

  }
};


</script>



