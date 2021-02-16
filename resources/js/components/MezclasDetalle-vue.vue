

  <template>

  <div>

  <div class='container-fluid' v-if="!show_formulario_detalle==true">

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h5 class=''>Lista de MezclasDetalle </h5>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>

        <b-button v-if="$can('MezclasDetalle Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>

        <!--
            <router-link v-if="$can('MezclasDetalle Anadir')" :to="{ name: 'mezclasdetalleformadd',params:{id:0} }">
        -->
        <!--
            <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>

      </router-link>
      -->
      <div class='flexbox  float-right' >
        <form ref='form'    v-on:submit.prevent='consulta()'>
          <b-input-group size='sm' class='float-right  margin-bottom-0' prepend=''  style='margin-bottom: 0px;'>
            <b-form-input type='text' v-model='input_consulta_data' ></b-form-input>
            <b-input-group-append>
              <b-button @click='consulta()' size='sm' text='Button' variant='success'>Buscar</b-button>
            </b-input-group-append>
          </b-input-group>
        </form>
      </div><br><br>
    </div>

      <b-table :items='consulta_datos' :fields='fields'
      responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>

          <b-button @click='show_registro(data.item.id)'  v-if="$can('MezclasDetalle Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>

            <!--
            <router-link :to="{ name: 'mezclasdetalleform', params: { id: data.item.id }}">
                <a v-bind:href="'/MezclasDetalle/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                <div class='d-block d-sm-block d-md-none'>
                <b-icon icon='pencil-fill'></b-icon>
            </div>
            <div class='one-linea d-none d-sm-none d-md-block'>
                <span>

                    <b-icon icon='pencil-fill' ></b-icon>

                </span>
                <span>
                    Editar
                </span>
            </div>
                </a>
            </router-link>
            -->


            <b-button v-if="$can('MezclasDetalle Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>

            <div class='d-block d-sm-block d-md-none'>
                <b-icon icon='trash'></b-icon>
            </div>
            <div class='one-linea d-none d-sm-none d-md-block'>
                <span>
                        <!--
                        <b-icon icon='trash' ></b-icon>
                        -->
                </span>
                <span>
                        Eliminar
                </span>
            </div>

            </b-button>
            <!--
            <a v-bind:href=" data.item.id+'/Sucursale'"  class='btn-sm btn btn-success mr-1' size='sm'  style='margin-bottom: 5px; margin: 5px;'>Surcusales </a>
            -->
          </b-button-group>




        </template>

      </b-table>

</div>
</div>
</div>

</div>




<b-modal id="moda-eliminar" ref="my-modal"  size="xl" hide-footer >
  <template slot="modal-title">Eliminar un Registro </template>
  <div class="d-block text-center">
    <h3>¿Desea eliminar el registro permanente?</h3>
    <b-button class="mt-3 btn btn-danger " @click="eliminar_registro_delete()">Eliminar</b-button>
  </div>
</b-modal>
</div>
<div v-else class="container-fluid">

<div class="col-lg-12 ">
        <div class="main-card mb-3 card formulario">
            <div class="card-body"><h1 class="card-title"></h1>
                  <h2>Formulario </h2>
                    <div class="col-md-12 row">
                      <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                        <button type="submit"  @click="formulario()" class="btn btn-primary">Guardar </button>
                        <a class="btn btn-warning" @click="cancelar_registro_detalle()" >Cancelar</a>
                      </div>
                    </div>
                    <div class="col-lg-12">

      <form ref="form"   v-on:submit.prevent="formulario()">
        <div class="row">
          <div class="col-md-12 row">
            <input type="hidden" v-model="input_MezclasDetalle_id">





            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">hora_llegada<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_hora_llegada" placeholder="hora_llegada" class="form-control"  :class="{ 'is-invalid':this.validacion.hora_llegada, 'is-valid':!this.validacion.hora_llegada && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.hora_llegada" v-bind:key="data.hora_llegada" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">tem_llegada<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_tem_llegada" placeholder="tem_llegada" class="form-control"  :class="{ 'is-invalid':this.validacion.tem_llegada, 'is-valid':!this.validacion.tem_llegada && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.tem_llegada" v-bind:key="data.tem_llegada" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">cantidad_ton<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_cantidad_ton" placeholder="cantidad_ton" class="form-control"  :class="{ 'is-invalid':this.validacion.cantidad_ton, 'is-valid':!this.validacion.cantidad_ton && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.cantidad_ton" v-bind:key="data.cantidad_ton" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">hora_extendida<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_hora_extendida" placeholder="hora_extendida" class="form-control"  :class="{ 'is-invalid':this.validacion.hora_extendida, 'is-valid':!this.validacion.hora_extendida && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.hora_extendida" v-bind:key="data.hora_extendida" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">temp_extendida<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_temp_extendida" placeholder="temp_extendida" class="form-control"  :class="{ 'is-invalid':this.validacion.temp_extendida, 'is-valid':!this.validacion.temp_extendida && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.temp_extendida" v-bind:key="data.temp_extendida" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abcisas_inicio<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abcisas_inicio" placeholder="abcisas_inicio" class="form-control"  :class="{ 'is-invalid':this.validacion.abcisas_inicio, 'is-valid':!this.validacion.abcisas_inicio && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abcisas_inicio" v-bind:key="data.abcisas_inicio" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abcisas_fin<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abcisas_fin" placeholder="abcisas_fin" class="form-control"  :class="{ 'is-invalid':this.validacion.abcisas_fin, 'is-valid':!this.validacion.abcisas_fin && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abcisas_fin" v-bind:key="data.abcisas_fin" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abcisas_espersor<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abcisas_espersor" placeholder="abcisas_espersor" class="form-control"  :class="{ 'is-invalid':this.validacion.abcisas_espersor, 'is-valid':!this.validacion.abcisas_espersor && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abcisas_espersor" v-bind:key="data.abcisas_espersor" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">abscisas_carril<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_abscisas_carril" placeholder="abscisas_carril" class="form-control"  :class="{ 'is-invalid':this.validacion.abscisas_carril, 'is-valid':!this.validacion.abscisas_carril && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.abscisas_carril" v-bind:key="data.abscisas_carril" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">temp_compactacion<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_temp_compactacion" placeholder="temp_compactacion" class="form-control"  :class="{ 'is-invalid':this.validacion.temp_compactacion, 'is-valid':!this.validacion.temp_compactacion && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.temp_compactacion" v-bind:key="data.temp_compactacion" >
                    <b>{{data}}</b>
                </div>
            </div>


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">temp_apertu_trafico<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_temp_apertu_trafico" placeholder="temp_apertu_trafico" class="form-control"  :class="{ 'is-invalid':this.validacion.temp_apertu_trafico, 'is-valid':!this.validacion.temp_apertu_trafico && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.temp_apertu_trafico" v-bind:key="data.temp_apertu_trafico" >
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


            <div class="form-group col-md-4 col-sm-12">
                <label for="exampleInputEmail1">registro_fotografico<span class="tx-danger">*</span> </label>
                <input type="text" v-model="input_registro_fotografico" placeholder="registro_fotografico" class="form-control"  :class="{ 'is-invalid':this.validacion.registro_fotografico, 'is-valid':!this.validacion.registro_fotografico && is_enviar  }" >
                <div class="invalid-feedback" style ="display:block" v-for="data in validacion.registro_fotografico" v-bind:key="data.registro_fotografico" >
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

export default {
  components: {},
  props: ["input_Mezclas_id"],

  data() {

    return {
      validacion: [],
      editar_dato: false,
      show_formulario_detalle: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
      fields: [
      { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
      //{ key: 'id', sortable:true,class:'one-lineas'},
      { key: 'recino_no', sortable:true,class:'one-lineas'},
      { key: 'hora_llegada', sortable:true,class:'one-lineas'},
      { key: 'tem_llegada', sortable:true,class:'one-lineas'},
      { key: 'cantidad_ton', sortable:true,class:'one-lineas'},
      { key: 'hora_extendida', sortable:true,class:'one-lineas'},
      { key: 'temp_extendida', sortable:true,class:'one-lineas'},
      { key: 'abcisas_inicio', sortable:true,class:'one-lineas'},
      { key: 'abcisas_fin', sortable:true,class:'one-lineas'},
      { key: 'abcisas_espersor', sortable:true,class:'one-lineas'},
      { key: 'abscisas_carril', sortable:true,class:'one-lineas'},
      { key: 'temp_compactacion', sortable:true,class:'one-lineas'},
      { key: 'temp_apertu_trafico', sortable:true,class:'one-lineas'},
      { key: 'observaciones', sortable:true,class:'one-lineas'},
      { key: 'registro_fotografico', sortable:true,class:'one-lineas'},
      { key: 'users_id1', sortable:true,class:'one-lineas'},
      { key: 'mezclas_id', sortable:true,class:'one-lineas'},

      ],

      //formulario

      input_MezclasDetalle_id:[],

      input_id:'',
      input_recino_no:'',
      input_hora_llegada:'',
      input_tem_llegada:'',
      input_cantidad_ton:'',
      input_hora_extendida:'',
      input_temp_extendida:'',
      input_abcisas_inicio:'',
      input_abcisas_fin:'',
      input_abcisas_espersor:'',
      input_abscisas_carril:'',
      input_temp_compactacion:'',
      input_temp_apertu_trafico:'',
      input_observaciones:'',
      input_registro_fotografico:'',
      input_users_id1:'',
      //input_mezclas_id:'',

      //fin de formulario


      //input_MezclasDetalle_id:[],


      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
  },
  methods: {

    consulta(page = 1){
      if (localStorage.getItem("MezclasDetalle")) {
        try { this.items = JSON.parse(localStorage.getItem("MezclasDetalle"));
        } catch (e) { localStorage.removeItem("MezclasDetalle");}
      }
      this.page=page;
      axios.get(`${this.$url}/Api/MezclasDetalle/${this.input_Mezclas_id}/consulta_data`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("MezclasDetalle", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_MezclasDetalle_id=data_id;
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_MezclasDetalle_id;
      axios.delete(`${this.$url}/Api/MezclasDetalle/${this.input_MezclasDetalle_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("operación exitosa", "Datos Eliminados");
          this.consulta(this.page);
          this.$refs["my-modal"].hide()

        }
      });

    },
    anadir_registro(){
      this.validacion="";
      this.editar_dato = false;
      this.show_formulario_detalle = true;
      this.limpiar_form();
      this.mensaje_formulario="Añadir un nuevo registro"
    },
    data_foraneo(){
        axios.get(`/Api/Acero/create`).then(response => {

        });
    },
    formulario(){
        this.is_enviar=true

      const data = {
        id: this.input_MezclasDetalle_id,
        id :this.input_id,
        //recino_no :this.input_recino_no,
        hora_llegada :this.input_hora_llegada,
        tem_llegada :this.input_tem_llegada,
        cantidad_ton :this.input_cantidad_ton,
        hora_extendida :this.input_hora_extendida,
        temp_extendida :this.input_temp_extendida,
        abcisas_inicio :this.input_abcisas_inicio,
        abcisas_fin :this.input_abcisas_fin,
        abcisas_espersor :this.input_abcisas_espersor,
        abscisas_carril :this.input_abscisas_carril,
        temp_compactacion :this.input_temp_compactacion,
        temp_apertu_trafico :this.input_temp_apertu_trafico,
        observaciones :this.input_observaciones,
        registro_fotografico :this.input_registro_fotografico,
        //users_id1 :this.input_users_id1,
        mezclas_id :this.input_Mezclas_id,

        //name: this.input_name,
        //email: this.input_email
      };

      if(this.editar_dato == true){
        axios.put(/Api/`/MezclasDetalle/${this.input_MezclasDetalle_id}`, data)
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
              //window.history.back();



            }
        },
        (err) => {
          console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
        });

      }else{

        axios.post(`/Api/MezclasDetalle`, data).then(response => {
            const datos = response.data;
            if(response.data.errors){
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion=response.data.errors;
            }
            if(response.data.id){
              this.validacion="";
              this.$toastr.success("operación exitosa", "Datos modificados");
              //this.consulta(this.page);
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
    cancelar_registro_detalle(){
      this.show_formulario_detalle =false;
      //window.history.back();
    },
    $can(permissionName) {
        return true;
        return Permissions.indexOf(permissionName) !== -1;
    },
    show_registro(data_id){//show_registro
      this.validacion="";
      this.show_formulario_detalle =true;
      this.mensaje_formulario="Editar un registro"

      axios.get(`/Api/MezclasDetalle/${data_id}`).then(response => {
            const data = response.data;
            if(!response.data){
              this.$toastr.warning("operación no exitosa", "Regitro no obtenido");
            }else{
              this.$toastr.success("operación exitosa", "Regitro obtenido");
              this.editar_dato = true;
              this.input_MezclasDetalle_id = data.id
              this.input_id = data.id;
              this.input_recino_no = data.recino_no;
              this.input_hora_llegada = data.hora_llegada;
              this.input_tem_llegada = data.tem_llegada;
              this.input_cantidad_ton = data.cantidad_ton;
              this.input_hora_extendida = data.hora_extendida;
              this.input_temp_extendida = data.temp_extendida;
              this.input_abcisas_inicio = data.abcisas_inicio;
              this.input_abcisas_fin = data.abcisas_fin;
              this.input_abcisas_espersor = data.abcisas_espersor;
              this.input_abscisas_carril = data.abscisas_carril;
              this.input_temp_compactacion = data.temp_compactacion;
              this.input_temp_apertu_trafico = data.temp_apertu_trafico;
              this.input_observaciones = data.observaciones;
              this.input_registro_fotografico = data.registro_fotografico;
              this.input_users_id1 = data.users_id1;
              this.input_mezclas_id = data.mezclas_id;


            }
        });
    },
    limpiar_form(){
      this.input_id = '';
      this.input_recino_no = '';
      this.input_hora_llegada = '';
      this.input_tem_llegada = '';
      this.input_cantidad_ton = '';
      this.input_hora_extendida = '';
      this.input_temp_extendida = '';
      this.input_abcisas_inicio = '';
      this.input_abcisas_fin = '';
      this.input_abcisas_espersor = '';
      this.input_abscisas_carril = '';
      this.input_temp_compactacion = '';
      this.input_temp_apertu_trafico = '';
      this.input_observaciones = '';
      this.input_registro_fotografico = '';
      this.input_users_id1 = '';
      this.input_mezclas_id = '';

      this.validacion="";

    },






  }
};


</script>



