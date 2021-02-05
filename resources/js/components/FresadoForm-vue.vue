<template>
<div>

<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_Fresado_id">




            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">unidad_funcional_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_unidad_funcional_id" :options="data_foraneo_unidad_funcional_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.unidad_funcional_id" v-bind:key="data.unidad_funcional_id" >
                                            <b>{{data}}</b>
                </div>
                </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">calzada<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_calzada" placeholder="calzada" class="form-control"  :class="{ 'is-invalid':this.validacion.calzada, 'is-valid':!this.validacion.calzada && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.calzada" v-bind:key="data.calzada" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">longitud<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_longitud" placeholder="longitud" class="form-control"  :class="{ 'is-invalid':this.validacion.longitud, 'is-valid':!this.validacion.longitud && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.longitud" v-bind:key="data.longitud" >
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


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">version<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_version" placeholder="version" class="form-control"  :class="{ 'is-invalid':this.validacion.version, 'is-valid':!this.validacion.version && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.version" v-bind:key="data.version" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">ancho_uno<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_ancho_uno" placeholder="ancho_uno" class="form-control"  :class="{ 'is-invalid':this.validacion.ancho_uno, 'is-valid':!this.validacion.ancho_uno && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.ancho_uno" v-bind:key="data.ancho_uno" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">ancho_dos<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_ancho_dos" placeholder="ancho_dos" class="form-control"  :class="{ 'is-invalid':this.validacion.ancho_dos, 'is-valid':!this.validacion.ancho_dos && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.ancho_dos" v-bind:key="data.ancho_dos" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">espesor_uno<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_espesor_uno" placeholder="espesor_uno" class="form-control"  :class="{ 'is-invalid':this.validacion.espesor_uno, 'is-valid':!this.validacion.espesor_uno && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.espesor_uno" v-bind:key="data.espesor_uno" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">espesor_dos<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_espesor_dos" placeholder="espesor_dos" class="form-control"  :class="{ 'is-invalid':this.validacion.espesor_dos, 'is-valid':!this.validacion.espesor_dos && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.espesor_dos" v-bind:key="data.espesor_dos" >
                    <b>{{data}}</b>
                </div>
            </div>

            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">estado_tramite_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_estado_tramite_id" :options="data_foraneo_estado_tramite_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estado_tramite_id" v-bind:key="data.estado_tramite_id" >
                                            <b>{{data}}</b>
                </div>
                </div>

            <div class="form-group col-md-12 col-sm-12 text-center">
              <button type="submit" class="btn btn-primary">Enviar</button>
            </div>
          </div>
        </div>
      </form>
      </div>
      </div>
  </div>
</div>
</div>



<div v-if="input_Fresado_id>=1">
    <fresadodetalle-vue  :input_Fresado_id="input_Fresado_id"></fresadodetalle-vue>
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



      input_Fresado_id:[],
      data_foraneo_unidad_funcional_id:[],data_foraneo_estado_tramite_id:[],
      input_id:[],
      input_unidad_funcional_id:[],
      input_calzada:[],
      input_longitud:[],
      input_plano_codigo:[],
      input_version:[],
      input_ancho_uno:[],
      input_ancho_dos:[],
      input_espesor_uno:[],
      input_espesor_dos:[],
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
        axios.get(`${this.$url}/Api/Acero/create`).then(response => {
        this.data_foraneo_unidad_funcional_id= response.data.unidad_funcional_id
        this.data_foraneo_estado_tramite_id= response.data.estado_tramite_id

        });
    },
    formulario(){
        this.is_enviar=true

      const data = {
        id: this.input_Fresado_id,
        id :this.input_id,
        unidad_funcional_id :this.input_unidad_funcional_id,
        calzada :this.input_calzada,
        longitud :this.input_longitud,
        plano_codigo :this.input_plano_codigo,
        version :this.input_version,
        ancho_uno :this.input_ancho_uno,
        ancho_dos :this.input_ancho_dos,
        espesor_uno :this.input_espesor_uno,
        espesor_dos :this.input_espesor_dos,
        estado_tramite_id :this.input_estado_tramite_id,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`${this.$url}/Api/Fresado/${this.input_Fresado_id}`, data)
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
              window.history.back();//172.203.249



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`${this.$url}/Api/Fresado`, data).then(response => {
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


      axios.get(`${this.$url}/Api/Fresado/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Fresado_id = data.id
              this.input_id = data.id;
              this.input_unidad_funcional_id = data.unidad_funcional_id;
              this.input_calzada = data.calzada;
              this.input_longitud = data.longitud;
              this.input_plano_codigo = data.plano_codigo;
              this.input_version = data.version;
              this.input_ancho_uno = data.ancho_uno;
              this.input_ancho_dos = data.ancho_dos;
              this.input_espesor_uno = data.espesor_uno;
              this.input_espesor_dos = data.espesor_dos;
              this.input_estado_tramite_id = data.estado_tramite_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_unidad_funcional_id = '';
      this.input_calzada = '';
      this.input_longitud = '';
      this.input_plano_codigo = '';
      this.input_version = '';
      this.input_ancho_uno = '';
      this.input_ancho_dos = '';
      this.input_espesor_uno = '';
      this.input_espesor_dos = '';
      this.input_estado_tramite_id = '';

      this.validacion="";

    },

  }
};


</script>



