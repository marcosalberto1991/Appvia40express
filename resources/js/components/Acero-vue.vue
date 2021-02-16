

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de Acero </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('Acero Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('Acero Anadir')" :to="{ name: 'aceroformadd',params:{id:0} }">

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

      <b-table sticky-header stacked-sm small  responsive :items='consulta_datos.data' :fields='fields'
       :no-border-collapse='noCollapse'>
      <template v-slot:cell(Acciones)='data'>

          <b-button-group>
            <router-link :to="{ name: 'aceroform', params: { id: data.item.id }}">
                <a v-bind:href="'/Acero/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
                    Editar
                </a>
            </router-link>
            <b-button v-if="$can('Acero Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)'
                type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Eliminar
            </b-button>
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
      //{ key: 'id', sortable:true},
      { key: 'users_id.name',label:'Usuario', class:'one-lineas', sortable:true},
      { key: 'estado_tramite_id.nombre',label:'Estado de tramite', class:'one-lineas', sortable:true},
      { key: 'unidad_funcional_id.nombre',label:'Unidad Funcional', class:'one-lineas', sortable:true},
      { key: 'estrutura',label:'Estrutura', class:'one-lineas', sortable:true},
      { key: 'plano',label:'Plano', class:'one-lineas', sortable:true},
      { key: 'calzada',label:'Calzada', class:'one-lineas', sortable:true},
      { key: 'elemento',label:'Elemento', class:'one-lineas', sortable:true},
      { key: 'version',label:'Versión', class:'one-lineas', sortable:true},

      ],


      //input_Acero_id:[],
      data_foraneo_estado_tramite_id:[],data_foraneo_unidad_funcional_id:[],

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
      if (localStorage.getItem("Acero")) {
        try { this.items = JSON.parse(localStorage.getItem("Acero"));
        } catch (e) { localStorage.removeItem("Acero");}
      }

      this.page=page;
      //axios.get("Acero/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`${this.$url}/Api/Acero?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("Acero", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_Acero_id=data_id;
    },
    data_foraneo(){
        this.data_foraneo_estado_tramite_id
        this.data_foraneo_unidad_funcional_id
    },
    eliminar_registro_delete(){
      var data_id=this.input_Acero_id;
      axios.delete(`${this.$url}/Api/Acero/${this.input_Acero_id}`).then(response => {
        const data = response.data;
        if(response.data.id){
          this.validacion="";
          this.$toastr.info("operaciónn exitosa", "Datos Eliminados");
          this.consulta(this.page);
          this.$refs["my-modal"].hide()

        }
      });

    },

    $can(permissionName) {
      return Permissions.indexOf(permissionName) !== -1;
    },


  }
};


</script>



