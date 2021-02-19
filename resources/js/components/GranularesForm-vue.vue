<template>
<div>
    <div class="row">
        <div class="col-lg-12 ">
            <div class="main-card mb-3 card formulario">
                <div class="card-body">
                    <h1 class="card-title"></h1>
                    <h2> Formulario de granulares </h2>
                    <div class="col-md-12 row">
                        <div class="form-group col-md-12 col-sm-12" style="margin-bottom: 6px;">
                            <button type="submit" @click="formulario()" class="btn btn-primary">Guardar </button>
                            <button v-if="$can('Concreto editar')" @click="formulario(1)" class="btn btn-primary">Guardar y volve </button>

                            <a class="btn btn-warning" @click="cancelar_registro()">Cancelar</a>
                        </div>
                    </div>
                    <div class="col-lg-12">

                        <form ref="form" v-on:submit.prevent="formulario()">
                            <div class="row">
                                <div class="col-md-12 row">
                                    <input type="hidden" v-model="input_Granulares_id">

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Proyecto<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_proyecto" placeholder="proyecto" class="form-control" :class="{ 'is-invalid':this.validacion.proyecto, 'is-valid':!this.validacion.proyecto && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.proyecto" v-bind:key="data.proyecto">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Plano Informe<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_plano_informe" placeholder="plano_informe" class="form-control" :class="{ 'is-invalid':this.validacion.plano_informe, 'is-valid':!this.validacion.plano_informe && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.plano_informe" v-bind:key="data.plano_informe">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Versión<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_version" placeholder="version" class="form-control" :class="{ 'is-invalid':this.validacion.version, 'is-valid':!this.validacion.version && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.version" v-bind:key="data.version">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Calzada<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_calzada" placeholder="calzada" class="form-control" :class="{ 'is-invalid':this.validacion.calzada, 'is-valid':!this.validacion.calzada && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.calzada" v-bind:key="data.calzada">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Actividad pavimento<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_actividad_pavimento" placeholder="actividad_pavimento" class="form-control" :class="{ 'is-invalid':this.validacion.actividad_pavimento, 'is-valid':!this.validacion.actividad_pavimento && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.actividad_pavimento" v-bind:key="data.actividad_pavimento">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Actividad terraplen<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_actividad_terraplen" placeholder="actividad_terraplen" class="form-control" :class="{ 'is-invalid':this.validacion.actividad_terraplen, 'is-valid':!this.validacion.actividad_terraplen && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.actividad_terraplen" v-bind:key="data.actividad_terraplen">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Actividad relleno<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_actividad_relleno" placeholder="actividad_relleno" class="form-control" :class="{ 'is-invalid':this.validacion.actividad_relleno, 'is-valid':!this.validacion.actividad_relleno && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.actividad_relleno" v-bind:key="data.actividad_relleno">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Especifique estrutura<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_especifique_estrutura" placeholder="especifique_estrutura" class="form-control" :class="{ 'is-invalid':this.validacion.especifique_estrutura, 'is-valid':!this.validacion.especifique_estrutura && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.especifique_estrutura" v-bind:key="data.especifique_estrutura">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Unidad Funcional<span class="tx-danger">*</span></label>
                                        <Select2 v-model="input_unidad_funcional_id" :options="data_foraneo_unidad_funcional_id" />
                                        <small id="emailHelp" class="form-text text-muted"></small>

                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.unidad_funcional_id" v-bind:key="data.unidad_funcional_id">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Abcisado de<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_abcisado_de" placeholder="abcisado_de" class="form-control" :class="{ 'is-invalid':this.validacion.abcisado_de, 'is-valid':!this.validacion.abcisado_de && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.abcisado_de" v-bind:key="data.abcisado_de">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Abcisado a<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_abcisado_a" placeholder="abcisado_a" class="form-control" :class="{ 'is-invalid':this.validacion.abcisado_a, 'is-valid':!this.validacion.abcisado_a && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.abcisado_a" v-bind:key="data.abcisado_a">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Latitud<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_latitud" placeholder="latitud" class="form-control" :class="{ 'is-invalid':this.validacion.latitud, 'is-valid':!this.validacion.latitud && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.latitud" v-bind:key="data.latitud">
                                            <b>{{data}}</b>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-3 col-sm-12">
                                        <label for="exampleInputEmail1">Longitud<span class="tx-danger">*</span> </label>
                                        <input type="text" v-model="input_longitud" placeholder="longitud" class="form-control" :class="{ 'is-invalid':this.validacion.longitud, 'is-valid':!this.validacion.longitud && is_enviar  }">
                                        <div class="invalid-feedback" style="display:block" v-for="data in validacion.longitud" v-bind:key="data.longitud">
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
        <div v-if="input_Granulares_id>=1">
            <granularesdetalle-vue :input_Granulares_id="input_Granulares_id"></granularesdetalle-vue>
        </div>

    </div>
</div>
</template>

<script>
import Vue from "vue";

export default {
    components: {

        //   Select2
    },
    data() {

        return {
            is_enviar: false,

            validacion: [],
            editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,

            input_Granulares_id: [],

            input_id: [],
            input_proyecto: [],
            input_plano_informe: [],
            input_version: [],
            input_calzada: [],
            input_actividad_pavimento: [],
            input_actividad_terraplen: [],
            input_actividad_relleno: [],
            input_especifique_estrutura: [],
            input_users_id: [],
            input_unidad_funcional_id: [],
            input_abcisado_de: [],
            input_abcisado_a: [],
            input_latitud: [],
            input_longitud: [],

            data_foraneo_unidad_funcional_id: [],
            consulta_datos: [],
            errors: {},
            mensaje_formulario: "",
            page: 1,

        };
    },
    mounted() {
        //this.consulta();
        this.data_foraneo();
        if (this.$route.params.id > 0) {
            this.show_registro(this.$route.params.id);
        } else {
            this.anadir_registro()
        }
    },
    methods: {

        anadir_registro() {
            this.validacion = "";
            this.editar_dato = false;
            this.limpiar_form();
            this.mensaje_formulario = "Añadir un nuevo registro"
        },

        data_foraneo() {
            axios.get(`${this.$url}/Api/Acero/create`).then(response => {
                this.data_foraneo_unidad_funcional_id = response.data.unidad_funcional_id
            });
        },
        formulario(is_volve = 0) {
            this.is_enviar = true

            const data = {
                id: this.input_Granulares_id,
                id: this.input_id,
                proyecto: this.input_proyecto,
                plano_informe: this.input_plano_informe,
                version: this.input_version,
                calzada: this.input_calzada,
                actividad_pavimento: this.input_actividad_pavimento,
                actividad_terraplen: this.input_actividad_terraplen,
                actividad_relleno: this.input_actividad_relleno,
                especifique_estrutura: this.input_especifique_estrutura,
                users_id: this.input_users_id,
                unidad_funcional_id: this.input_unidad_funcional_id,
                abcisado_de: this.input_abcisado_de,
                abcisado_a: this.input_abcisado_a,
                latitud: this.input_latitud,
                longitud: this.input_longitud,

                //name: this.input_name,
                //email: this.input_email
            };

            if (this.editar_dato == true) {
                axios.put(`${this.$url}/Api/Granulares/${this.input_Granulares_id}`, data)
                    .then(response => {

                            const datos = response.data;
                            if (response.data.errors) {
                                this.$toastr.warning("Verifique los datos", "Verifique los datos");
                                this.validacion = response.data.errors;
                            }
                            if (response.data.id) {
                                this.validacion = "";
                                this.$toastr.success("operaciónn exitosa", "Datos modificados");
                                if (is_volve == 1) {
                                    window.history.back();
                                }
                                this.input_Concreto_id = response.data.id

                                this.show_registro_proceso(response.data)

                            }
                        },
                        (err) => {
                            console.log("Err", err);
                            this.$toastr.warning(err, "Error en el servidor");
                            this.$toastr.warning(err.message, "Error en el servidor");
                        });

            } else {

                axios.post(`${this.$url}/Api/Granulares`, data).then(response => {
                        const datos = response.data;
                        if (response.data.errors) {
                            this.$toastr.warning("Verifique los datos", "Verifique los datos");
                            this.validacion = response.data.errors;
                        }
                        if (response.data.id) {
                            this.validacion = "";
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
        cancelar_registro() {
            window.history.back();
        },
        $can(permissionName) {
            return true;
            return Permissions.indexOf(permissionName) !== -1;
        },
        show_registro(data_id) { //show_registro
            this.validacion = "";
            this.mensaje_formulario = "Editar un registro"

            axios.get(`${this.$url}/Api/Granulares/${data_id}`).then(response => {
                const data = response.data;
                if (!response.data) {
                    this.$toastr.warning("operaciónn no exitosa", "Regitro no obtenido");
                } else {
                    this.$toastr.success("operaciónn exitosa", "Regitro obtenido");
                    this.editar_dato = true;
                    this.input_Granulares_id = data.id
                    this.input_id = data.id;
                    this.input_proyecto = data.proyecto;
                    this.input_plano_informe = data.plano_informe;
                    this.input_version = data.version;
                    this.input_calzada = data.calzada;
                    this.input_actividad_pavimento = data.actividad_pavimento;
                    this.input_actividad_terraplen = data.actividad_terraplen;
                    this.input_actividad_relleno = data.actividad_relleno;
                    this.input_especifique_estrutura = data.especifique_estrutura;
                    this.input_users_id = data.users_id;
                    this.input_unidad_funcional_id = data.unidad_funcional_id;
                    this.input_abcisado_de = data.abcisado_de;
                    this.input_abcisado_a = data.abcisado_a;
                    this.input_latitud = data.latitud;
                    this.input_longitud = data.longitud;

                }
            });
        },
        limpiar_form() {
            this.input_id = '';
            this.input_proyecto = '';
            this.input_plano_informe = '';
            this.input_version = '';
            this.input_calzada = '';
            this.input_actividad_pavimento = '';
            this.input_actividad_terraplen = '';
            this.input_actividad_relleno = '';
            this.input_especifique_estrutura = '';
            this.input_users_id = '';
            this.input_unidad_funcional_id = '';
            this.input_abcisado_de = '';
            this.input_abcisado_a = '';
            this.input_latitud = '';
            this.input_longitud = '';

            this.validacion = "";

        },

    }
};
</script>
