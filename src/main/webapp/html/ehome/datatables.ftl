<!DOCTYPE html>
<html>
<head>
    <title>数据表格</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<#include "../common/css.ftl">
</head>
<body>
<table id="example" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>age</th>
            <th>sex</th>
        </tr>
    </thead>
</table>
</body>
</html>
<#include "../common/script.ftl">
<script type="text/javascript">
    $('#example').dataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": "/ace/api/user/list.html",
            "type": "POST"
        }
    });
</script>