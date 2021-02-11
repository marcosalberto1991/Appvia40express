<template>
<div class='container-fluid '>

    <div class="row">


        <div v-if="respuesta_enviada==true">
        <b-alert show variant="success">
        <h1 class="alert-heading">Gracias Por llenar la encuesta de salud</h1>
        </b-alert>
        </div>
        <div v-if="validacion_cedula==false" class='card col-md-offset-3 col-md-12 col-sm-12'>

            <div class="col-md-3"></div>
            <div class=" col-md-6">

            <h1 class=''> Encuesta de Salud </h1>
            <b-form v-on:submit.prevent="buscar_cedula()">
                <b-form-group id="input-group-1" label="Cedula:" label-for="input-1" description="Ingrese tu cedula">
                    <b-form-input id="input-1" v-model="input_cedula" type="number" required>
                    </b-form-input>
                </b-form-group>

                <b-form-group id="input-group-1" label="" label-for="input-1">

                    <b-button type="submit" variant="primary">Ingresar</b-button>

                </b-form-group>
            </b-form>
            </div>
        </div>
        <div class="col-md-12" v-if="validacion_cedula==true">
                <div class="card contenido ">
                    <div class="perfil"><b> Nombre: </b> {{ perfil_usuario.nombre }}</div>
                    <div class="perfil"><b> Apellido: </b> {{ perfil_usuario.apellido  }}</div>
                </div>
            <b-form v-on:submit.prevent="enviarrespuesta()">
                <span v-for="(data,index) in lista_preguntas" v-bind:key="data.id">

                <div class="card contenido"  :class="{ 'valid':data.respuesta==null }" >

                    <b-row>
                        <div class="col-md-7 col-sm-11">
                            <p class="lista-preguntas">{{ data.nombre }}</p>
                        </div>
                        <span v-if="data.is_titulo!=1">

                        <div class="col-md-2 col-sm-2 lista-preguntas">
                            <b-form-radio-group v-model="lista_preguntas[index].respuesta" :options="options" required size="lg" buttons name="radio-validation">
                            </b-form-radio-group>
                        </div>
                        <div class="col-md-2 col-sm-2 lista-preguntas">Respuesta: {{ data.respuesta }}</div>
                    </span>
                    </b-row>
                </div>
                </span>
                <div class="form-group col-md-12 col-sm-12 text-center">
                    <button type="submit"  class="btn btn-primary">Enviar Encuesta </button>

                </div>

            </b-form>
        </div>
    </div>

    <div class='row'>

    </div>

</div>
</template>

<script>
import Vue from "vue";

export default {
    components: {

        //  Select2
    },
    data() {

        return {
            validacion_cedula: false,
            validacion_respuesta: false,
            respuesta_enviada:false,
            lista_preguntas: [],
            perfil_usuario: [],
            validacion: [],
            input_cedula: '',
            editar_dato: false,
            data: [],
            datas: [],
            input_consulta_data: "",
            stickyHeader: true,
            noCollapse: false,

            options: [{
                    text: 'SI',
                    value: 'SI'
                },
                {
                    text: 'NO',
                    value: 'NO'
                },
            ],

            //input_Encuesta_Salud_id:[],

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
            if (localStorage.getItem("Encuesta_Salud")) {
                try {
                    this.items = JSON.parse(localStorage.getItem("Encuesta_Salud"));
                } catch (e) {
                    localStorage.removeItem("Encuesta_Salud");
                }
            }

            this.page = page;
            //axios.get("Encuesta_Salud/consulta?page=" +page+"&consulta_data="+this.input_consulta_data)
            axios.get(`/Api/Encuesta_Salud/obtener_preguntas`)
                .then(response => {
                    this.lista_preguntas = response.data;
                });
        },
        formulario() {

        },
        enviarrespuesta() {
            //event.preventDefault()
            var permitir = true;
            let registros = this.lista_preguntas;
            this.validacion_respuesta=true;
            registros.forEach(registro => {
                if (registro.respuesta == null || registro.titulo != 1  ) {
                    this.$toastr.warning("Favor vefirica bien las respuesta", "Falta algunas respuesta");
                    permitir = false;
                    //break;
                }
            });
        if(permitir==true){
         this.enviar_encuesta();
        }
        //for(this.lista_preguntas)
            //alert(JSON.stringify(this.form))
        },
        enviar_encuesta(){
            const data = {
                cedula: this.perfil_usuario,
                lista_preguntas: this.lista_preguntas
            }
            axios.post(`/Api/Encuesta_Salud/enviar_respuesta`, data)
                .then(response => {
                    if (response.data) {
                        this.validacion_cedula=false;
                        //this.perfil_usuario = response.data;
                        //this.validacion_cedula = true
                        this.$toastr.success("Operacio exitosa", "Datos modificados");
                    } else {
                        this.$toastr.warning("Favor vefirica", "");
                    }
                }, (err) => {
                    console.log("Err", err);
                    this.$toastr.warning(err, "Error en el servidor");
                    this.$toastr.warning(err.message, "Error en el servidor");
                });

        },
        formulario() {
            const data = {
                cedula: this.input_cedula
            }
            axios.post(`/Api/Encuesta_Salud/buscar_cedula`, data)
                .then(response => {
                    if (response.data.id) {
                        this.perfil_usuario = response.data;
                        this.validacion_cedula = true
                        this.respuesta_enviada = true
                        this.$toastr.success("Operacio exitosa", "Datos modificados");
                    } else {
                        this.$toastr.warning("Favor vefirica bien la cedula", "Datos no encontrado");
                    }
                }, (err) => {
                    console.log("Err", err);
                    this.$toastr.warning(err, "Error en el servidor");
                    this.$toastr.warning(err.message, "Error en el servidor");
                });

        },
        buscar_cedula() {
            const data = {
                cedula: this.input_cedula
            }
            axios.post(`/Api/Encuesta_Salud/buscar_cedula`, data)
                .then(response => {
                    if (response.data.id) {
                        this.perfil_usuario = response.data;
                        this.validacion_cedula = true
                        this.$toastr.success("Operacio exitosa", "Datos modificados");
                    } else {
                        this.$toastr.warning("Favor vefirica bien la cedula", "Datos no encontrado");
                    }
                }, (err) => {
                    console.log("Err", err);
                    this.$toastr.warning(err, "Error en el servidor");
                    this.$toastr.warning(err.message, "Error en el servidor");
                });

        },

        data_foraneo() {

        },

    }
};
</script>

<style>
.lista-preguntas {
    font-size: 25px;
    margin: 10px;
}

.contenido {
    margin-bottom: 15px;

}
.perfil{
margin: 5px;
padding: 5px;
}
.valid{
background-color: rgba(4, 250, 66, 0.089)
}
</style>
