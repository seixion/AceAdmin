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
        addTab("jqgrid_test_page", "jqgrid测试页面", "admin/user/jqgrid.html");
        resizeWindow();
        $(window).off("resize").on("resize", resizeWindow()).trigger("resize");
    });

    /**
     * 添加一个tab页签
     * @param tabId tab页签的id
     * @param title 标题
     * @param src   链接的页面地址
     */
    function addTab(tabId, title, src) {
        var navTab = $("#navTab");
        var tabContent = $("#tabContent");

        var navTabHtml = $("<li class='active'>" +
        "<a data-toggle='tab' href='#navTab_" + tabId + "'>" +
        "<i class='green ace-icon fa fa-home bigger-120'></i>" + title +
        "</a>" +
        "</li>");
        var tabContentHtml = $("<div id='navTab_" + tabId + "' class='tab-pane active'>" +
        "<iframe src='${path}/" + src + "'></iframe>" +
        "</div>");
        navTab.append(navTabHtml);
        navTabHtml.siblings().removeClass("active");
        tabContent.append(tabContentHtml);
        tabContentHtml.siblings().removeClass("active");
        tabContentHtml.find("iframe").css({height: $(window).height()-155});
    }

    function resizeWindow() {
        var height = $(window).height() - 143;
        $(".tab-content>div").css({height: height}).ace_scroll({size: height});
    }
</script>