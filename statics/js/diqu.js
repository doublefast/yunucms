function diqu(layer, form, box) {
    var diqu = $(box),
        linkage_check = function (obj) {
            var checked = obj.closest('li').find('input:checkbox:checked');
            if (!obj.is(':checked') && checked.length) {
                //子集元素存在选中 但没有全部选中 添加some类 显示为小正方形
                obj.closest('.diqu_checkbox').addClass('layui-form-checked-some');
                return true;
            }
        },
        init = function () {
            var ul3 = diqu.find('ul ul ul');
            ul3.each(function(index, el) {
                var t = $(el);
                if (!$(el).children().length) {
                    t.addClass('no-child');
                }
            });
            diqu.find('input:checkbox').not(ul3.find('input:checkbox'))
            .attr('diqu-linkage', 1)
            .each(function(index, el) {
                linkage_check($(el));
            });
        }
    //checkbox事件
    $('.diqu_checkbox input[type="checkbox"]').on('click', function () {
        var t = $(this);
        if (t.attr('diqu-linkage')) {
            if (t.is(':checked')) {
                if (t.closest('.diqu_checkbox').hasClass('layui-form-checked-some')) {
                    t.closest('li').find('input:checkbox').removeProp('checked')
                    .closest('.diqu_checkbox').removeClass('layui-form-checked-some');
                } else {
                    t.closest('li').find('input:checkbox').prop('checked', true)
                    .closest('.diqu_checkbox').removeClass('layui-form-checked-some');
                }
            } else {
                if (!linkage_check(t)) {
                    t.closest('li').find('input:checkbox').removeProp('checked')
                    .closest('.diqu_checkbox').removeClass('layui-form-checked-some');
                }
            }
        }
    });
    //防止选框超出
    $(box+'>ul>li>ul>li').on('mouseenter', function () {
        var t = $(this),
            popup = t.children('ul');
        if (!popup.length) {
            t.addClass('no-child').off('mouseenter');
            return;
        }
        if (diqu.outerWidth(true) - (t.position().left+popup.outerWidth(true)) < 20) {
            popup.addClass('diqu_popup_r');
        }else{
            popup.removeClass('diqu_popup_r');
        }
    });

    //所有元素初始化
    init();
}

// 地区全选
var area_select = (function  () {
    var area_select_all = false;
    return function  (obj) {
        $('.diqu_select').on('click', function () {
            if (!area_select_all) {
                $('.layui-form-checked-some').removeClass('layui-form-checked-some');
            }
            obj.prop('checked', area_select_all = !area_select_all);
        });
    }
})();
