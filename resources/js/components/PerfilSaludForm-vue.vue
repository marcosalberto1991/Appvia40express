<template>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  v-if="$can('PerfilSalud Anadir') || $can('PerfilSalud editar')  "  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_PerfilSalud_id">




            <div class="form-group col-md-4 col-sm-12">
              <label for="exampleInputEmail1">tipo_documento_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_tipo_documento_id" :options="data_foraneo_tipo_documento_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tipo_documento_id" v-bind:key="data.tipo_documento_id" >
                                            <b>{{data}}</b>
                </div>
                </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">cedula<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_cedula" placeholder="cedula" class="form-control"  :class="{ 'is-invalid':this.validacion.cedula, 'is-valid':!this.validacion.cedula && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.cedula" v-bind:key="data.cedula" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">nombre<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_nombre" placeholder="nombre" class="form-control"  :class="{ 'is-invalid':this.validacion.nombre, 'is-valid':!this.validacion.nombre && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.nombre" v-bind:key="data.nombre" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">apellido<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_apellido" placeholder="apellido" class="form-control"  :class="{ 'is-invalid':this.validacion.apellido, 'is-valid':!this.validacion.apellido && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.apellido" v-bind:key="data.apellido" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">sexo<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_sexo" placeholder="sexo" class="form-control"  :class="{ 'is-invalid':this.validacion.sexo, 'is-valid':!this.validacion.sexo && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.sexo" v-bind:key="data.sexo" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">area<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_area" placeholder="area" class="form-control"  :class="{ 'is-invalid':this.validacion.area, 'is-valid':!this.validacion.area && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.area" v-bind:key="data.area" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">cargo<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_cargo" placeholder="cargo" class="form-control"  :class="{ 'is-invalid':this.validacion.cargo, 'is-valid':!this.validacion.cargo && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.cargo" v-bind:key="data.cargo" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">fecha_nacimiento<span class="tx-danger">*</span> </label>
                    <b-form-datepicker id="example-datepicker" v-model="input_fecha_nacimiento" class="mb-2" :class="{ 'is-invalid':this.validacion.fecha_nacimiento, 'is-valid':!this.validacion.fecha_nacimiento && is_enviar  }" ></b-form-datepicker>
<!--
                <input type="text" v-model="input_fecha_nacimiento" placeholder="fecha_nacimiento" class="form-control"  :class="{ 'is-invalid':this.validacion.fecha_nacimiento, 'is-valid':!this.validacion.fecha_nacimiento && is_enviar  }" >
  -->
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.fecha_nacimiento" v-bind:key="data.fecha_nacimiento" >
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



      input_PerfilSalud_id:[],
      data_foraneo_tipo_documento_id:[],
      input_id:[],
      input_tipo_documento_id:[],
      input_cedula:[],
      input_nombre:[],
      input_apellido:[],
      input_sexo:[],
      input_area:[],
      input_cargo:[],
      input_fecha_nacimiento:[],

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
        axios.get(`${this.$url}/Api/PerfilSalud/create`).then(response => {
        this.data_foraneo_tipo_documento_id= response.data.tipo_documento_id

        });
    },
    formulario(){
        this.is_enviar=true

      const data = {
        id: this.input_PerfilSalud_id,
        id :this.input_id,
        tipo_documento_id :this.input_tipo_documento_id,
        cedula :this.input_cedula,
        nombre :this.input_nombre,
        apellido :this.input_apellido,
        sexo :this.input_sexo,
        area :this.input_area,
        cargo :this.input_cargo,
        fecha_nacimiento :this.input_fecha_nacimiento,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`${this.$url}/Api/PerfilSalud/${this.input_PerfilSalud_id}`, data)
        .then(response => {

            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("operación exitosa", "Datos modificados");
              //this.consulta(this.page);
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`${this.$url}/Api/PerfilSalud`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("operación exitosa", "Datos modificados");
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
    //    return true;
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.mensaje_formulario="Editar un registro"


      axios.get(`${this.$url}/Api/PerfilSalud/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("operación no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("operación exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_PerfilSalud_id = data.id
              this.input_id = data.id;
              this.input_tipo_documento_id = data.tipo_documento_id;
              this.input_cedula = data.cedula;
              this.input_nombre = data.nombre;
              this.input_apellido = data.apellido;
              this.input_sexo = data.sexo;
              this.input_area = data.area;
              this.input_cargo = data.cargo;
              this.input_fecha_nacimiento = data.fecha_nacimiento;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_tipo_documento_id = '';
      this.input_cedula = '';
      this.input_nombre = '';
      this.input_apellido = '';
      this.input_sexo = '';
      this.input_area = '';
      this.input_cargo = '';
      this.input_fecha_nacimiento = '';

      this.validacion="";

    },

  }
};


</script>



