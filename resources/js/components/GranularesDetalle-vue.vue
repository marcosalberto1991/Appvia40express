<template>
<div class="">
    <div class="row" v-if="show_reporte_final==false">
        <div class="col-lg-12" id="my_link">
            <div class="main-card mb-12 card">
                <div class="card-header">
                    PRELIMINARES
                    <div class="btn-actions-pane-right">
                        <div role="group" class="btn-group-sm btn-group">

                        </div>
                    </div>
                </div>
                <div class="table-responsive table-responsive-sm">


                    <table class="table table-borderless table-striped table-hover">
                        <thead>
                            <tr>

                                <th>Item</th>
                                <th>Aplica</th>
                                <th>Abscisado Inicial</th>
                                <th>Abscisado Final</th>
                                <th>Supervisado</th>
                                <th>fecha</th>
                                <th class="espacio" >Observaciones</th>
                                <th>Registro Fotografico</th>
                            </tr>
                        </thead>
                        <tbody class="" v-for="(inf,num) in consulta_datos" v-bind:key="inf.id">
                            <tr  class="capa_id">
                                <td>{{ (consulta_datos[num].nombre) }}</td>
                                <td>
                                    <input v-on:change="formulario_capa(consulta_datos[num])" v-if="consulta_datos[num].si_subrasante==0" type="text" class="form-control"  v-model="consulta_datos[num].capa_n">
                                </td>
                                <td v-if="consulta_datos[num].si_subrasante==0" >Material </td>
                                <td>
                                <b-form-select v-if="consulta_datos[num].si_subrasante==0"  v-model="consulta_datos[num].material" :options="opcion_material"></b-form-select>
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr v-for="(data,ns) in inf.granulares_detalle_all" v-bind:key="data.id" class="card-text">



                                <td v-html="consulta_datos[num].granulares_detalle_all[ns].item"></td>
                                <td v-on:change="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])">
                                    <b-form-radio-group v-model="consulta_datos[num].granulares_detalle_all[ns].si_aplica" :options="options" :class="options.class" button-variant="outline-primary" required size="md" buttons>
                                    </b-form-radio-group>
                                </td>
                                <td v-on:change="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])" >
                                    <input type="text"  v-model="consulta_datos[num].granulares_detalle_all[ns].abcisado_inicial" placeholder="" class="form-control width200">

                                 </td>

                                <td v-on:change="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])">
                                    <input type="text" v-model="consulta_datos[num].granulares_detalle_all[ns].abcisado_final" placeholder="" class="form-control width200">


                                <td v-on:change="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])">
                                <b-form-radio-group v-model="consulta_datos[num].granulares_detalle_all[ns].si_supervisado" :options="options" :class="options.class" button-variant="outline-primary" required size="md" buttons>
                                    </b-form-radio-group>
                                </td>
                                <!--
                                    <td>{{ consulta_datos[num].granulares_detalle_all[ns].fecha }}  </td>
                                        -->
                                <td class="text-center" style="min-width: 350px;">
                                    <b-form-datepicker @input="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])" v-model="consulta_datos[num].granulares_detalle_all[ns].fecha">
                                    </b-form-datepicker>

                                </td>
                                <td class="width300"  v-on:change="formulario_guarda(consulta_datos[num].granulares_detalle_all[ns])">
                                    <b-form-textarea class="width300" id="textarea" v-model="consulta_datos[num].granulares_detalle_all[ns].observaciones" placeholder="" rows="2" max-rows="8"></b-form-textarea>
                                </td>

                                   <td class="minimo" v-on:change="subir_imagen(consulta_datos[num].granulares_detalle_all[ns])">
                                    <b-form-file type="file" ref="files" accept=".jpg, .png, .gif" v-model="consulta_datos[num].granulares_detalle_all[ns].foto" size="sm"></b-form-file>
                                    <span v-for="foto in  consulta_datos[num].granulares_detalle_all[ns].registro_fotografico_all"  v-bind:key="foto.id">
                                        <div v-b-modal.moda-foto @click='show_imagen(foto.fotografia)' >
                                            <img height="60px" width="60px" :src="$url+'/Appvia40express/Concreto_file/'+foto.fotografia" alt="">
                                        </div>
                                     </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-block text-center card-footer">
                    <button @click="nueva_capa()" class="btn-wide btn btn-info">Añadir una nueva capa</button>
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
                     <table class="table  table-borderless table-striped table-hover" >
                        <thead>
                            <tr>

                                <th>Item</th>
                                <th>Aplica</th>
                                <th>Abscisado Inicial</th>
                                <th>Abscisado Final</th>
                                <th>Supervisado</th>
                                <th>fecha</th>
                                <th>Observaciones</th>
                                <th>Registro Fotografico</th>
                            </tr>
                        </thead>
                        <tbody v-for="(inf,num) in consulta_datos" v-bind:key="inf.id">
                            <tr  class="capa_id">
                                <td><b>{{ (consulta_datos[num].nombre) }}</b></td>
                                <td >
                                <b>
                                {{ consulta_datos[num].capa_n }}
                                </b>
                                </td>
                                <td v-if="consulta_datos[num].si_subrasante==0" >Material </td>
                                <td colspan=2>
                                    <b>
                                    {{ consulta_datos[num].material }}
                                    </b>
                                </td>

                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr v-for="(data,ns) in inf.granulares_detalle_all" v-bind:key="data.id" class="">
                                <td v-html="consulta_datos[num].granulares_detalle_all[ns].item"></td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].si_aplica }} </td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].abcisado_inicial }} </td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].abcisado_final }} </td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].si_supervisado }} </td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].fecha }} </td>
                                <td>{{ consulta_datos[num].granulares_detalle_all[ns].observaciones }} </td>
                                <td>
                                    <span v-for="foto in  consulta_datos[num].granulares_detalle_all[ns].registro_fotografico_all"  v-bind:key="foto.id">
                                        <img height="50px" width="50px" :src="$url+'/Appvia40express/Concreto_file/'+foto.fotografia" alt="">
                                     </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-block text-center card-footer">

                    <button @click="show_reporte_final_(false)" v-if="$can('Concreto editar')" class="btn-wide btn btn-info">Volver</button>
                    <button @click="enviar_reporte_final()" v-if="$can('Concreto editar')" class="btn-wide btn btn-success">Enviar el Reporte final</button>

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
    <b-modal id="moda-show-foto" ref="my-modal-foto" size="xl" hide-footer>
        <template slot="modal-title">Registro fotografico </template>
        <div class="d-block text-center">
        <img height="100%" width="100%" :src="$url+'/Appvia40express/Concreto_file/'+show_foto" alt="">




        </div>
    </b-modal>

</div>
</template>

<script>
import Vue from "vue";

export default {
    components: {
        //  Select2
    },
    props: ["input_Granulares_id"],
    data() {
        return {
            validacion: [],
            show_foto: '',
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
            input_ConcretoDetalles_id: 0,
            data_id_subir: 0,
            opcion_material:[
                {text:'Relleno',value: 'Relleno'},
                {text:'SBG - Subbase Granular',value: 'SBG - Subbase Granular'},
                {text:'BG - Base Granular',value: 'BG - Base Granular'}
                ],

            options: [{
                    text: 'SI',
                    value: 1,
                    class: 'success'
                },
                {
                    text: 'NO',
                    value: 0,
                    class: 'info'
                },
            ],



            //input_ConcretoDetalles_id:[],
            data_foraneo_concreto_id: [],

            consulta_datos: [

            ],
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
        if (this.$can('Concreto editar') == false) {
            this.show_reporte_final = true
        }

    },
    methods: {
        consulta(page = 1) {
            axios
                .get(`${this.$url}/Api/GranularesDetalle/${this.input_Granulares_id}/consulta_data`)
                .then((response) => {
                    this.consulta_datos = response.data;
                    const parsed = JSON.stringify(response.data);
                    localStorage.setItem("ConcretoDetalles", parsed);
                });
        },
        eliminar_registro(data_id) {
            this.input_ConcretoDetalles_id = data_id;
        },
        nueva_capa() {
            axios
                .get(`${this.$url}/Api/GranularesDetalle/${this.input_Granulares_id}/nueva_capa`)
                .then((response) => {
                    this.consulta();
                });
        },
        formulario_capa(data_capa){
            const data = {
                material: data_capa.material,
                capa_n: data_capa.capa_n
            }
            axios.post(`${this.$url}/Api/TipoCapa/${data_capa.id}`,data)
                .then(
                    (response) => {
                        //const datos = response.data;
                        this.$toastr.success("operación exitosa", "Datos modificados");

                    },
                    (err) => {
                        console.log("Err", err);
                        this.$toastr.warning(err, "Error en el servidor");
                        this.$toastr.warning(err.message, "Error en el servidor");
                    }
                );





        },
        enviar_reporte_final() {
            const data = {
                id: this.input_Granulares_id
            }

            axios.post(`${this.$url}/Api/Granulares/reporte_final`, data)
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
            formData.append('abcisado_inicial', data.abcisado_inicial);
            formData.append('abcisado_final', data.abcisado_final);

            formData.append('si_supervisado', data.si_supervisado);
            formData.append('fecha', data.fecha);

            formData.append('observaciones', data.observaciones);

            axios.post(`${this.$url}/Api/GranularesDetalles_update/${data.id}`, formData, {
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

            //this.files = this.$refs.files.files;
            //console.info(this.files);

            console.info(data)
            let formData = new FormData();

            //for( var i = 0; i < this.$refs.file.files.length; i++ ){
            //    let file = this.$refs.file.files[i];
            //    formData.append('files[' + i + ']', file);
            //}

            formData.append('granulares_id', this.input_Granulares_id);
            formData.append('granulares_detalle_id', data.id);
            formData.append('foto', data.foto);

            axios.post(`${this.$url}/Api/GranularesRegistroFotografico`, formData, {
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
            formData.append('id', this.input_ConcretoDetalles_id);
            formData.append('si_aplica', this.input_si_aplica);
            formData.append('si_cumple', this.input_si_cumple);
            formData.append('fecha', this.input_fecha);
            formData.append('observaciones', this.input_observaciones);
            //formData.append('registro_fotografico', this.input_registro_fotografico);

            axios.post(`${this.$url}/Api/ConcretoDetalles_update/${this.input_ConcretoDetalles_id}`, formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                })
                //axios.put(`/ConcretoDetalles/${this.input_ConcretoDetalles_id}`, data)
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

            this.input_si_cumple = data.si_cumple;
            this.input_si_aplica = data.si_aplica;
            this.input_fecha = data.fecha;
            this.input_observaciones = data.observaciones;
            this.input_ConcretoDetalles_id = data.id
            //this.input_registro_fotografico = data.registro_fotografico

            this.$refs["my-modal_show"].show();
        },
        data_foraneo() {},
        /*
        eliminar_registro_delete() {
            var data_id = this.input_ConcretoDetalles_id;
            axios
                .delete(`${this.$url}/Api/ConcretoDetalles/${this.input_ConcretoDetalles_id}`)
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
        */

        $can(permissionName) {
            //return true;
            return Permissions.indexOf(permissionName) !== -1;
        },
        show_reporte_final_(bool) {
            this.show_reporte_final = bool
            window.scrollTo(0, 500);
        },
        show_imagen(foto){
            this.show_foto=foto;
            this.$refs['moda-show-foto'].show()

        },
        imagenes_eliminar(id) {
            if (confirm("¿desea eliminar la imagen?")) {

                axios
                    .delete(`${this.$url}/Api/GranularesRegistroFotografico/${id}`)
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

.cards-texts {
    height_: 42px;
    overflow-x: scroll;
    width: 80%;
}

.cards-text__ p {
    width: 650px;
    word-break: break-word;
}
.containerscro_ {
  __height: 80px;
  __width: 70%;
  overflow-x: auto;
  overflow-y: hidden;
  white-space: nowrap;
}
.containerd{
    overflow-x: auto;
    white-space: nowrap;
}
.espacio{

}
.width200{
width: 200px;
}
.width300{
width: 300px;
}
.tabless {
    display: block;
    overflow-x: auto;
    white-space: nowrap;
}
.tabless tbody {
    display: table;
    width: 100%;
}
.capa_id{
    background-color: #adb5bd!important;
    color: #e9ecef!important;
    max-height: 20px;
}
.capa_id tr td{
    padding: 1px;
    margin: 1px;
}

</style>
