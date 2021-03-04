<template>
  <div class="">
    <div class="row" v-if="show_reporte_final==false">
      <div class="col-lg-12" id="my_link">
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
                  <th>Registro Fotografico</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(data,index) in consulta_datos" v-bind:key="data.id">
                                <td class="text-left minimo" v-html="data.actividad.substr(0, 50)"></td>
                                <td style="min-width: 150px;" v-on:change="formulario_guarda(consulta_datos[index])">
                                    <div v-if="data.si_aplica == '0'">
                                        <div class="badge badge-warning">No</div>
                                    </div>
                                    <div v-if="data.si_aplica == '1'">
                                        <div class="badge badge-success">Si</div>
                                    </div>
                                    <div v-if="data.si_aplica == '3'">
                                        <div class="badge badge-info">Indefinido</div>
                                    </div>

                                    <b-form-group :value="consulta_datos[index].si_aplica" label="" label-for="input-1" description="Si Aplica">
                                        <b-form-radio-group :id="'radio-group'+consulta_datos[index]" v-model="consulta_datos[index].si_aplica" name="radio-sub-component_si">
                                            <b-form-radio value="1">Si</b-form-radio>
                                            <b-form-radio value="0">No</b-form-radio>
                                        </b-form-radio-group>
                                    </b-form-group>

                                </td>
                                <td style="min-width: 150px;" v-on:change="formulario_guarda(consulta_datos[index])">
                                    <div v-if="data.si_cumple == '0'">
                                        <div class="badge badge-warning">No</div>
                                    </div>
                                    <div v-if="data.si_cumple == '1'">
                                        <div class="badge badge-success">Si</div>
                                    </div>
                                    <div v-if="data.si_cumple == '3'">
                                        <div class="badge badge-info">Indefinido</div>
                                    </div>

                                    <b-form-group :value="consulta_datos[index].si_cumple" label="" label-for="input-1" description="Si Aplica">
                                        <b-form-radio-group :id="'radio-group'+consulta_datos[index]  " v-model="consulta_datos[index].si_cumple" name="radio-sub-component_si">
                                            <b-form-radio value="1">Si</b-form-radio>
                                            <b-form-radio value="0">No</b-form-radio>
                                        </b-form-radio-group>
                                    </b-form-group>

                                </td>

                                <td class="text-center" style="min-width: 350px;">
                                    <b-form-datepicker @input="formulario_guarda(consulta_datos[index])"  v-model="data.fecha">
                                    </b-form-datepicker>
                                </td>
                                <td v-on:change="formulario_guarda(consulta_datos[index])">
                                    <b-form-textarea id="textarea" v-model="consulta_datos[index].observaciones" placeholder="Observaciones" rows="3" max-rows="6"></b-form-textarea>

                                </td>
                                <td class="minimo" v-on:change="subir_imagen(consulta_datos[index])">
                                    <b-form-file type="file" ref="files" accept=".jpg, .png, .gif" v-model="consulta_datos[index].registro_fotografico" size="sm"></b-form-file>
                                    <!--
                                    <a class="btn btn-info" @click="subir_imagen(consulta_datos[index])" >subir </a>
                                -->
                                </td>
                                <td>

                                    <span v-for="imagen in data.fresado_registro_fotografico_all" v-bind:key="imagen.id">
                                        <div class="  card" style="width: 20rem; margin-bottom: 10px;">
                                            <img :src="$url+'/Appvia40express/Concreto_file/'+imagen.nombre" alt="">
                                            <a v-on:click="imagenes_eliminar(imagen.id)" href="#" class="btn  btn-danger btn-sm">Eliminar </a>

                                        </div>
                                    </span>

                                </td>
                            </tr>
              </tbody>
            </table>
          </div>
          <div class="d-block text-center card-footer">
                <button @click="show_reporte_final_(true)" class="btn-wide btn btn-success">Ver reporte final</button>

          </div>
        </div>
        <br />
        <div class="main-card mb-3 card">
          <div class="card-body">
             <h5 class="">Recomendaciones y mejoras</h5>
                <div class="col-12">
                Si desea una mejorar o si presenta una falla favor enviar un mensaje al 316 464 7944
                <br /><br />
            </div>

          </div>
        </div>
      </div>
    </div>

    <div v-if="show_reporte_final==true" class="row">
        <div class="col-lg-12" id="my_link">
            <div class="main-card mb-12 card">
                <div class="card-header">
                    Reporte final
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
                    <table class="align-middle mb-0 table table-borderless table-striped table-hover">
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
                            <tr v-for="(data,index) in consulta_datos" v-bind:key="data.id">
                                <td class="text-left minimo" v-html="data.actividad.substr(0, 50)"></td>
                                <td style="min-width: 150px;">
                                    <div v-if="data.si_aplica == '0'">
                                        <div class="badge badge-warning">No</div>
                                    </div>
                                    <div v-if="data.si_aplica == '1'">
                                        <div class="badge badge-success">Si</div>
                                    </div>
                                    <div v-if="data.si_aplica == '3'">
                                        <div class="badge badge-info">Indefinido</div>
                                    </div>

                                </td>
                                <td style="min-width: 150px;">
                                    <div v-if="data.si_cumple == '0'">
                                        <div class="badge badge-warning">No</div>
                                    </div>
                                    <div v-if="data.si_cumple == '1'">
                                        <div class="badge badge-success">Si</div>
                                    </div>
                                    <div v-if="data.si_cumple == '3'">
                                        <div class="badge badge-info">Indefinido</div>
                                    </div>

                                </td>

                                <td class="text-center">
                                    {{ data.fecha}}
                                </td>
                                <td v-on:change="formulario_guarda(consulta_datos[index])">
                                    {{ data.observaciones }}
                                </td>

                                <td style="overflow-x: auto">
                                    <div style="float: right; overflow-x: auto;" v-for="imagen in data.fresado_registro_fotografico_all" v-bind:key="imagen.id">

                                            <img :src="'data:imagen/jpg;base64,'+imagen.file" height="100px" />
                                        <img style="float: right;overflow-x: auto;" height="100px" :src="$url+'/Appvia40express/Concreto_file/'+imagen.nombre" alt="">
                                    </div>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-block text-center card-footer">
                    <button @click="show_reporte_final_(false)" v-if="$can('Fresado editar')" class="btn-wide btn btn-success">Volver</button>
                    <button @click="enviar_reporte_final()" v-if="$can('Fresado editar')" class="btn-wide btn btn-success">Enviar el Reporte final</button>
                </div>
            </div>
            <br />

        </div>
    </div>

    <b-modal id="moda-eliminar" ref="my-modal" size="xl" hide-footer>
      <template slot="modal-title">Eliminar un Registro </template>
      <div class="d-block text-center">
        <h3>¿Desea eliminar el registro permanente?</h3>
                    <b-button class="mt-3 btn btn-danger" @click="eliminar_registro_delete()">Eliminar</b-button>

      </div>
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
      show_reporte_final: false,
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
      data_id_subir: 0,

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
      data_foraneo_fresado_id: [],

      consulta_datos: [],
      errors: {},
      mensaje_formulario: "",
      page: 1,
       files: [],
            imagen: [],
            items: {
                si_cumple: []
            }
    };
  },
  mounted() {
    this.consulta();
    this.data_foraneo();
    if(this.$can('fresado editar')==false){
            this.show_reporte_final= true
    }
  },
  methods: {
    consulta(page = 1) {
      if (localStorage.getItem("fresadodetalles")) {
        try {
          this.items = JSON.parse(localStorage.getItem("fresadodetalles"));
        } catch (e) {
          localStorage.removeItem("fresadodetalles");
        }
      }

      this.page = page;
      //axios.get("ConcretoDetalles/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
      axios
        .get(`${this.$url}/Api/FresadoDetalle/${this.input_Fresado_id}/consulta_data`)
        .then((response) => {
          this.consulta_datos = response.data;
          const parsed = JSON.stringify(response.data);
          localStorage.setItem("fresadodetalles", parsed);
        });
    },

    eliminar_registro(data_id) {
      this.input_AceroDetalles_id = data_id;
    },
    enviar_reporte_final() {
            const data = {
                id: this.input_Fresado_id
            }

            axios.post(`${this.$url}/Api/Fresado/reporte_final`, data)
                .then(
                    (response) => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
                            this.$toastr.success("operación exitosa", "Datos modificados");
                            //this.consulta();
                            window.history.back();
                        }
                    },
                    (err) => {
                        console.log("Err", err);
                        this.$toastr.warning(err, "Error en el servidor");
                        this.$toastr.warning(err.message, "Error en el servidor");
                    }
                );

        },
        formulario_guarda(data) {
            const formData = new FormData();
            formData.append('id', data.id);
            formData.append('si_aplica', data.si_aplica);
            formData.append('si_cumple', data.si_cumple);
            formData.append('fecha', data.fecha);
            formData.append('observaciones', data.observaciones);
            formData.append('registro_fotografico', data.registro_fotografico);

            axios.post(`${this.$url}/Api/FresadoDetalles_update/${data.id}`, formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                .then(
                    (response) => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data) {
                            this.validacion = "";
                            this.consulta_datos = response.data
                            this.$toastr.success("operación exitosa", "Datos modificados");
                            this.consulta();
                            t

                        }
                    },
                    (err) => {
                        console.log("Err", err);
                        this.$toastr.warning(err, "Error en el servidor");
                        this.$toastr.warning(err.message, "Error en el servidor");
                    }
                );

        },

        subir_imagen(data) {

            this.files = this.$refs.files.files;
            console.info(this.files);

            console.info(data)
            let formData = new FormData();
            formData.append('fresado_detalle_id', data.id);
            formData.append('nombre', data.registro_fotografico);

            axios.post(`${this.$url}/Api/FresadoRegistroFotografico`, formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                .then(
                    (response) => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
                            this.$toastr.success("operación exitosa", "Datos modificados");
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
    formulario() {

      const formData = new FormData();
      formData.append('id', this.input_AceroDetalles_id);
      formData.append('si_aplica', this.input_si_aplica);
      formData.append('si_cumple', this.input_si_cumple);
      formData.append('fecha', this.input_fecha);
      formData.append('observaciones', this.input_observaciones);
      formData.append('registro_fotografico', this.input_registro_fotografico);



        axios.post(`${this.$url}/Api/FresadoDetalles_update/${this.input_AceroDetalles_id}`, formData,{ headers:{'Content-Type':'multipart/form-data'}})
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
              this.$toastr.success("operación exitosa", "Datos modificados");
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
        .delete(`${this.$url}/Api/FresadoDetalles/${this.input_AceroDetalles_id}`)
        .then((response) => {
          const data = response.data;
          if (response.data.id) {
            this.validacion = "";
            this.$toastr.info("operación exitosa", "Datos Eliminados");
            this.consulta(this.page);
            this.$refs["my-modal"].hide();
          }
        });
    },

    $can(permissionName) {
      return Permissions.indexOf(permissionName) !== -1;
    },
     show_reporte_final_(bool) {
            this.show_reporte_final = bool
            window.scrollTo(0, 500);
        },
         imagenes_eliminar(id) {
            if (confirm("¿desea eliminar la imagen?")) {

                axios
                    .delete(`${this.$url}/Api/FresadoRegistroFotografico/${id}`)
                    .then((response) => {
                        const data = response.data;
                        if (response.data.id) {
                            //this.validacion = "";
                            this.$toastr.info("operación exitosa", "Datos Eliminados");
                            this.consulta();
                            //this.$refs["my-modal"].hide();
                        }
                    });
            }

        }
  },
};
</script>
<style>
.minimo {
  min-height: 70px;
  max-width: 170px;
}
</style>
