//jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
jQuery.easing.jswing=jQuery.easing.swing;jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(e,f,a,h,g){return jQuery.easing[jQuery.easing.def](e,f,a,h,g)},easeInQuad:function(e,f,a,h,g){return h*(f/=g)*f+a},easeOutQuad:function(e,f,a,h,g){return -h*(f/=g)*(f-2)+a},easeInOutQuad:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f+a}return -h/2*((--f)*(f-2)-1)+a},easeInCubic:function(e,f,a,h,g){return h*(f/=g)*f*f+a},easeOutCubic:function(e,f,a,h,g){return h*((f=f/g-1)*f*f+1)+a},easeInOutCubic:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f+a}return h/2*((f-=2)*f*f+2)+a},easeInQuart:function(e,f,a,h,g){return h*(f/=g)*f*f*f+a},easeOutQuart:function(e,f,a,h,g){return -h*((f=f/g-1)*f*f*f-1)+a},easeInOutQuart:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f+a}return -h/2*((f-=2)*f*f*f-2)+a},easeInQuint:function(e,f,a,h,g){return h*(f/=g)*f*f*f*f+a},easeOutQuint:function(e,f,a,h,g){return h*((f=f/g-1)*f*f*f*f+1)+a},easeInOutQuint:function(e,f,a,h,g){if((f/=g/2)<1){return h/2*f*f*f*f*f+a}return h/2*((f-=2)*f*f*f*f+2)+a},easeInSine:function(e,f,a,h,g){return -h*Math.cos(f/g*(Math.PI/2))+h+a},easeOutSine:function(e,f,a,h,g){return h*Math.sin(f/g*(Math.PI/2))+a},easeInOutSine:function(e,f,a,h,g){return -h/2*(Math.cos(Math.PI*f/g)-1)+a},easeInExpo:function(e,f,a,h,g){return(f==0)?a:h*Math.pow(2,10*(f/g-1))+a},easeOutExpo:function(e,f,a,h,g){return(f==g)?a+h:h*(-Math.pow(2,-10*f/g)+1)+a},easeInOutExpo:function(e,f,a,h,g){if(f==0){return a}if(f==g){return a+h}if((f/=g/2)<1){return h/2*Math.pow(2,10*(f-1))+a}return h/2*(-Math.pow(2,-10*--f)+2)+a},easeInCirc:function(e,f,a,h,g){return -h*(Math.sqrt(1-(f/=g)*f)-1)+a},easeOutCirc:function(e,f,a,h,g){return h*Math.sqrt(1-(f=f/g-1)*f)+a},easeInOutCirc:function(e,f,a,h,g){if((f/=g/2)<1){return -h/2*(Math.sqrt(1-f*f)-1)+a}return h/2*(Math.sqrt(1-(f-=2)*f)+1)+a},easeInElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return -(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e},easeOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k)==1){return e+l}if(!j){j=k*0.3}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}return g*Math.pow(2,-10*h)*Math.sin((h*k-i)*(2*Math.PI)/j)+l+e},easeInOutElastic:function(f,h,e,l,k){var i=1.70158;var j=0;var g=l;if(h==0){return e}if((h/=k/2)==2){return e+l}if(!j){j=k*(0.3*1.5)}if(g<Math.abs(l)){g=l;var i=j/4}else{var i=j/(2*Math.PI)*Math.asin(l/g)}if(h<1){return -0.5*(g*Math.pow(2,10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j))+e}return g*Math.pow(2,-10*(h-=1))*Math.sin((h*k-i)*(2*Math.PI)/j)*0.5+l+e},easeInBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*(f/=h)*f*((g+1)*f-g)+a},easeOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}return i*((f=f/h-1)*f*((g+1)*f+g)+1)+a},easeInOutBack:function(e,f,a,i,h,g){if(g==undefined){g=1.70158}if((f/=h/2)<1){return i/2*(f*f*(((g*=(1.525))+1)*f-g))+a}return i/2*((f-=2)*f*(((g*=(1.525))+1)*f+g)+2)+a},easeInBounce:function(e,f,a,h,g){return h-jQuery.easing.easeOutBounce(e,g-f,0,h,g)+a},easeOutBounce:function(e,f,a,h,g){if((f/=g)<(1/2.75)){return h*(7.5625*f*f)+a}else{if(f<(2/2.75)){return h*(7.5625*(f-=(1.5/2.75))*f+0.75)+a}else{if(f<(2.5/2.75)){return h*(7.5625*(f-=(2.25/2.75))*f+0.9375)+a}else{return h*(7.5625*(f-=(2.625/2.75))*f+0.984375)+a}}}},easeInOutBounce:function(e,f,a,h,g){if(f<g/2){return jQuery.easing.easeInBounce(e,f*2,0,h,g)*0.5+a}return jQuery.easing.easeOutBounce(e,f*2-g,0,h,g)*0.5+h*0.5+a}});

//方法库
var mk = {
    init : function (){
        var json = arguments[0]?arguments[0]:{};
        if (json.imgAuto) {
            $('img').each(function () {
                var t = $(this);
                if(t.attr('img-Auto')){
                    t.attr('img-Auto')=='cover'?t.imgAuto('cover'):t.imgAuto();
                }
            });
        }
        if (json.scrollTop) mk.scrollTop();
        if (json.last) {
            $('.last').each(function () {
                $(this).children().last().css('margin-right', 0);
            });
        }
        return this;
    },
    name : function (val) {
        return !val.match(/^[\u4e00-\u9fa5|]*$/) || val.length > 4 || val == ''?false:true;
    },
    phone : function (val) {
        return !val.match(/^1(3|4|5|7|8)\d{9}$/)?false:true;
    },
    email : function (val) {
        var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        return !pattern.test(val)?false:true;
    },
    number : function (val) {
        return val.match(/\D/g,'') || val == ''?false:true;
    },
    //半透明遮罩 opcity为透明度(可选参数) 范围0~1 默认值为0.5
    mask : function (opcity, oc) {
        var obj = $('#mask');
        if (!obj.length) {
            $('body').append('<div id="mask" style="position: fixed;top: 0;bottom: 0;left: 0;right: 0;z-index:99999;margin: auto;background: #000;display: none;"></div>');
            obj = $('#mask');
            obj.fadeTo(500, opcity||.5);
            if (oc) {
                obj.click(function () {
                    mk.mask(opcity);
                })
            };
        }else{
            if (obj.is(":hidden")) {
                obj.stop(true,true).fadeTo(500, opcity||.5);
            }else{
                obj.stop(true,true).fadeOut();
            }
        };
        return this;
    },
    //获取GET参数
    urlGet : function (name){
        var arr = window.location.href.split('/');
        var index = $.inArray(name, arr);
        return arr[index+1];
    },
    //锚点跳转滑动效果
    /*
    使用方法
    aScroll(80) 参数代表top偏移量 单位px
    */
    aScroll : function (top) {
         $("a[href^='#']").click(function() {
            var $target = $(this.hash);
            if ($(this.hash).length) {
                $('html,body').animate({
                    scrollTop: $target.offset().top - top||0
                });
                return false;
            };
        });
        return this;
    },
    //延迟加载
    lazyLoad : function (obj, move){
        obj.each(function(i){
            var t = $(this);
            if (typeof t.attr('data-src')=='undefined' && typeof move=='undefined') {
                mk.lazyLoad(obj.not(t), move);
                return false;
            };
            t.show = function () {
                var top = $(window).height() + $(window).scrollTop();
                if ( top > (t.offset().top - (parseInt(t.css('top'))||0) ) ) {
                    //回调函数型
                    if (typeof move == 'function') {
                        move.call(t);
                    //文字运动显示型
                    }else if (move) {
                        t.animate({
                            top : 0,
                            left : 0
                        }, parseInt(t.attr('timer'))||2000, function(){

                        });
                    //图片延迟加载
                    }else{
                        t.attr('src', t.attr('data-src')).removeAttr('data-src');
                    };
                    $(window).unbind('scroll',t.show);
                }else{
                    return false;
                };
            };
            if (t.show() === false) {
                $(window).bind('scroll', t.show);
            }else{
                setTimeout(function () {
                    mk.lazyLoad(obj.not(t), move);
                });
                return false;
            }
        });
        return this;
    },
    /*使用方法
    var throttled = mk.letter(function () {})
    $(window).scroll(throttled);
    */
    letter : function (fn) {
        if (typeof arguments[0] != 'function') return;
        fn();
        var times = typeof arguments[1] != 'number'?300:arguments[1];
        var timer = null;
        var st = new Date().getTime();
        return function () {
            var et = new Date().getTime();
            if (et - st < times) {
                clearTimeout(timer);
                timer = setTimeout(function () {
                    //return fn.apply(this,arguments);
                    fn();
                }, times);
            } else{
                clearTimeout(timer);
                st = et;
                fn();
            };
        };
    },
    isPC : function () {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
                    "SymbianOS", "Windows Phone",
                    "iPad", "iPod"];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    },
    css3 : (function () {
        var div = document.createElement('div'),
        vendors = 'Ms O Moz Webkit'.split(' ');
        return function(prop) {
            var len = vendors.length;
            if (typeof (prop) != 'string') return false;
            if ( prop in div.style ) return true;
            prop = prop.replace(/^[a-z]/, function(val) {
                return val.toUpperCase();
            });
            while(len--) {
                if ( vendors[len] + prop in div.style ) {
                    return true;
                }
            }
            return false;
        };
    })(),
    css3_3d : function () {
        var docElement = document.documentElement;
        var support = mk.css3('perspective');
        var body = document.body;
        if(support && 'webkitPerspective' in docElement.style){
            var style = document.createElement('style');
            style.type = 'text/css';
            style.innerHTML = '@media (transform-3d),(-webkit-transform-3d){#css3_3d_test{left:9px;position:absolute;height:3px;}}';
            body.appendChild(style);
            var div = document.createElement('div');
            div.id = 'css3_3d_test';
            body.appendChild(div);
            support = div.offsetLeft === 9 && div.offsetHeight === 3;
        }
        mk.css3_3d = function () {
            return support;
        }
        return support;
    },
    scale: function (obj, scale) {
        obj.each(function () {
            var t = $(this);
            t.height(t.width()/scale);
            $(window).resize(function () {
                t.height(t.width()/scale);
            });
        });
    }
};
//常用滚动
/*按钮样式代码
.banner_btn {width: 100%;height: 16px;position: absolute;left: 0;bottom: 20px;z-index: 99;text-align: center;}
.banner_btn a {display: inline-block;*display: inline;*zoom: 1;width: 12px;height: 12px;border: 2px solid #fff;margin: 0 8px;border-radius: 8px;-moz-border-radius: 8px;-webkit-border-radius: 8px;opacity: 0.4;filter: alpha(opacity=40);-ms-filter: progid:DXImageTransform.Microsoft.Alpha(opacity=(40));-moz-transition: all 0.4s ease 0s;-webkit-transition: all 0.4s ease 0s;-o-transition: all 0.4s ease 0s;transition: all all 0.4s ease 0s;}
.banner_btn a:hover,.banner_btn a.in {background: #fff;opacity: 1;filter: alpha(opacity=100);-ms-filter: progid:DXImageTransform.Microsoft.Alpha(opacity=(100));}

.banner_l,.banner_r {position: absolute;display: block;top: 50%;margin-top: -14px;border-style: solid;border-width: 28px;cursor: pointer;}
.banner_l {left: 50px;border-color: transparent #fff transparent transparent;}
.banner_r {right: 50px;border-color: transparent transparent transparent #fff;}

//scss添加以下代码
.banner_btn {
    width: 100%;
    height: 16px;
    position: absolute;
    left: 0;
    bottom: 20px;
    z-index: 99;
    text-align: center;
    a {
        @extend .inline-block;
        @include opacity(.4);
        width: 12px;
        height: 12px;
        border: 2px solid #fff;
        border-radius: 8px;
        margin: 0 8px;
        transition: opacity .2s,background .2s;
        &:hover,&.in {
            @include opacity(1);
            background: #fff;
        }
    }
}
*/
$.fn.roll = function () {
    var t = this,
        json = arguments[0]?arguments[0]:{};
    if (typeof json.num != 'number') json.num = 1;
    if (typeof json.timer != 'number') json.timer = 5000;
    if (typeof json.speed != 'number') json.speed = 400;
    if (typeof json.easing != 'string') json.easing = 'swing';
    if (typeof json.timing != 'string') json.timing = 'ease-out';
    if (typeof json.adaptive === 'undefined') json.adaptive = true;
    if (typeof json.center === 'undefined') json.center = true;

    var oUl = t.find('ul'),
        oLi = oUl.find('li'),
        oLL = oLi.length,
        oW = oLi.outerWidth(true),
        banner_l = json.lbtn || t.find('.btn_l'),
        banner_r = json.rbtn || t.find('.btn_r'),
        btn = t.find('.banner_btn').find('a'),
        oIndex = -oLL,
        timer = null,
        moveIn = false,
        outer = false,
        sx = 0,
        ex = 0,
        downTime = 0,
        _l = 0,
        css3d = mk.css3_3d(),
        move,banner_btn,banner_btn_span,suspend,_w,cw,dcenter,bresize,
        translate3d = function () {
            return 'translate3d('+ oW * oIndex +'px, 0px, 0px)';
        },
        toleft = function () {
            return oW * oIndex;
        };

    t.roll_stop = function () {
        clearInterval(timer);
    }
    t.roll_start = function (bl) {
        if (bl) {
            moveIn = false;
        };
        clearInterval(timer);
        timer = setInterval(function(){
            move('-');
        }, json.timer);
    }

    oUl.html( oUl.html() + oUl.html() + oUl.html() );
    oLi = oUl.find('li');
    oLL = oLi.length;

    t.css({
        position : 'relative',
        overflow : 'hidden',
        margin   : '0 auto',
        width    : json.width?json.width:(json.banner?'100%':json.num * oW)
    });

    oLi.css({
        width    : json.banner?oW:oLi.width(),
        height   : '100%',
        float    : 'left',
        position : 'relative',
        overflow : 'hidden'
    });

    oUl.css({
        width  : oLL * oW,
        height : '100%'
    });

    if (json.height) t.height(json.height);
    if (json.btn) {
        banner_btn = $('<div class="banner_btn"></div>');
        banner_btn_span = $('<span></span>');
        for (var i = 0; i < oLL/3; i++) {
            banner_btn_span.append('<a href="javascript:;"></a>');
        }
        btn = banner_btn_span.find('a');
        btn.first().addClass('in');
        banner_btn.append(banner_btn_span);
        t.append(banner_btn);
        if (json.btn == 'all') {
            t.append('<div class="banner_l"></div><div class="banner_r"></div>');
            banner_l = t.find('.banner_l');
            banner_r = t.find('.banner_r');
        }
    }
    suspend = btn.add(banner_l).add(banner_r);
    if (json.banner) {
        dcenter = $('div.center:first');
        bresize = function(){
            _w = t.width();
            cw = dcenter.width();
            if (json.adaptive) {
                oW = _w;
            }else{
                oW = _w>cw?_w:cw;
            }
            oLi.width(oW);
            oUl.width(oLL * oW);
            if (css3d) {
                oUl.css({'transform':translate3d(), 'transition':'transform 0ms'});
            } else{
                oUl.css({left : toleft()});
            }
        };
        bresize();
        $(window).resize(function () {
            bresize();
        });
    }else{
        suspend = suspend.add(oLi);
    }

    if (css3d) {
        oUl.css({
            'transform' : translate3d()
        }).on('webkitTransitionEnd', function () {
            if (moveIn) {
                if (oIndex >= 0 ) {
                    oIndex = - oLL/3;
                    oUl.css({'transform':translate3d(), 'transition':'transform 0ms'});
                }
                if (oIndex <= - (oLL - json.num)) {
                    oIndex = - (2*oLL/3 - json.num);
                    oUl.css({'transform':translate3d(), 'transition':'transform 0ms'});
                }
                moveIn = false;
            }
        });
    } else{
        oUl.css({
            position : 'absolute',
            top : 0,
            left : toleft()
        });
    }

    if (json.center) oUl.find('img').imgAuto(true, {
        imgAutoStart: function(img){
            if (json.banner && !json.height) {
                t.height(_w / img.width * img.height);
            }
        }
    });

    move = function (dir){
        if (moveIn) return;
        moveIn = true;
        if (typeof dir != 'undefined') {
            dir == '+'?oIndex++:oIndex--;
        }
        btn.removeClass('in').eq((-oIndex)%(oLL/3)).addClass('in');
        if (css3d) {
            oUl.css({'transform':translate3d(),'transition':'transform '+json.speed+'ms '+json.timing});
        } else{
            oUl.stop(true,true).animate({
                left : toleft()
            }, json.speed, json.easing, function(){
                if (oIndex >= 0 ) {
                    oIndex = - oLL/3;
                    oUl.css('left', toleft());
                }
                if (oIndex <= - (oLL - json.num)) {
                    oIndex = - (2*oLL/3 - json.num);
                    oUl.css('left', toleft());
                }
                moveIn = false;
            });
        }
    }

    banner_l.click(function(){
        move ('+');
    });

    banner_r.click(function(){
        move ('-');
    });

    btn.click(function(e){
        e.stopPropagation();
        moveIn = false;
        oIndex = -oLL/3 - $(this).index();
        move();
    });

    t.on("touchstart",function(e){
        moveIn = false;
        oUl.css('transition','transform 0ms');
        t.roll_stop();
        sx = e.originalEvent.changedTouches[0].clientX;
        downTime = Date.now();
        _l = oUl.position().left;
        _w = t.width()/json.num;
    });
    t.on("touchmove",function(e){
        e.preventDefault();
        ex = e.originalEvent.changedTouches[0].clientX - sx;
        if (ex > _w/3) {
            oUl.css('transform','translate3d('+ ( _l + _w/3 + 2*_w/3 * (1 - (_w/3) / ex) ) +'px, 0px, 0px)');
        }else if(ex < -_w/3) {
            oUl.css('transform','translate3d('+  ( _l - _w/3 - 2*_w/3 * (1 - (-_w/3) / ex) ) +'px, 0px, 0px)');
        }else{
            oUl.css('transform','translate3d('+ (_l + ex) +'px, 0px, 0px)');
        }
    });
    t.on("touchend",function(e){
        outer = false;
        if (oIndex >= 0 && ex > 0) {
            oIndex = -1;
            outer = 1;
        }
        if (oIndex <= - (oLL - json.num) && ex < 0) {
            oIndex = - (oLL - json.num) + 1;
            outer = 2;
        }
        ex = e.originalEvent.changedTouches[0].clientX - sx;
        if ( ex >= _w/3 || (Date.now() - downTime < 300 && ex > 30 || outer == 1) ) {
            move('+');
        }else if( ex < -_w/3 || (Date.now() - downTime < 300 && ex < -30) || outer == 2){
            move('-');
        }else{
            move();
        }
        t.roll_start();
    });

    timer = setInterval(function(){
        move('-');
    }, json.timer);

    suspend.hover(function(){
        t.roll_stop();
    },function(){
        t.roll_start();
    });

    t.fadeTo("slow", 1);
    return this;
};

$.fn.imgAuto = function(co, fn){
    fn = fn || {};
    var fncall = function(name, arg){
        if (typeof fn[name] === 'function') fn[name](arg);
    };
    $(this).each(function(){
        var t = $(this),
            img = new Image(),
            cover = t.attr('img-Auto') == 'cover'||co?true:false,
            _w = t.attr('width'),
            _h = t.attr('height'),
            boxScale = t.attr('box-Scale'),
            box;
        t.css({'display':'block','opacity':0});
        img.src = t.attr('src');
        if ( !t.parent().hasClass('imgAuto_box') && ( t.attr('no-Box') || _w && _h ) ) {
            box = $('<div class="imgAuto_box"></div>');
            box.css({
                "width":_w,
                "height":_h
            });
            t.wrapAll(box);
        }
        box = t.parent();
        box.css('overflow', 'hidden');
        if (boxScale) {
            mk.scale(box, boxScale)
        };
        function move (){
            if (img.width>0 || img.height>0) {
                fncall('imgAutoStart', img);
                var i_w = img.width;//原图宽
                var i_h = img.height;//原图高
                var b_w = box.width();//父元素宽
                var b_h = box.height();//父元素高
                if ( i_w/i_h < b_w/b_h === cover ) {
                    t.css({'width':'100%','height':'auto','margin':-(b_w / (i_w/i_h) - b_h)/2 + 'px 0 0 0'});
                }else{
                    t.css({'width':'auto','height':'100%','margin':'0 0 0 ' + -(b_h * (i_w/i_h) - b_w)/2 + 'px'});
                }
                fncall('callback', img);
            }else{
                setTimeout(move);
            }
        }
        var throttled = mk.letter(move);
        $(window).resize(throttled);
        t.fadeTo('fast', 1);
    });
    return this;
};
