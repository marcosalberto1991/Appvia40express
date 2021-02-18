

  <template>

  <div class='container-fluid'>

    <div class='row'>
  <div class='col-lg-12'>
  <div class='main-card mb-3 card'>
  <div class='card-body'><h1 class=''>Lista de PerfilSalud </h1>

    <nav>
      <pagination :data='consulta_datos' @pagination-change-page='consulta'></pagination>
    </nav>

    <div class='col-12'>
        <!--
        <b-button v-if="$can('PerfilSalud Anadir')"  @click='anadir_registro()' type='button' class='btn btn-wangir btn-lg' data-toggle='button' size='sm' aria-pressed='false' variant='success' style='margin-bottom: 5px; margin: 5px;'>Añadir registro
        </b-button>
        -->
      <router-link v-if="$can('PerfilSalud Anadir')" :to="{ name: 'perfilsaludformadd',params:{id:0} }">

        <a v-bind:href="'/Marca/create'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Añadir Registro
        </a>

      </router-link>
        <!--
        <a :href="this.$url+'/Encuesta_Salud/Exporta_Excel'" target="_blank" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Descargar en Excel
        </a>
        -->
        <a :href="this.$url+'/Encuesta_Salud/Exporta_Excel_lista'" target="_blank" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
              Descargar en Excel por lista
        </a>

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
          <b-button v-if="$can('PerfilSalud Editar')" size='sm' variant='warning'  type='button' class='btn-sm btn btn-wangir mr-1' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>Editar
            </b-button>
            -->
            <router-link :to="{ name: 'perfilsaludform', params: { id: data.item.id }}">
                <a v-bind:href="'/PerfilSalud/'+data.item.id+'/edit'" class='btn-sm btn btn-success mr-1' size='sm' style='margin-bottom: 5px; margin: 5px;'>
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



            <b-button v-if="$can('PerfilSalud Eliminar')"  v-b-modal.moda-eliminar @click='eliminar_registro(data.item.id)' type='button' class='btn-sm btn btn-danger mr-1' size='sm' data-toggle='button' aria-pressed='false' style='margin-bottom: 5px; margin: 5px;'>

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
      { key: 'id', sortable:true,class:'one-lineas'},
      { key: 'tipo_documento_id', sortable:true,class:'one-lineas'},
      { key: 'cedula', sortable:true,class:'one-lineas'},
      { key: 'nombre', sortable:true,class:'one-lineas'},
      { key: 'apellido', sortable:true,class:'one-lineas'},
      { key: 'sexo', sortable:true,class:'one-lineas'},
      { key: 'area', sortable:true,class:'one-lineas'},
      { key: 'cargo', sortable:true,class:'one-lineas'},
      { key: 'fecha_nacimiento', sortable:true,class:'one-lineas'},

      ],


      //input_PerfilSalud_id:[],
      data_foraneo_tipo_documento_id:[],

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
      if (localStorage.getItem("PerfilSalud")) {
        try { this.items = JSON.parse(localStorage.getItem("PerfilSalud"));
        } catch (e) { localStorage.removeItem("PerfilSalud");}
      }

      this.page=page;
      //axios.get("PerfilSalud/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios.get(`${this.$url}/Api/PerfilSalud?page=${page}&consulta_data=${this.input_consulta_data}`)
      .then(response => {
        this.consulta_datos = response.data;
        const parsed = JSON.stringify(response.data);
        localStorage.setItem("PerfilSalud", parsed);
      });
    },

    eliminar_registro(data_id){
    this.input_PerfilSalud_id=data_id;
    },
    data_foraneo(){

    },
    eliminar_registro_delete(){
      var data_id=this.input_PerfilSalud_id;
      axios.delete(`${this.$url}/Api/PerfilSalud/${this.input_PerfilSalud_id}`).then(response => {
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
      return Permissions.indexOf(permissionName) !== -1;
    },


  }
};


</script>



