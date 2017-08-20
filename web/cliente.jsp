<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="comun.jsp"/>
    </head>
    <body>

        <div>Clientes</div>

        <form>
            <label>Filtro Nombre Cliente</label>
            <input type="text" name="filtro" id="filtro" />
            <input type="button" value="Consultar" id="btnConsultar" />
        </form>

        <table border="2">

            <thead>
                <tr>
                    <th>id</th>
                    <th>Nombre Comercial</th>
                    <th>Telefono</th>
                    <th>Pais</th>
                    <th>Credito</th>

                </tr>
            </thead>

            <tbody id="cuerpoTabla">
            </tbody>

        </table>

        <script>

            $("#btnConsultar").click(function () {

                $("#cuerpoTabla").empty();
                var filtro = $("#filtro").val();

                var recurso = "http://localhost:8084/WSRestClassic/rest/classicmodel/customers/" + filtro;

                $.get(recurso, function (objeto) {

                    if (objeto === null) {
                        alert("No hay datos.");
                        return;
                    }

                    $.each(objeto.customers, function (index, rec) {

                        var row = "<tr>";
                        row += "<td>" + rec.id + "</td>";
                        row += "<td>" + rec.nombreComercial + "</td>";
                        row += "<td>" + rec.telefono + "</td>";
                        row += "<td>" + rec.pais + "</td>";
                        row += "<td>" + rec.creditLimit + "</td>";



                        $("#cuerpoTabla").append(row);

                    });

                });

            });


        </script>


    </body>
</html>
