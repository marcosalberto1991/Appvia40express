<table>
    <thead>
    <tr>
        <th>reporte final de salud</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>

    @foreach($users as $perfil)
        <tr>
            <td></td>
            <td>Nombre</td>
            <td>{{ $perfil['nombre'] }}</td>
            <td>Apellido</td>
            <td>{{ $perfil['apellido'] }}</td>
            <td>Sexo</td>
            <td>{{ $perfil['sexo'] }}</td>
            <td>Area</td>
            <td>{{ $perfil['area'] }}</td>
            <td>Cargo</td>
            <td>{{ $perfil['cargo'] }}</td>
            <td>Fecha</td>
            <td>{{ $perfil['fecha_nacimiento'] }}</td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td></td>
            <td></td>
            @foreach ($perfil['fecha'] as $da)
            <td>{{ $da->fecha  }}</td>

            @endforeach

        </tr>



        @foreach ($perfil['preguntas'] as $da)
        <tr>
            <td>{{ $da['nombre'] }}</td>
<td></td>
            @foreach ($da['resultado'] as $re)
                <td>{{ $re['respuesta'] }}</td>
            @endforeach


        </tr>
            @endforeach






    @endforeach
    </tbody>
</table>
