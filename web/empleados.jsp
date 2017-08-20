<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="comun.jsp"/>
    </head>
    <body>

        <div>Empleados</div>

        <form>
            <label>Filtro</label>
            <input type="text" name="filtro" id="filtro" />
            <input type="button" value="Consultar" id="btnConsultar" />
        </form>

        <table border="2">

            <thead>
                <tr>
                    <th>id</th>
                    <th>Primer Nombre</th>
                    <th>Segundo Nombre</th>
                    <th>Email</th>
                    <th>Puesto</th>

                </tr>
            </thead>

            <tbody id="cuerpoTabla">
            </tbody>

        </table>

        <script>

            $("#btnConsultar").click(function () {

                $("#cuerpoTabla").empty();
                var filtro = $("#filtro").val();

                var recurso = "http://localhost:8084/WSRestClassic/rest/classicmodel/employees/" + filtro;

                $.get(recurso, function (objeto) {

                    if (objeto === null) {
                        alert("No hay datos.");
                        return;
                    }

                    $.each(objeto.employees, function (index, rec) {

                        var row = "<tr>";
                        row += "<td>" + rec.employeeNumber + "</td>";
                        row += "<td>" + rec.firstName + "</td>";
                        row += "<td>" + rec.lastName + "</td>";
                        row += "<td>" + rec.email + "</td>";
                        row += "<td>" + rec.jobTitle + "</td>";



                        $("#cuerpoTabla").append(row);

                    });

                });

            });


        </script>


    </body>
</html>
