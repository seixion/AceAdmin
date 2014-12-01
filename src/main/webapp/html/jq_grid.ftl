<!DOCTYPE html>
<html>
<head>
    <title>数据表格(jqGrid)</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<#include "common/css.ftl">
</head>
<body class="no-skin">
<div class="main-container">
    <div class="main-content">
        <div class="page-content">
            <div class="page-content-area">
                <div class="row">
                    <div class="col-xs-12">
                        <table id="example"></table>
                        <div id="pager"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<#include "common/script.ftl">
<script type="text/javascript">
    $(window).triggerHandler('resize.jqGrid');
    $(document).ready(function () {
        var jqGrid = $("#example");
        //resize to fit page size
        $(window).on('resize.jqGrid', function () {
            $("#example").jqGrid('setGridWidth', $(".page-content").width());
        });

        //resize on sidebar collapse/expand
        var parent_column = $("#example").closest('[class*="col-"]');
        $(document).on('settings.ace.jqGrid', function (ev, event_name, collapsed) {
            if (event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed') {
                //setTimeout is for webkit only to give time for DOM changes and then redraw!!!
                setTimeout(function () {
                    $("#example").jqGrid('setGridWidth', parent_column.width());
                }, 0);
            }
        });

        jqGrid.jqGrid({
            caption: "jqGrid数据表格",
            url: "/ace/admin/api/user/list.html",
            datatype: "json",
            colNames: ["标识", "姓名", "年龄", "性别"],
            colModel: [
                {name: 'id', index: 'id', width: 150, fixed: true},
                {name: 'name', index: 'name', width: 280},
                {name: 'age', index: 'age', width: 55},
                {name: 'sex', index: 'sex', width: 55}
            ],
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: "#pager",
            altRows: true,
            sortname: "id",
            sortorder: "desc",
            height: "330",
            multiselect: true,
            multiboxonly: true,     // 只能选中一个
            loadComplete : function() {
                var table = this;
                setTimeout(function(){
                    updatePagerIcons(table);
//                    enableTooltips(table);
                }, 0);
            }

        });

        $(window).triggerHandler('resize.jqGrid');

        /** 左下角工具按钮 **/
        jqGrid.jqGrid('navGrid', "#pager",
                { 	//navbar options
                    edit: true,
                    editicon : 'ace-icon fa fa-pencil blue',
                    add: true,
                    addicon : 'ace-icon fa fa-plus-circle purple',
                    del: true,
                    delicon : 'ace-icon fa fa-trash-o red',
                    search: true,
                    searchicon : 'ace-icon fa fa-search orange',
                    refresh: true,
                    refreshicon : 'ace-icon fa fa-refresh green',
                    view: true,
                    viewicon : 'ace-icon fa fa-search-plus grey'
                },
                {
                    //new record form
                    //width: 700,
                    closeAfterAdd: true,
                    recreateForm: true,
                    viewPagerButtons: false,
                    beforeShowForm : function(e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
                                .wrapInner('<div class="widget-header" />');
                        style_edit_form(form);
                    }
                },
                {
                    //edit record form
                    closeAfterEdit: true,
                    width: 700,
                    recreateForm: true,
                    beforeShowForm : function(e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
                        style_edit_form(form);
                    }
                },
                {
                    //delete record form
                    recreateForm: true,
                    beforeShowForm : function(e) {
                        var form = $(e[0]);
                        if(form.data('styled')) return false;

                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />');
                        style_delete_form(form);

                        form.data('styled', true);
                    },
                    onClick : function(e) {
                        alert(1);
                    }
                },
                {
                    //search form
                    recreateForm: true,
                    afterShowSearch: function(e){
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />');
                        style_search_form(form);
                    },
                    afterRedraw: function(){
                        style_search_filters($(this));
                    }
                    ,
                    multipleSearch: true,
                    /**
                     multipleGroup:true,
                     showQuery: true
                     */
                },
                {
                    //view record form
                    recreateForm: true,
                    beforeShowForm: function(e){
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                    }
                }
        );

    });

    function style_edit_form(form) {
        //enable datepicker on "sdate" field and switches for "stock" field
        form.find('input[name=sdate]').datepicker({format: 'yyyy-mm-dd', autoclose: true})
                .end().find('input[name=stock]')
                .addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
        //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
        //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

        //update buttons classes
        var buttons = form.next().find('.EditButton .fm-button');
        buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
        buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
        buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>');

        buttons = form.next().find('.navButton a');
        buttons.find('.ui-icon').hide();
        buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
        buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');
    }

    function style_delete_form(form) {
        var buttons = form.next().find('.EditButton .fm-button');
        buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
        buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
        buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
    }

    function style_search_filters(form) {
        form.find('.delete-rule').val('X');
        form.find('.add-rule').addClass('btn btn-xs btn-primary');
        form.find('.add-group').addClass('btn btn-xs btn-success');
        form.find('.delete-group').addClass('btn btn-xs btn-danger');
    }
    function style_search_form(form) {
        var dialog = form.closest('.ui-jqdialog');
        var buttons = dialog.find('.EditTable');
        buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
        buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
        buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
    }

    function updatePagerIcons(table) {
        var replacement =
        {
            'ui-icon-seek-first': 'ace-icon fa fa-angle-double-left bigger-140',
            'ui-icon-seek-prev': 'ace-icon fa fa-angle-left bigger-140',
            'ui-icon-seek-next': 'ace-icon fa fa-angle-right bigger-140',
            'ui-icon-seek-end': 'ace-icon fa fa-angle-double-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({container: 'body'});
        $(table).find('.ui-pg-div').tooltip({container: 'body'});
    }
</script>