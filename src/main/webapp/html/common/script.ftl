<#escape x as x?html>
<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${path}/assets/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='${path}/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${path}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="${path}/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="${path}/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="${path}/assets/js/jquery-ui.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/jquery.easypiechart.min.js"></script>
<script src="${path}/assets/js/jquery.sparkline.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="${path}/assets/js/chosen.jquery.min.js"></script>
<script src="${path}/assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="${path}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${path}/assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="${path}/assets/js/date-time/moment.min.js"></script>
<script src="${path}/assets/js/date-time/daterangepicker.min.js"></script>
<script src="${path}/assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
<script src="${path}/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="${path}/assets/js/jquery.knob.min.js"></script>
<script src="${path}/assets/js/jquery.autosize.min.js"></script>
<script src="${path}/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script src="${path}/assets/js/jquery.maskedinput.min.js"></script>
<script src="${path}/assets/js/bootstrap-tag.min.js"></script>
<script src="${path}/assets/js/typeahead.jquery.min.js"></script>
<script src="${path}/assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="${path}/assets/js/jquery.validate.min.js"></script>
<script src="${path}/assets/js/additional-methods.min.js"></script>
<script src="${path}/assets/js/bootbox.min.js"></script>
<script src="${path}/assets/js/select2.min.js"></script>
<script src="${path}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${path}/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>

<!-- ace scripts -->
<script src="${path}/assets/js/ace-elements.min.js"></script>
<script src="${path}/assets/js/ace.min.js"></script>

<script src="${path}/assets/util/data-util.min.js"></script>
</#escape>