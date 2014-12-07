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
    $(document).ready(function () {
        for (var i = 0; i < 1; i++) {
            addTab("jqgrid_test_page_" + i, "jqgrid测试页面", "admin/user/jqgrid.html");
        }
        resizeWindow();
        $(window).off("resize").on("resize", resizeWindow()).trigger("resize");
    });

    function resizeWindow() {
        var height = $(window).height() - 140;
        $(".tab-content>div").css({height: height}).ace_scroll({size: height});
    }
</script>