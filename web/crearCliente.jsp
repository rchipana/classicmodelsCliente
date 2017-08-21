<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <jsp:include page="comun.jsp"/>
  </head>
  <body>
    <h1>RETIRO</h1>
    <form id="form1">
      
      
      
      <fieldset>
        <legend>Datos del Cliente</legend>
        
        <label>Cliente </label>
        <input type="text" name="nombre" /> <br/>
        
        <label>Primer Nombre: </label>
        <input type="text" name="priNombre" /> <br/>
        
        <label>Segundo Nombre: </label>
        <input type="text" name="segNombre" /> <br/>
        
        <label>Telefono: </label>
        <input type="text" name="fono" /> <br/>
        
        <label>Direccion: </label>
        <input type="text" name="direccion" /> <br/>
        
        <label>ciudad: </label>
        <input type="text" name="ciudad" /> <br/>
        
        <label>pais: </label>
        <input type="text" name="pais" /> <br/>
        
        <input type="button" value="Procesar" id="btnProcesar"/>
        
      </fieldset>
    
      
    </form>
    
    <script>
      
      $("#btnProcesar").click( function() { 

        var data = $("#form1").serialize();
        var recurso = "http://localhost:8084/WSRestClassic/rest/classicmodel/creaCustomer";
        
        $.post(recurso, data, function( objeto ){
          
          alert( objeto.texto );
          
        });
  
      });
      
    </script>
  </body>
</html>
