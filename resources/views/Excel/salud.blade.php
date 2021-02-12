<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    @foreach($users as $user)
        <tr>
            <td>{{ $user->nombre }}</td>
            <td>{{ $user->apellido }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
