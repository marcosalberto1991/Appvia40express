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
            <input type="hidden" v-model="input_GranularesDetalle_id">
  

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">id<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_id" placeholder="id" class="form-control"  :class="{ 'is-invalid':this.validacion.id, 'is-valid':!this.validacion.id && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.id" v-bind:key="data.id" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">item<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_item" placeholder="item" class="form-control"  :class="{ 'is-invalid':this.validacion.item, 'is-valid':!this.validacion.item && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.item" v-bind:key="data.item" >
                    <b>{{data}}</b>
                </div>
            </div>
                
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">tipo_capa_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_tipo_capa_id" :options="data_foraneo_tipo_capa_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tipo_capa_id" v-bind:key="data.tipo_capa_id" >
                                            <b>{{data}}</b>
                </div>
                </div>
          

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">si_aplica<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_si_aplica" placeholder="si_aplica" class="form-control"  :class="{ 'is-invalid':this.validacion.si_aplica, 'is-valid':!this.validacion.si_aplica && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.si_aplica" v-bind:key="data.si_aplica" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abcisado_inicial<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abcisado_inicial" placeholder="abcisado_inicial" class="form-control"  :class="{ 'is-invalid':this.validacion.abcisado_inicial, 'is-valid':!this.validacion.abcisado_inicial && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abcisado_inicial" v-bind:key="data.abcisado_inicial" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abcisado_final<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abcisado_final" placeholder="abcisado_final" class="form-control"  :class="{ 'is-invalid':this.validacion.abcisado_final, 'is-valid':!this.validacion.abcisado_final && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abcisado_final" v-bind:key="data.abcisado_final" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">si_supervidsado<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_si_supervidsado" placeholder="si_supervidsado" class="form-control"  :class="{ 'is-invalid':this.validacion.si_supervidsado, 'is-valid':!this.validacion.si_supervidsado && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.si_supervidsado" v-bind:key="data.si_supervidsado" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">fehca<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_fehca" placeholder="fehca" class="form-control"  :class="{ 'is-invalid':this.validacion.fehca, 'is-valid':!this.validacion.fehca && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.fehca" v-bind:key="data.fehca" >
                    <b>{{data}}</b>
                </div>
            </div>
                

            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">observaciones<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_observaciones" placeholder="observaciones" class="form-control"  :class="{ 'is-invalid':this.validacion.observaciones, 'is-valid':!this.validacion.observaciones && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.observaciones" v-bind:key="data.observaciones" >
                    <b>{{data}}</b>
                </div>
            </div>
                
            <div class="form-group col-md-3 col-sm-12">
              <label for="exampleInputEmail1">granulares_id<span class="tx-danger">*</span></label>
              <Select2 v-model="input_granulares_id" :options="data_foraneo_granulares_id" />
              <small id="emailHelp" class="form-text text-muted"></small>


                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.granulares_id" v-bind:key="data.granulares_id" >
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



      input_GranularesDetalle_id:[],
      data_foraneo_tipo_capa_id:[],data_foraneo_granulares_id:[],
      input_id:[],
      input_item:[],
      input_tipo_capa_id:[],
      input_si_aplica:[],
      input_abcisado_inicial:[],
      input_abcisado_final:[],
      input_si_supervidsado:[],
      input_fehca:[],
      input_observaciones:[],
      input_granulares_id:[],
      
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
        axios.get(`/Api/Acero/create`).then(response => {
        this.data_foraneo_tipo_capa_id= response.data.tipo_capa_id
        this.data_foraneo_granulares_id= response.data.granulares_id
        
        });
    },
    formulario(){
        this.is_enviar=true

      const data = {
        id: this.input_GranularesDetalle_id,
        id :this.input_id,
        item :this.input_item,
        tipo_capa_id :this.input_tipo_capa_id,
        si_aplica :this.input_si_aplica,
        abcisado_inicial :this.input_abcisado_inicial,
        abcisado_final :this.input_abcisado_final,
        si_supervidsado :this.input_si_supervidsado,
        fehca :this.input_fehca,
        observaciones :this.input_observaciones,
        granulares_id :this.input_granulares_id,
        
        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(/Api/`/GranularesDetalle/${this.input_GranularesDetalle_id}`, data)
        .then(response => {

            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("operaciónn exitosa", "Datos modificados");
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

        axios.post(`/Api/GranularesDetalle`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("operaciónn exitosa", "Datos modificados");
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


      axios.get(`/Api/GranularesDetalle/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("operaciónn no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("operaciónn exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_GranularesDetalle_id = data.id
              this.input_id = data.id;
              this.input_item = data.item;
              this.input_tipo_capa_id = data.tipo_capa_id;
              this.input_si_aplica = data.si_aplica;
              this.input_abcisado_inicial = data.abcisado_inicial;
              this.input_abcisado_final = data.abcisado_final;
              this.input_si_supervidsado = data.si_supervidsado;
              this.input_fehca = data.fehca;
              this.input_observaciones = data.observaciones;
              this.input_granulares_id = data.granulares_id;
              

            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_item = '';
      this.input_tipo_capa_id = '';
      this.input_si_aplica = '';
      this.input_abcisado_inicial = '';
      this.input_abcisado_final = '';
      this.input_si_supervidsado = '';
      this.input_fehca = '';
      this.input_observaciones = '';
      this.input_granulares_id = '';
      
      this.validacion="";

    },

  }
};


</script>



