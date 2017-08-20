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
                    <th>Cliente</th>
                    <th>fecha pedido</th>
                    <th>fecha envio</th>
                    <th>procucto</th>
                    <th>cantidad</th>
                     <th>precio unidad</th>
                    <th>estado</th>
                    <th>total</th>

                </tr>
            </thead>

            <tbody id="cuerpoTabla">
            </tbody>

        </table>

        <script>

            $("#btnConsultar").click(function () {

                $("#cuerpoTabla").empty();
                var filtro = $("#filtro").val();

                var recurso = "http://localhost:8084/WSRestClassic/rest/classicmodel/ordenes/" + filtro;

                $.get(recurso, function (objeto) {

                    if (objeto === null) {
                        alert("No hay datos.");
                        return;
                    }

                    $.each(objeto.order, function (index, rec) {

                        var row = "<tr>";
                        row += "<td>" + rec.numeroOrden + "</td>";
                        row += "<td>" + rec.cliente + "</td>";
                        row += "<td>" + rec.fecha + "</td>";
                        row += "<td>" + rec.fechaEnvio + "</td>";
                        row += "<td>" + rec.producto + "</td>";
                        row += "<td>" + rec.cantidad + "</td>";
                        row += "<td>" + rec.precio_unidad + "</td>";
                        row += "<td>" + rec.estado + "</td>";
                        row += "<td>" + rec.total + "</td>";



                        $("#cuerpoTabla").append(row);

                    });

                });

            });


        </script>


    </body>
</html>
