<html>
    <head>
        <style>
            /** Define the margins of your page **/
            @page {
                margin: 0cm 0cm;
            }
            body {
                margin-top: 130px;
                margin-left: 30px;
                margin-right: 30px;
                margin-bottom: 150px;
                _font-family: cen
            }
            header img {
                _margin-top: 70px;
            }
            .espacio-5{
                margin-top: 7px;
                margin-bottom: 7px;
            }
            header {
                position: fixed;
                top: 20px;
                left: 0cm;
                right: 0cm;
                height: 100px;
                text-align: center;
            }
            .espacio{
                margin-top: 50px;
            }
            footer {
                position: fixed;
                bottom: 0cm;
                left: 0cm;
                right: 0cm;
                height: 150px;
                _background-color: #03a9f4;
                _color: white;
                text-align: center;
                _line-height: 1.5cm;
            }
            .col-md-4 {
                position: relative;
                width: 100%;
            }
            .col2 {

            background: grey;
            border: 1px solid #000;
            width: 25%;
            }
            .row {
                _display: flex;
                _flex-wrap: wrap;
            }
            .menu{text-align: right;}
            .caja {
                float:left;
                padding: 5px;
                border: 1px solid #000;
                font-size: 11px;
             }
             .table-espacio{
                margin-top: 10px;
                font-weight: bold;
             }
             .table-espacio-5{
                margin-top: 5px;
             }
             .titulo-naranja{
             }
             .color_naranja span{
                 font-size: 13px;
            }
             .verticalText {
                writing-mode: vertical-lr;
                transform: rotate(270deg);

            }
            .table-100{
                width:100%;
            }

        </style>

    </head>

    <header>

        <img style="margin-left: 5px;margin-top: 10px" align="center"
        src="{{ url('/formato_concreto.png') }}"

        width="90%" height="30%">
        <?php
        //dd(asset('formato_concreto.png'));
      //  exit();
        ?>
        <table  border="0" align="center"     style="width:780px; margin-left: 30px;  font-size: 10px">
            <tr>
                <td >UNIDAD FUNCIONAL:</td><td><u>{{Cache::get('unidad_funcional_id')}}</u></td>
                <td>CALZADA:</td>   <td>{{Cache::get('calzada')}}</td>
                <td></td>           <td></td>
                <td></td>           <td style="width:30px" ></td>
            </tr>
            <tr>
                <td>ESTRUCTURA:</td> <td>{{Cache::get('estrutura')}}</td>
                <td>ELEMENTO:</td> <td>{{Cache::get('elemento')}}</td>
                <td></td> <td></td>
                <td></td> <td></td>
            </tr>
            <tr>
                <td>PLANO CÓDIGO No.</td> <td>{{Cache::get('plano_codigo')}}</td>
                <td>VERSIÓN:</td> <td>{{Cache::get('version')}}</td>
                <td>RESISTENCIA CONCRETO:</td> <td> {{Cache::get('resistencia_concreto')}}</td>
                <td></td> <td ></td>
            </tr>

        </table>
    </header>


    <body>
        <footer>
            <!--
            <div class="text-center"><br>
              ___________________________________________________________________________________
            <br>
            Diagonal 8 No. 32-36 Barrio/Blanco Girardot-Cundinamarca
            <br>
            TEL: 8887452 - CEL: 317 5262303 - 3115571381
            <br>
            <span style="color: #fd7e14">
            maswer@hotmail.com - marocdd@edyconst.com.co
            </span>

        </div>
    -->
        </footer>

        <main>

        <table class="" cellspacing="0" style="padding:0px;margin:0px;width: 100%;font-size: 8px"  cellpadding="0"  border="1">

            <tr align="center" style="padding:0px;margin:2px;">

                <td width="100" rowspan="2" colspan="2"  style="text-align:center;color:#000000">
                    ACTIVIDAD
                </td>
                <td style="width:10px;" colspan="2">APLICA</td>
                <td style="width:10px;" colspan="2">CUMPLE</td>
                <td style="width:50px;">FECHA</td>
                <td style="width:120px;" rowspan="2">OBSERVACIONES</td>
                <td style="width:120px;" rowspan="2">REGISTRO FOTOGRÁFICO</td>


            </tr>

            <tr align="center">

                <td style="width:15px;">SI</td>
                <td style="width:15px;">NO</td>
                <td style="width:20px;">SI</td>
                <td style="width:20px;">NO</td>
                <td>DD/MM/AAAA</td>


            </tr>
            <?php
            //$d=true
            $conteo=0
            ?>
            @foreach($data['concretoDetalleAll'] as $datas)
            <tr align="center">

                @if($conteo==0)
                    <td style="width: 20px" rowspan="8"><p class="verticalText">PRELIMINARES</p></td>
                @endif
                @if($conteo==8)
                    <td style="width: 20px" rowspan="4"><p class="verticalText">POST FUNDIDA</p></td>
                @endif
            <?php
            //$d=false;
            $conteo++
            ?>

                <td align="justify"><?php echo $datas['titulo'] ?></td>
                <td>{{ $datas['si_aplica']==1? 'SI':''  }}</td>
                <td>{{ $datas['si_aplica']==0? 'NO':''  }}</td>
                <td>{{ $datas['si_cumple']==1? 'SI':''  }}</td>
                <td>{{ $datas['si_cumple']==0? 'SI':''  }}</td>
                <td>{{ $datas['fecha'] }}</td>
                <td>{{ $datas['observaciones'] }}</td>
                <td>

                    <img style="margin: 1px" align="center" src="/Concreto/<?php echo $datas['registro_fotografico']?>"  width="90px" height="90px"/>
                </td>

            </tr>
            @endforeach

            <br>


        </table>













            <br>




        </main>

    </body>
</html>
