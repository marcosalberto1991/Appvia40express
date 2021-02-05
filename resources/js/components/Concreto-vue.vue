

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de Concreto </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('Concreto Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('Concreto Anadir')" :to="{ name: 'concretoformadd',params:{id:0} }" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;' >

              Añadir Registro
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
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
          <!--
          <b-button v-if="$can('Concreto Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            -->
            <router-link :to="{ name: 'concretoform', params: { id: data.item.id }}">
                <a v-bind:href="'/Concreto/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>



            <b-button v-if="$can('Concreto Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
            </b-button>

            <a v-bind:href="''+url+'/'+url+'/Concreto/'+ data.item.id+'/pdfConcreto'" target='_blank' class='btn-sm btn btn-success mr-1' size='sm'  style='margin-bottom: 5px; margin: 5px;'>PDF </a>

          </b-button-group>




        </template>

        <template v-slot:head(Acciones)="scope">
          <div class='text-nowrap'>Acciones</div>
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
import Vue from "vue";

//import Select2 from "v-select2-component";
//https://www.npmjs.com/package/vue-toastr-2
import VueToastr2 from "vue-toastr-2";
import "vue-toastr-2/dist/vue-toastr-2.min.css";
window.toastr = require("toastr");
Vue.use(VueToastr2);

export default {
  components: {
    VueToastr2,
  //  Select2
  },
  data() {

    return {
      url: '',
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data:"",
      stickyHeader: true,
      noCollapse: false,
      fields: [
      { key: "Acciones",stickyColumn: true, label:"Acciones" ,sortable: false },
      //{ key: 'id', sortable:true},
      { key: 'users_id.name', sortable:true,label:'Usuario'},
      { key: 'unidad_funcional_id.nombre', sortable:true,label:'Unidad Funcional'},
      { key: 'calzada', sortable:true,label:'Calzada'},
      { key: 'estrutura', sortable:true,label:'Estrutura'},
      { key: 'elemento', sortable:true,label:'Elemento'},
      { key: 'plano_codigo', sortable:true,label:'Cod. Plano'},
      { key: 'version', sortable:true,label:'Version'},
      { key: 'resistencia_concreto', sortable:true,label:'Resi. Concreto'},
      { key: 'estado_tramite_id.nombre', sortable:true,label:'Tramite'},

      ],


      //input_Concreto_id:[],
      data_foraneo_unidad_funcional_id:[],data_foraneo_estado_tramite_id:[],

      consulta_datos:[],
      errors: {},
      mensaje_formulario: "",
      page:1,

    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
    //alert(this.$url);
    this.url=this.$url;
  },
  methods: {

    consulta(page = 1){
      if (localStorage.getItem("Concreto")) {
        try { this.items = JSON.parse(localStorage.getItem("Concreto"));
        } catch (e) { localStorage.removeItem("Concreto");}
      }

      this.page=page;
      //axios.get("Concreto/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`${this.$url}/Api/Concreto?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Concreto", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Concreto_id=data_id;
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_Concreto_id;
      axios.delete(`${this.$url}/Api/Concreto/${this.input_Concreto_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("Operacio exitosa", "Datos Eliminados");
          this.consulta(this.page);
          this.$refs["my-modal"].hide()

        }
      });

    },
    $can(permissionName) {
        return true;
      //return Permissions.indexOf(permissionName) !== -1;
    },
  }
};


</script>



