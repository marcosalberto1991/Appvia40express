<template>
<div class='container-fluid '>

    <div class="row">


        <div class="col-md-12"  v-if="respuesta_enviada==true">
        <b-alert show variant="success">
        <h1 class="alert-heading">Gracias por diligenciar la encuesta de salud</h1>
        </b-alert>
        </div>
        <div class="col-md-3" >
        </div>
        <div v-if="validacion_cedula==false" class='card  col-md-offset-3 col-md-6 col-sm-12'>

            <div class="">

            <h1 class=''>  </h1>
            <b-form v-on:submit.prevent="buscar_cedula()">
            <br>
                <b-form-group id="input-group-1" label="" label-for="input-1" description="Ingrese su numero de identificación">
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

                    <div class="perfil"><h4> Bienvenido: </h4> </div>
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


                        <div class="col-md-2 col-sm-2 lista-preguntas">
                            <b-form-radio-group v-model="lista_preguntas[index].respuesta" :options="options" :class="options.class"         button-variant="outline-primary"
 required size="lg" buttons name="radio-validation">
                            </b-form-radio-group>
                        </div>
                        <div class="col-md-2 col-sm-2 lista-preguntas">Respuesta: {{ data.respuesta }}</div>

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
    <br>
    <div class="card">
    <h3 class="perfil"> Habeas Data
</h3>
<p class="perfil">
De acuerdo con la Ley 1581 de 2012 y sus decretos reglamentarios, con la firma de este documento, autorizo expresamente a VÍA 40 EXPRESS S.A.S. para conservar los datos personales solicitados en el presente documento. La información será utilizada para  el cumplimiento de las obligaciones derivadas del Contrato de Concesión, entre las cuales, se encuentran la de remitir información a la entidad contratante, interventoría, autoridades de vigilancia y control, efectuar encuestas de satisfacción a través de medios telefónicos, para evaluar los servicios ofrecidos por VÍA 40 EXPRESS, entre otras; así como realizar las demás actividades de mercadeo, estadística y administración que requiera VÍA 40 EXPRESS S.A.S.

 </p>
 <p class="perfil">

Entiendo que mis derechos como titular de la información serán aquellos establecidos en el artículo 8 de la Ley 1581 de 2012, y podrán ser ejercidos a través de los medios o canales dispuestos por VÍA 40 EXPRESS que pueden ser consultados en la página web www.via40express.com. Manifiesto que la presente autorización me fue solicitada y puesta de presente antes de entregar mis datos y que la suscribo de forma libre y voluntaria una vez leída en su totalidad.
</p>
<p class="text-center" >
<img :src=" this.$url+'/img/logo.png'" alt="">
</p>

    </div>
    <br>
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
                    value: 'SI',
                    class:'success'
                },
                {
                    text: 'NO',
                    value: 'NO',
                    class:'info'
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
            axios.get(`${this.$url}/Api/Encuesta_Salud/obtener_preguntas`)
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
                if (registro.respuesta == null || registro.respuesta == ''  ) {
                    this.$toastr.warning("Favor vefirica bien las respuesta", "Falta algunas respuesta");
                    permitir = false;
                    //break;
                }
            });
        if(permitir==true){
         this.enviar_encuesta();
        }

        },
        enviar_encuesta(){
            const data = {
                cedula: this.perfil_usuario,
                lista_preguntas: this.lista_preguntas
            }
            axios.post(`${this.$url}/Api/Encuesta_Salud/enviar_respuesta`, data)
                .then(response => {
                    if (response.data) {
                        this.validacion_cedula=false;
                        this.respuesta_enviada = true;
                        consulta();
                        this.$toastr.success("operación exitosa", "Datos modificados");
                        scroll(0, 0);
                    } else {
                        this.$toastr.warning("Favor vefirica", "");
                    }
                }, (err) => {
                    console.log("Err", err);
                    this.$toastr.warning(err, "Error en el servidor");
                    this.$toastr.warning(err.message, "Error en el servidor");
                });
            scroll(0, 0);

        },
        formulario() {
            const data = {
                cedula: this.input_cedula
            }
            axios.post(`${this.$url}/Api/Encuesta_Salud/buscar_cedula`, data)
                .then(response => {
                    if (response.data.perfil) {
                        this.perfil_usuario = response.data;
                        this.validacion_cedula = true
                        this.$toastr.success("operación exitosa", "Datos modificados");
                    } else {
                        this.$toastr.warning("Favor vefirica bien la cedula", "Datos no encontrado");
                    }
                    if(response.data.perfil==null ||response.data.perfil==''){
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
            axios.post(`${this.$url}/Api/Encuesta_Salud/buscar_cedula`, data)
                .then(response => {
                    if (response.data.perfil.id) {
                        this.perfil_usuario = response.data.perfil;
                        this.lista_preguntas = response.data.preguntas;
                        this.validacion_cedula = true
                        this.$toastr.success("operación exitosa", "Datos modificados");
                    } else {
                        if(response.data.encuesta_dia==false){
                        this.$toastr.warning("Tu numero de documento no esta registrado en la base de datos de Via 40 Express", "");
                        }
                    }
                    if(response.data.perfil.length==0 && response.data.encuesta_dia==false){
                        this.$toastr.warning("Tu numero de documento no esta registrado en la base de datos de Via 40 Express", "");
                    }
                    if(response.data.encuesta_dia){
                        this.$toastr.info( "¡Si presentas síntomas después de haber diligenciado la encuesta comunícate con el área SST!","Tu encuesta ya fue diligenciada el día de hoy. ");
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
