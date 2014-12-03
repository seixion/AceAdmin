<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<#include "common/css.ftl">
</head>
<body class="no-skin">
<#include "navbar.ftl">

<div class="main-container" id="main-container">
    <script type="text/javascript">try {ace.settings.check('main-container', 'fixed')}catch (e){}</script>

    <#-- 左侧菜单 -->
    <#include "sidebar.ftl">

    <#-- 主内容区 -->
    <div class="main-content">
        <#include "main.ftl">
    </div>

    <#include "footer.ftl">
</div>
</body>
</html>
<#include "common/script.ftl">
<script type="text/javascript">

</script>