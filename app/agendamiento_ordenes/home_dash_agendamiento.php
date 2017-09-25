<!DOCTYPE html>
<html> 
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>INTRA-Nielsen | Agendamiento</title>
    
    <link rel="icon" type="image/png" href="../../favicon.ico" />
    
    <link rel="stylesheet" href="../../dist/css/styles.css">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    
    <div class="wrapper">
        <!-- DIV FLOTANTE FRENTE DE PAGINA -->
        <section>
            <div id="capa_modal" class="div_modal" onclick="javascript:cerrar_div_modal()"></div>
            <div id="capa_para_edicion" class="div_contenido"></div>
        </section>
        
        <!-- Encabezado pagina -->
        <?php
            include('../../home_header.php');
        ?>
      
        <!-- Menu Principal -->      
        <aside class="main-sidebar">
            <section class="sidebar">
            <?php
                $id=1;
                include('../../home_menu.php');
            ?>
            </section>
        </aside>

        <!-- Contenido Central de Pagina -->
        <div class="content-wrapper">
            <div id="content-sidebar">
                <?php 
                    $iduser=$_SESSION['iduser'];
                    include('dash_agendamiento.php');
                ?>
            </div>
        </div><!-- /.content-wrapper -->
        
        <!-- Pie de Pagina -->
        <?php 
            include('../../home_footer.php');
        ?>  
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
     
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    
    <!-- Bootstrap 3.3.5 -->
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../../plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/app.min.js"></script>
        
    <script src="../../js/sidebar.js"></script>
    
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
    <script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
    <script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
    
    <script src="../agendamiento_ordenes/ajax.js"></script>
    
    <script>
        $(document).keyup(function(event) {
        if (event.which == 27) {
            $("#capa_modal").hide();
            $("#capa_para_edicion").hide();
            $("#capa_para_edicion").html("");
            }
        });
        
        $(document).ready(function() { 
            var table= $('#tabla_ordenes_agendadas').DataTable({
            dom: 'Bfrtip',
            buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            "autoWidth": false
            });
        })
         
        function cargar_archivo(fdesde,fhasta,usuario){
            try {
                xml = new ActiveXObject("Microsoft.XMLHTTP");
            } catch(expeption) {
                xml = new XMLHttpRequest();
            }
            xml.open("GET",'../../app/agendamiento_ordenes/cargar_base_tabla.php?fdesde=' + fdesde + '&fhasta=' + fhasta + '&usuario=' + usuario, false);
            xml.send(null);
            if(xml.status == 404) alert("Url no valida");
            return xml.responseText;
        }

        function refrescar(usuario) {
            var table= $('#tabla_ordenes_agendadas').DataTable();
            var ruta='../../app/agendamiento_ordenes/base_tabla_agendamientos_'+usuario+'.php';
            var request = $.ajax(ruta,{dataType:'json'});

            request.done(function (resultado) {
            table.clear().draw();
            table.rows.add(resultado.aaData).draw();
            });
        }
    </script>
    
  </body>
</html>
