<template>
<div>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario de colocación de mezclas asfáltica</h2>
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
            <input type="hidden" v-model="input_Mezclas_id">
            <div class="form-group col-md-2 col-sm-12">
              <label for="exampleInputEmail1">Unidad Funcional<span class="tx-danger">*</span></label>
              <Select2 v-model="input_unidad_funcional_id" :options="data_foraneo_unidad_funcional_id" />
              <small id="emailHelp" class="form-text text-muted"></small>
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.unidad_funcional_id" v-bind:key="data.unidad_funcional_id" >
                    <b>{{data}}</b>
                </div>
            </div>
            <div class="form-group col-md-2 col-sm-12">
              <label for="exampleInputEmail1">Sentido<span class="tx-danger">*</span></label>
              <Select2 v-model="input_sentido_via" :options="data_foraneo_sentido_via_id" />
              <small id="emailHelp" class="form-text text-muted"></small>
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.sentido_via" v-bind:key="data.sentido_via" >
                    <b>{{data}}</b>
                </div>
            </div>
            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">Fecha<span class="tx-danger">*</span> </label>
                    <b-form-datepicker id="example-datepicker" v-model="input_fecha" class="mb-2 form-control" :class="{ 'is-invalid':this.validacion.fecha, 'is-valid':!this.validacion.fecha && is_enviar  }" ></b-form-datepicker>
                <!--
                <input type="text" v-model="input_fecha" placeholder="fecha" class="form-control"  :class="{ 'is-invalid':this.validacion.fecha, 'is-valid':!this.validacion.fecha && is_enviar  }" >
                -->
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.fecha" v-bind:key="data.fecha" >
                    <b>{{data}}</b>
                </div>
            </div>
            <div class="form-group col-md-2 col-sm-12">
                <label for="exampleInputEmail1">Tipo de Mezcla<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_tipo_mezcla" placeholder="tipo_mezcla" class="form-control"  :class="{ 'is-invalid':this.validacion.tipo_mezcla, 'is-valid':!this.validacion.tipo_mezcla && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tipo_mezcla" v-bind:key="data.tipo_mezcla" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">Ensayos de laboratorio<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_ensayos_de_laboratorio" placeholder="ensayos_de_laboratorio" class="form-control"  :class="{ 'is-invalid':this.validacion.ensayos_de_laboratorio, 'is-valid':!this.validacion.ensayos_de_laboratorio && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.ensayos_de_laboratorio" v-bind:key="data.ensayos_de_laboratorio" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">24 horas de riego imrpimacion<span class="tx-danger">*</span> </label>
                 <b-form-group>
                    <b-form-radio v-model="input_is_horas_riego_imrpimacion"  name="some-radios" value="1">SI</b-form-radio>
                    <b-form-radio v-model="input_is_horas_riego_imrpimacion"  name="some-radios" value="0">NO</b-form-radio>
                </b-form-group>
                 <div class="invalid-feedback" style ="display:block" v-for="data in validacion.is_horas_riego_imrpimacion" v-bind:key="data.is_horas_riego_imrpimacion" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">2 horas de liga<span class="tx-danger">*</span> </label>
                <b-form-group label="">
                    <b-form-radio v-model="input_is_horas_liga"  name="input_is_horas_liga" value="1">SI</b-form-radio>
                    <b-form-radio v-model="input_is_horas_liga"  name="input_is_horas_liga" value="0">NO</b-form-radio>
                </b-form-group>
                <!--
                <input type="text" v-model="input_is_horas_liga" placeholder="is_horas_liga" class="form-control"  :class="{ 'is-invalid':this.validacion.is_horas_liga, 'is-valid':!this.validacion.is_horas_liga && is_enviar  }" >
                -->
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.is_horas_liga" v-bind:key="data.is_horas_liga" >
                    <b>{{data}}</b>
                </div>
            </div>

            <div class="form-group col-md-2 col-sm-12">
              <label for="exampleInputEmail1">Estado riego<span class="tx-danger">*</span></label>
              <Select2 v-model="input_estado_riego" :options="data_foraneo_input_estado_riego_id" />
              <small id="emailHelp" class="form-text text-muted"></small>
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estado_riego" v-bind:key="data.estado_riego" >
                    <b>{{data}}</b>
                </div>
            </div>
          </div>
        </div>
      </form>
      </div>
      </div>
  </div>
</div>
</div>

<div v-if="input_Mezclas_id>=1">
        <mezclasdetalle-vue :input_Mezclas_id="input_Mezclas_id"></mezclasdetalle-vue>

</div>
</div>



</template>

<script type="application/javascript">
import Vue from "vue";


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



      input_Mezclas_id:0,
      data_foraneo_unidad_funcional_id:[],
      data_foraneo_sentido_via_id:[
          {id:1, text:'GI - BO'},
          {id:2, text:'BO - GI'}
      ],
      data_foraneo_input_estado_riego_id:[
          {id:1, text:'BUENO'},
          {id:2, text:'REGULAR'},
          {id:3, text:'MALO'},

      ],
      input_id:[],
      input_sentido_via:[],
      input_unidad_funcional_id:[],
      input_fecha:[],
      input_tipo_mezcla:[],
      input_ensayos_de_laboratorio:[],
      input_is_horas_riego_imrpimacion:[],
      input_is_horas_liga:[],
      input_estado_riego:[],
      input_users_id:[],

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

        });
    },
    formulario(){
        this.is_enviar=true

      const data = {
        id: this.input_Mezclas_id,
        id :this.input_id,
        sentido_via :this.input_sentido_via,
        unidad_funcional_id :this.input_unidad_funcional_id,
        fecha :this.input_fecha,
        tipo_mezcla :this.input_tipo_mezcla,
        ensayos_de_laboratorio :this.input_ensayos_de_laboratorio,
        is_horas_riego_imrpimacion :this.input_is_horas_riego_imrpimacion,
        is_horas_liga :this.input_is_horas_liga,
        estado_riego :this.input_estado_riego,
        users_id :this.input_users_id,
      };

      if(this.editar_dato == true){
          //this.input_Mezclas_id
        axios.put(`${this.$url}/Api/Mezclas/${this.input_Mezclas_id}`, data)
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

        axios.post(`${this.$url}/Api/Mezclas`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
                this.validacion="";
                this.$toastr.success("operación exitosa", "Datos modificados");
                //this.consulta(this.page);
                this.input_Mezclas_id=response.data.id
                this.input_id=response.data.id
                this.editar_dato = true
              //this.limpiar_form();
              //window.history.back();


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
        //return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
        this.validacion="";
        this.mensaje_formulario="Editar un registro"

        axios.get(`${this.$url}/Api/Mezclas/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("operación no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("operación exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Mezclas_id = data.id
              this.input_id = data.id;
              this.input_sentido_via = data.sentido_via;
              this.input_unidad_funcional_id = data.unidad_funcional_id;
              this.input_fecha = data.fecha;
              this.input_tipo_mezcla = data.tipo_mezcla;
              this.input_ensayos_de_laboratorio = data.ensayos_de_laboratorio;
              this.input_is_horas_riego_imrpimacion = data.is_horas_riego_imrpimacion;
              this.input_is_horas_liga = data.is_horas_liga;
              this.input_estado_riego = data.estado_riego;
              this.input_users_id = data.users_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_sentido_via = '';
      this.input_unidad_funcional_id = '';
      this.input_fecha = '';
      this.input_tipo_mezcla = '';
      this.input_ensayos_de_laboratorio = '';
      this.input_is_horas_riego_imrpimacion = '';
      this.input_is_horas_liga = '';
      this.input_estado_riego = '';
      this.input_users_id = '';

      this.validacion="";

    },

  }
};


</script>



