<table>
    <thead>
    <tr>
            <td>ID</td>
            <td>Nombre</td>
            <td>Apellido</td>
            <td>Sexo</td>
            <td>Area</td>
            <td>Cargo</td>
            <td>Fecha Nacimiento</td>
            <td>Fecha de formulario</td>

        @foreach($preguntas as $pe)
<td>
{{ $pe['nombre'] }}
</td>
        @endforeach

    </tr>
    </thead>
    <tbody>

        @foreach($data as $perfil)
            <tr>
                <td>{{ $perfil['perfil_salud_id'] }}</td>
                <td>{{ $perfil['perfil_salud']['nombre'] }}</td>
                <td>{{ $perfil['perfil_salud']['apellido'] }}</td>
                <td>{{ $perfil['perfil_salud']['sexo'] }}</td>
                <td>{{ $perfil['perfil_salud']['area'] }}</td>
                <td>{{ $perfil['perfil_salud']['cargo'] }}</td>
                <td>{{ $perfil['perfil_salud']['fecha_nacimiento'] }}</td>
                <td>{{ $perfil['fecha'] }}</td>
        @foreach($perfil['respuesta'] as $re)
                <td>{{ $re['respuesta'] }}</td>
        @endforeach


            </tr>
        @endforeach

    </tbody>
</table>
