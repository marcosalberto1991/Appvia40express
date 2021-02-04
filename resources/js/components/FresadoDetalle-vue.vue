<template>
  <div class="">
    <div class="row">
      <div class="col-lg-12">
        <div class="main-card mb-12 card">
          <div class="card-header">
            ACERO DE REFUERZO
            <div class="btn-actions-pane-right">
              <div role="group" class="btn-group-sm btn-group">
                <!--
                <button class="active btn btn-focus">Last Week</button>
                <button class="btn btn-focus">All Month</button>
                -->
              </div>
            </div>
          </div>
          <div class="table-responsive">
            <table
              class="align-middle mb-0 table table-borderless table-striped table-hover"
            >
              <thead>
                <tr>
                  <th class="text-left">Actividad</th>
                  <th>Aplica</th>
                  <th>Cumplimiento</th>
                  <th>Fecha</th>
                  <th>Observaciones</th>
                  <th>Registro Fotografico</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="data in consulta_datos" v-bind:key="data.id">
                  <td class="text-left minimo" v-html="data.actividad.substr(0, 50)"></td>
                  <td>
                    <div v-if="data.si_aplica == '0'"><div class="badge badge-warning">No</div></div>
                    <div v-if="data.si_aplica == '1'"><div class="badge badge-success">Si</div></div>
                    <div v-if="data.si_aplica == '3'"><div class="badge badge-gray">Indefinido</div></div>
                  </td>
                  <td>
                    <div v-if="data.si_cumple == '0'"><div class="badge badge-warning">No</div></div>
                    <div v-if="data.si_cumple == '1'"><div class="badge badge-success">Si </div></div>
                    <div v-if="data.si_cumple == '3'"><div class="badge badge-gray">Indefinido</div></div>
                  </td>

                  <td class="text-center">
                    {{ data.fecha }}
                  </td>
                  <td>
                    {{ data.observaciones }}
                  </td>
                  <td class="minimo">
                    <img height="60px" :src="'/Concreto/'+data.registro_fotografico" alt="">

                  </td>
                  <td class="text-center">

                    <button
                      @click="show_registro(data)"
                      type="button"
                      id="PopoverCustomT-1"
                      class="btn btn-success btn-sm"
                    >
                      Editar
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="d-block text-center card-footer">
            <button class="mr-2 btn-icon btn-icon-only btn btn-outline-danger">
              <i class="pe-7s-trash btn-icon-wrapper"> </i>
            </button>
            <button class="btn-wide btn btn-success">Save</button>
          </div>
        </div>
        <br />

        <div class="main-card mb-3 card">
          <div class="card-body">
            <h5 class="">Actividades</h5>

            <div class="col-12">

              <br /><br />
            </div>
            <!--
            <b-table
              :items="consulta_datos.data"
              :fields="fields"
              responsive="sm"
              :sticky-header="stickyHeader"
              :no-border-collapse="noCollapse"
            >
              <template v-slot:cell(Acciones)="data">
                <b-button-group>

                  <router-link
                    :to="{
                      name: 'concretodetallesform',
                      params: { id: data.item.id },
                    }"
                  >
                    <a
                      v-bind:href="'/ConcretoDetalles/' + data.item.id + '/edit'"
                      class="btn-sm btn btn-success mr-1"
                      size="sm"
                      style="margin-bottom: 5px; margin: 5px"
                    >
                      Editar
                    </a>
                  </router-link>

                  <b-button
                    v-if="$can('ConcretoDetalles Eliminar')"
                    v-b-modal.moda-eliminar
                    @click="eliminar_registro(data.item.id)"
                    type="button"
                    class="btn-sm btn btn-danger mr-1"
                    size="sm"
                    data-toggle="button"
                    aria-pressed="false"
                    style="margin-bottom: 5px; margin: 5px"
                    >Eliminar
                  </b-button>

                </b-button-group>
              </template>
              <template v-slot:head(Acciones)="scope">
                <div class="text-nowrap">Acciones</div>
              </template>
            </b-table>
            -->
          </div>
        </div>
      </div>
    </div>

    <b-modal id="moda-eliminar" ref="my-modal" size="xl" hide-footer>
      <template slot="modal-title">Eliminar un Registro </template>
      <div class="d-block text-center">
        <h3>¿Desea eliminar el registro permanente?</h3>
        <b-button class="mt-3 btn btn-danger" @click="eliminar_registro_delete()"
          >Eliminar</b-button
        >
      </div>
    </b-modal>

    <b-modal ref="my-modal_show" size="xl" title="Concreto" hide-footer>
      <b-form @submit="formulario()">
        <div class="row">
          <div class="col-md-3 col-sm-12">
            <b-form-group
              id="input-group-1"
              label="Si Aplicar"
              label-for="input-1"
              description="Si Aplica"
            >
              <b-form-radio-group
                id="radio-group"
                v-model="input_si_aplica"
                :aria-describedby="ariaDescribedby"
                name="radio-sub-component_si"
              >
                <b-form-radio value="1">Si</b-form-radio>
                <b-form-radio value="0">No</b-form-radio>
              </b-form-radio-group>
            </b-form-group>
          </div>
          <div class="col-md-3 col-sm-12">
            <b-form-group id="input-group-2" label="Cumplimiento " label-for="input-2">
              <b-form-radio-group
                id="radio-group-4"
                v-model="input_si_cumple"
                :aria-describedby="ariaDescribedby"
                name="radio-sub-component"
              >
                <b-form-radio value="1">Si</b-form-radio>
                <b-form-radio value="0">No</b-form-radio>
              </b-form-radio-group>
            </b-form-group>
          </div>
          <div class="col-md-3 col-sm-12">
            <b-form-group id="input-group-1" label="Fecha" label-for="input-1">
              <b-form-datepicker
                id="datepicker-placeholder"
                placeholder="Choose a date"
                v-model="input_fecha"
              ></b-form-datepicker
            ></b-form-group>
          </div>

          <div class="col-md-3 col-sm-12">
            <b-form-group
              id="input-group-1"
              label="Registro Fotografico"
              label-for="input-1"
              description="Si Aplica"
            >
              <b-form-file
                v-model="input_registro_fotografico"
                id="file-small"
                size="sm"
              ></b-form-file
            ></b-form-group>
          </div>
         <div class="col-md-4 col-sm-12">
            <b-form-group
              id="input-group-1"
              label="Observaciones"
              label-for="input-1"
              description="En caso de ver una noveda o recomendaciones"
            >
              <b-form-textarea
                id="textarea"
                v-model="input_observaciones"
                placeholder="Observaciones"
                rows="3"
                max-rows="6"
              ></b-form-textarea
            ></b-form-group>
          </div>
          <div class="col-md-6 col-sm-12">
          <img width="100%" :src="'/Concreto/'+this.input_registro_fotografico" alt="">

          </div>
        </div>
         <b-button
            variant="success"
            size="lg"
            class="float-right"
            @click="formulario()"
          >
            Guardar
          </b-button>
      </b-form>
    <!--
    <template #modal-footer="{  }">

          <b-button
            variant="success"
            size="lg"
            class="float-right"
            @click="formulario()"
          >
            Guardar
          </b-button>
      </template>
      -->
    </b-modal>
  </div>
</template>

<script type="application/javascript">
import Vue from "vue";


export default {
  components: {
    //  Select2
  },
  props: ["input_Fresado_id"],
  data() {
    return {
      validacion: [],
      editar_dato: false,
      data: [],
      datas: [],
      input_consulta_data: "",
      stickyHeader: true,
      noCollapse: false,
      input_observaciones: "",
      input_registro_fotografico: "",
      input_si_aplica: "",
      input_si_cumple: "",
      input_fecha: "",
      input_AceroDetalles_id: 0,

      fields: [
        {
          key: "Acciones",
          stickyColumn: true,
          label: "Acciones",
          sortable: false,
        },
        { key: "id", sortable: true },
      //  { key: "titulo", sortable: true },
        { key: "si_aplica", sortable: true },
        { key: "si_cumple", sortable: true },
        { key: "fecha", sortable: true },
        { key: "observaciones", sortable: true },
        { key: "registro_fotografico", sortable: true },
        { key: "concreto_id", sortable: true },
      ],

      //input_AceroDetalles_id:[],
      data_foraneo_concreto_id: [],

      consulta_datos: [],
      errors: {},
      mensaje_formulario: "",
      page: 1,
    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
  },
  methods: {
    consulta(page = 1) {
      if (localStorage.getItem("ConcretoDetalles")) {
        try {
          this.items = JSON.parse(localStorage.getItem("ConcretoDetalles"));
        } catch (e) {
          localStorage.removeItem("ConcretoDetalles");
        }
      }

      this.page = page;
      //axios.get("ConcretoDetalles/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios
        .get(`/Api/FresadoDetalle/${this.input_Fresado_id}/consulta_data`)
        .then((response) => {
          this.consulta_datos = response.data;
          const parsed = JSON.stringify(response.data);
          localStorage.setItem("ConcretoDetalles", parsed);
        });
    },

    eliminar_registro(data_id) {
      this.input_AceroDetalles_id = data_id;
    },
    formulario() {

      const formData = new FormData();
      formData.append('id', this.input_AceroDetalles_id);
      formData.append('si_aplica', this.input_si_aplica);
      formData.append('si_cumple', this.input_si_cumple);
      formData.append('fecha', this.input_fecha);
      formData.append('observaciones', this.input_observaciones);
      formData.append('registro_fotografico', this.input_registro_fotografico);



        axios.post(`/Api/FresadoDetalles_update/${this.input_AceroDetalles_id}`, formData,{ headers:{'Content-Type':'multipart/form-data'}})
        //axios.put(`/ConcretoDetalles/${this.input_AceroDetalles_id}`, data)
        .then(
          (response) => {
            const datos = response.data;
            if (response.data.errors) {
              this.$toastr.warning("Verifique los datos", "Verifique los datos");
              this.validacion = response.data.errors;
            }
            if (response.data.id) {
              this.validacion = "";
              this.$toastr.success("Operacio exitosa", "Datos modificados");
              this.consulta();
            //  window.history.back();

            }
          },
          (err) => {
            console.log("Err", err);
            this.$toastr.warning(err, "Error en el servidor");
            this.$toastr.warning(err.message, "Error en el servidor");
          }
        );

    },
    show_registro(data) {

        this.input_si_cumple= data.si_cumple;
        this.input_si_aplica= data.si_aplica;
        this.input_fecha= data.fecha;
        this.input_observaciones= data.observaciones;
        this.input_AceroDetalles_id=data.id
        this.input_registro_fotografico=data.registro_fotografico

      this.$refs["my-modal_show"].show();
    },
    data_foraneo() {},
    eliminar_registro_delete() {
      var data_id = this.input_AceroDetalles_id;
      axios
        .delete(`/Api/ConcretoDetalles/${this.input_AceroDetalles_id}`)
        .then((response) => {
          const data = response.data;
          if (response.data.id) {
            this.validacion = "";
            this.$toastr.info("Operacio exitosa", "Datos Eliminados");
            this.consulta(this.page);
            this.$refs["my-modal"].hide();
          }
        });
    },

    $can(permissionName) {
      return true;

//      return Permissions.indexOf(permissionName) !== -1;
    },
  },
};
</script>
<style>
.minimo {
  min-height: 70px;
  max-width: 170px;
}
</style>
