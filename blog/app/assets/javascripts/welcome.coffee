$ ->
  $("#btn-report").click ->
    dateSelect = $("#dateFilter").val();
    if (dateSelect != "")
      request = $.get '/report?filter=' + dateSelect      
    else
        alert "Debe seleccionar una fecha para el reporte"