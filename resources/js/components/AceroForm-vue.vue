<template>
<div>
<div class="row">
    <div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>


                  <h2>Formulario de Acero </h2>


                    <div class="col-md-6 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro()" >Cancelar</a>
                      </div>
                    </div>

                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_Acero_id">







            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">Estructura<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_estrutura" placeholder="estrutura" class="form-control" :class="{ 'form-control is-invalid':this.validacion.estrutura, 'form-control is-valid':!this.validacion.estrutura && is_enviar  }"  >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.estrutura" v-bind:key="data.estrutura" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">Plano<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_plano" placeholder="plano" class="form-control"  :class="{ 'form-control is-invalid':this.validacion.plano, 'form-control is-valid':!this.validacion.plano && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.plano" v-bind:key="data.plano" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">calzada<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_calzada" placeholder="calzada" class="form-control"  :class="{ 'form-control is-invalid':this.validacion.calzada, 'form-control is-valid':!this.validacion.calzada && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.calzada" v-bind:key="data.calzada" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">elemento<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_elemento" placeholder="elemento" class="form-control"  :class="{ 'form-control is-invalid':this.validacion.elemento, 'form-control is-valid':!this.validacion.elemento && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.elemento" v-bind:key="data.elemento" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-3 col-sm-12">
                <label for="exampleInputEmail1">version<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_version" placeholder="version" class="form-control" :class="{ 'is-invalid':this.validacion.version, 'is-valid':!this.validacion.version && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.version" v-bind:key="data.version" >
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

            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">unidad_funcional_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_unidad_funcional_id" :options="data_foraneo_unidad_funcional_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.unidad_funcional_id" v-bind:key="data.unidad_funcional_id" >
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

<div v-if="this.input_Acero_id>=1">
        <acerodetalle-vue  :input_Acero_id="input_Acero_id"></acerodetalle-vue>
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



      input_Acero_id:[],
      data_foraneo_estado_tramite_id:[],data_foraneo_unidad_funcional_id:[],
      input_id:[],
      input_users_id:[],
      input_estrutura:[],
      input_plano:[],
      input_calzada:[],
      input_elemento:[],
      input_version:[],
      input_estado_tramite_id:[],
      input_unidad_funcional_id:[],

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
        id: this.input_Acero_id,
        id :this.input_id,
        users_id :this.input_users_id,
        estrutura :this.input_estrutura,
        plano :this.input_plano,
        calzada :this.input_calzada,
        elemento :this.input_elemento,
        version :this.input_version,
        estado_tramite_id :this.input_estado_tramite_id,
        unidad_funcional_id :this.input_unidad_funcional_id,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(`${this.$url}/Api/Acero/${this.input_Acero_id}`, data)
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

        axios.post(`${this.$url}/Api/Acero`, data).then(response => {
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


      axios.get(`${this.$url}/Api/Acero/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("Operacio no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("Operacio exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_Acero_id = data.id
              this.input_id = data.id;
              this.input_users_id = data.users_id;
              this.input_estrutura = data.estrutura;
              this.input_plano = data.plano;
              this.input_calzada = data.calzada;
              this.input_elemento = data.elemento;
              this.input_version = data.version;
              this.input_estado_tramite_id = data.estado_tramite_id;
              this.input_unidad_funcional_id = data.unidad_funcional_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_users_id = '';
      this.input_estrutura = '';
      this.input_plano = '';
      this.input_calzada = '';
      this.input_elemento = '';
      this.input_version = '';
      this.input_estado_tramite_id = '';
      this.input_unidad_funcional_id = '';

      this.validacion="";

    },

  }
};


</script>



