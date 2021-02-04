<template>
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
            <input type="hidden" v-model="input_AceroDetalle_id">


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">id<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">actividad<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_actividad" placeholder="actividad" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.actividad" v-bind:key="data.actividad" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">si_aplica<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_si_aplica" placeholder="si_aplica" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.si_aplica" v-bind:key="data.si_aplica" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">si_cumple<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_si_cumple" placeholder="si_cumple" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.si_cumple" v-bind:key="data.si_cumple" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">fecha<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_fecha" placeholder="fecha" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.fecha" v-bind:key="data.fecha" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">observaciones<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_observaciones" placeholder="observaciones" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.observaciones" v-bind:key="data.observaciones" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">registro_fotografico<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_registro_fotografico" placeholder="registro_fotografico" class="form-control"  aria-describedby="emailHelp" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.registro_fotografico" v-bind:key="data.registro_fotografico" >
                    <b>{{data}}</b>
                </div>
            </div>

            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">acero_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_acero_id" :options="data_foraneo_acero_id" />
              <small id="emailHelp" class="form-text text-muted"></small>
              <b-alert show v-for="data in validacion.acero_id" v-bind:key="data.acero_id" variant="danger">
                {{data}}
              </b-alert>

                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.acero_id" v-bind:key="data.acero_id" >
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

      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,



      input_AceroDetalle_id:[],
      data_foraneo_acero_id:[],
      input_id:[],
      input_actividad:[],
      input_si_aplica:[],
      input_si_cumple:[],
      input_fecha:[],
      input_observaciones:[],
      input_registro_fotografico:[],
      input_acero_id:[],

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
        axios.get(`Api/Acero/create`).then(response => {
        this.data_foraneo_acero_id= response.data.acero_id

        });
    },
    formulario(){

      const data = {
        id: this.input_AceroDetalle_id,
        id :this.input_id,
        actividad :this.input_actividad,
        si_aplica :this.input_si_aplica,
        si_cumple :this.input_si_cumple,
        fecha :this.input_fecha,
        observaciones :this.input_observaciones,
        registro_fotografico :this.input_registro_fotografico,
        acero_id :this.input_acero_id,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(Api/`/AceroDetalle/${this.input_AceroDetalle_id}`, data)
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
              window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`Api/AceroDetalle`, data).then(response => {
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


      axios.get(`Api/AceroDetalle/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_AceroDetalle_id = data.id
              this.input_id = data.id;
              this.input_actividad = data.actividad;
              this.input_si_aplica = data.si_aplica;
              this.input_si_cumple = data.si_cumple;
              this.input_fecha = data.fecha;
              this.input_observaciones = data.observaciones;
              this.input_registro_fotografico = data.registro_fotografico;
              this.input_acero_id = data.acero_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_actividad = '';
      this.input_si_aplica = '';
      this.input_si_cumple = '';
      this.input_fecha = '';
      this.input_observaciones = '';
      this.input_registro_fotografico = '';
      this.input_acero_id = '';

      this.validacion="";

    },

  }
};


</script>



