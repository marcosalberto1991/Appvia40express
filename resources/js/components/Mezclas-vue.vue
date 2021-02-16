

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de Mezclas </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('Mezclas Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('Mezclas Anadir')" :to="{ name: 'mezclasformadd',params:{id:0} }">

        <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>
      </router-link>
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

      <b-table :items='consulta_datos.data' :fields='fields'
      responsive='sm' :sticky-header='stickyHeader' :no-border-collapse='noCollapse'>
      sentido_via
      <template v-slot:cell(sentido_via)='data'>
        <span v-if="data.item.sentido_via==1" >Gi -BO </span>
        <span v-if="data.item.sentido_via==2" >BO -GI</span>
      </template>
      <template v-slot:cell(is_horas_riego_imrpimacion)='data'>
        <span v-if="data.item.is_horas_riego_imrpimacion==0" >NO </span>
        <span v-if="data.item.is_horas_riego_imrpimacion==1" >SI</span>
      </template>
      <template v-slot:cell(is_horas_liga)='data'>
        <span v-if="data.item.is_horas_liga==0" >NO </span>
        <span v-if="data.item.is_horas_liga==1" >SI</span>
      </template>
      <template v-slot:cell(estado_riego)='data'>
        <span v-if="data.item.estado_riego==1" >BUENO </span>
        <span v-if="data.item.estado_riego==2" >REGULAR</span>
        <span v-if="data.item.estado_riego==3" >MALO</span>
      </template>
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
          <!--
          <b-button v-if="$can('Mezclas Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            -->
            <router-link :to="{ name: 'mezclasform', params: { id: data.item.id }}">
                <a v-bind:href="'/Mezclas/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                <div class='d-block d-sm-block d-md-none'>
                <b-icon icon='pencil-fill'></b-icon>
            </div>
            <div class='one-linea d-none d-sm-none d-md-block'>
                <span>
                <!--
                    <b-icon icon='pencil-fill' ></b-icon>
                -->
                </span>
                <span>
                    Editar
                </span>
            </div>
                </a>
            </router-link>



            <b-button v-if="$can('Mezclas Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>

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
</template>




<script type="application/javascript">
//import Vue from "vue";

//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
//import VueToastr2 from "vue-toastr-2";
//import "vue-toastr-2/dist/vue-toastr-2.min.css";
//window.toastr = require("toastr");
//Vue.use(VueToastr2);

export default {
  components: {

  //  Select2
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
      fields: [
      { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
      //{ key: 'id', sortable:true,label:'',class:'one-lineas'},
      { key: 'users_id.name',label:'Usuario', sortable:true,class:'one-lineas'},
      { key: 'sentido_via',label:'Sentido via', sortable:true,class:'one-lineas'},
      { key: 'unidad_funcional_id',label:'Unidad funcional', sortable:true,class:'one-lineas'},
      { key: 'fecha',label:'fecha', sortable:true,class:'one-lineas'},
      { key: 'tipo_mezcla',label:'Tipo mezcla', sortable:true,class:'one-lineas'},
      { key: 'ensayos_de_laboratorio',label:'Ensayos de laboratorio', sortable:true,class:'one-lineas'},
      { key: 'is_horas_riego_imrpimacion',label:'24 horas de riego imprimación', sortable:true,class:'one-lineas'},
      { key: 'is_horas_liga',label:'2 horas liga', sortable:true,class:'one-lineas'},
      { key: 'estado_riego',label:'Estado Riego', sortable:true,class:'one-lineas'},

      ],
      data_foraneo_unidad_funcional_id:[],
      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

      data_foraneo_sentido_via_id:[
          {id:1, text:'GI - BO'},
          {id:2, text:'BO - GI'}
      ],
      data_foraneo_input_estado_riego_id:[
          {id:1, text:'BUENO'},
          {id:2, text:'REGULAR'},
          {id:3, text:'MALO'},

      ],

    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
  },
  methods: {

    consulta(page = 1){
      if (localStorage.getItem("Mezclas")) {
        try { this.items = JSON.parse(localStorage.getItem("Mezclas"));
        } catch (e) { localStorage.removeItem("Mezclas");}
      }

      this.page=page;
      //axios.get("Mezclas/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`/Api/Mezclas?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Mezclas", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Mezclas_id=data_id;
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_Mezclas_id;
      axios.delete(`/Api/Mezclas/${this.input_Mezclas_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("operación exitosa", "Datos Eliminados");
          this.consulta(this.page);
          this.$refs["my-modal"].hide()

        }
      });

    },

    $can(permissionName) {
        return true;

      return Permissions.indexOf(permissionName) !== -1;
    },


  }
};


</script>



