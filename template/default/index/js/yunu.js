"use strict";

var _typeof2 = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var _typeof = "function" == typeof Symbol && "symbol" == _typeof2(Symbol.iterator) ? function (t) {
  return typeof t === "undefined" ? "undefined" : _typeof2(t);
} : function (t) {
  return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t === "undefined" ? "undefined" : _typeof2(t);
};!function (t, n, e) {
  n.yunu = { init: function init() {
      return (arguments[0] ? arguments[0] : {}).imgAuto && t("img").each(function () {
        var n = t(this);n.attr("img-Auto") && ("cover" == n.attr("img-Auto") ? n.imgAuto("cover") : n.imgAuto());
      }), t("body").fadeTo("fast", 1), this;
    }, rem: function rem(e) {
      return e = e || 640, t(n).width() > 1024 ? t("html").css("font-size", 320) : t("html").css("font-size", t(n).width() / e * 100), this;
    }, nav: function nav() {
      var n = t("#nav"),
          e = t("#nav>ul>li>a");return t("#menu").click(function () {
        n.addClass("in");
      }), n.click(function () {
        n.removeClass("in");
      }), t("#nav>ul").click(function (t) {
        t.stopPropagation();
      }), e.each(function () {
        var n = t(this);n.next("ul").children().length && n.prop("href", "javascript:;").append('<i class="fa fa-angle-down"></i>');
      }).click(function (n) {
        var i = t(this),
            o = e.filter(function (n) {
          return t(this).hasClass("in");
        }),
            a = function a(t, n) {
          "down" == n ? t.addClass("in").next("ul").slideDown("fast") : t.removeClass("in").next("ul").slideUp("fast");
        };o === i ? a(i, "up") : (a(i, "down"), a(o, "up"));
      }), this;
    }, letter: function letter(t) {
      if ("function" == typeof arguments[0]) {
        t();var n = "number" != typeof arguments[1] ? 300 : arguments[1],
            e = null,
            i = new Date().getTime();return function () {
          var o = new Date().getTime();o - i < n ? (clearTimeout(e), e = setTimeout(function () {
            t();
          }, n)) : (clearTimeout(e), i = o, t());
        };
      }
    }, css3: function () {
      var t = document.createElement("div"),
          n = "Ms O Moz Webkit".split(" ");return function (e) {
        var i = n.length;if ("string" != typeof e) return !1;if (e in t.style) return !0;for (e = e.replace(/^[a-z]/, function (t) {
          return t.toUpperCase();
        }); i--;) {
          if (n[i] + e in t.style) return !0;
        }return !1;
      };
    }(), css3_3d: function css3_3d() {
      var t = document.documentElement,
          n = yunu.css3("perspective"),
          e = document.body;if (n && "webkitPerspective" in t.style) {
        var i = document.createElement("style");i.type = "text/css", i.innerHTML = "@media (transform-3d),(-webkit-transform-3d){#css3_3d_test{left:9px;position:absolute;height:3px;}}", e.appendChild(i);var o = document.createElement("div");o.id = "css3_3d_test", e.appendChild(o), n = 9 === o.offsetLeft && 3 === o.offsetHeight;
      }return yunu.css3_3d = function () {
        return n;
      }, n;
    }, lazyLoad: function lazyLoad(e, i) {
      return e.each(function (o) {
        var a = t(this);return void 0 === a.attr("data-src") && void 0 === i ? (yunu.lazyLoad(e.not(a)), !1) : (a.show = function () {
          if (!(t(n).height() + t(n).scrollTop() > a.offset().top - (parseInt(a.css("top")) || 0))) return !1;"function" == typeof i ? i.call(a) : i ? a.animate({ top: 0, left: 0 }, parseInt(a.attr("timer")) || 2e3, function () {}) : a.attr("src", a.attr("data-src")).removeAttr("data-src"), t(n).unbind("scroll", a.show);
        }, !1 !== a.show() ? (setTimeout(function () {
          yunu.lazyLoad(e.not(a));
        }), !1) : void t(n).bind("scroll", a.show));
      }), this;
    }, loadMore: function loadMore() {
      var n = arguments.length > 0 && arguments[0] !== e ? arguments[0] : {},
          i = function i() {
        t.ajax({ url: n.url, type: n.type, data: n.data, dataType: "jsonp", beforeSend: function beforeSend(t) {
            n.beforeSend(t), n.btn.attr("disabled", !0);
          } }).done(function (t, e, i) {
          n.done(t, e, i), t.data.length < n.data.limit && n.btn.replaceWith(n.load_more_none);
        }).fail(function (t, e, i) {
          n.fail(t, e, i);
        }).always(function (t, e, i) {
          n.always(t, e, i), n.key = !0, n.btn.attr("disabled", !1);
        });
      };(n = t.extend(!0, { key: !0, url: "", type: "POST", btn: t("#load_more_btn"), box: t("#list>ul"), data: { pages: 1, limit: 5 }, beforeSend: function beforeSend() {}, done: function done() {}, fail: function fail() {}, always: function always() {}, load_icon: !0, load_icon_class: "", loading: t('<div class="la-ball-fall"><div></div><div></div><div></div><div></div></div>'), load_more_none: t('<p class="load_more_none tac c_red mt20">没有了</p>') }, n)).load_icon && (t(n.loading).addClass(n.load_icon_class), n.btn.after(n.loading)), n.btn.click(function () {
        n.key && (n.key = !1, n.data.pages++, i());
      });
    }, tab: function tab(n, e, i) {
      var n = t(n),
          e = t(e),
          o = function o(_o) {
        var a = t(_o).data("i");n.removeClass("active").eq(a).addClass("active"), e.hide().eq(a).stop(!0, !0).fadeTo(0, .5).fadeTo("fast", 1), i && i(_o);
      };return n.each(function (t) {
        n.eq(t).data("i", t);
      }).click(function () {
        o(this);
      }), o(n.first()), this;
    }, scrollTop: function scrollTop() {
      var e, i, o, a, s, r, c;return i = "number" != typeof arguments[1] ? 150 : arguments[1], "object" == _typeof(arguments[0]) ? "box" == arguments[2] ? (o = a = arguments[0], s = e = t("a[href='#top']"), r = yunu.letter(function () {
        a.scrollTop() > i ? e.fadeIn() : e.fadeOut("fast");
      })) : (o = t("html,body"), a = t(n), s = arguments[0], e = s.find("a[href='#top']"), r = yunu.letter(function () {
        c = (a.height() - s.height()) / 2, s.animate({ top: c + a.scrollTop() }), a.scrollTop() + c > i && s.is(":hidden") && s.stop(!0, !0).fadeIn(), a.scrollTop() + c < i && !s.is(":hidden") && s.stop(!0).fadeOut("fast");
      })) : (o = t("html,body"), a = t(n), s = e = t("a[href='#top']"), r = yunu.letter(function () {
        a.scrollTop() > i ? e.fadeIn() : e.fadeOut("fast");
      })), e.click(function () {
        event.stopPropagation(), event.preventDefault(), o.animate({ scrollTop: 0 }), s.fadeOut();
      }), a.scroll(r), this;
    } }, t.fn.roll = function () {
    var e = this,
        i = arguments[0] ? arguments[0] : {};"number" != typeof i.num && (i.num = 1), "number" != typeof i.timer && (i.timer = 6e3), "number" != typeof i.speed && (i.speed = 400), "string" != typeof i.easing && (i.easing = "swing"), "string" != typeof i.timing && (i.timing = "ease-out"), void 0 === i.adaptive && (i.adaptive = !0), void 0 === i.center && (i.center = !0);var o,
        a,
        s,
        r,
        c,
        l,
        u,
        d,
        f = e.find("ul"),
        h = f.find("li"),
        p = h.length,
        m = h.outerWidth(!0),
        v = i.lbtn || e.find(".btn_l"),
        g = i.rbtn || e.find(".btn_r"),
        y = e.find(".banner_btn").find("a"),
        b = -p,
        w = null,
        _ = !1,
        T = !1,
        x = 0,
        k = 0,
        C = 0,
        A = 0,
        z = yunu.css3_3d(),
        I = function I() {
      return "translate3d(" + m * b + "px, 0px, 0px)";
    },
        S = function S() {
      return m * b;
    };if (e.roll_stop = function () {
      clearInterval(w);
    }, e.roll_start = function (t) {
      t && (_ = !1), clearInterval(w), w = setInterval(function () {
        o("-");
      }, i.timer);
    }, f.html(f.html() + f.html() + f.html()), h = f.find("li"), p = h.length, e.css({ position: "relative", overflow: "hidden", margin: "0 auto", width: i.width ? i.width : i.banner ? "100%" : i.num * m }), h.css({ width: i.banner ? m : h.width(), height: "auto", float: "left", position: "relative", overflow: "hidden" }), f.css({ width: p * m, height: "auto" }), i.height && e.height(i.height), i.btn) {
      a = t('<div class="banner_btn"></div>'), s = t("<span></span>");for (var D = 0; D < p / 3; D++) {
        s.append('<a href="javascript:;"></a>');
      }(y = s.find("a")).first().addClass("in"), a.append(s), e.append(a), "all" == i.btn && (e.append('<div class="banner_l"></div><div class="banner_r"></div>'), v = e.find(".banner_l"), g = e.find(".banner_r"));
    }return r = y.add(v).add(g), i.banner ? (u = t("div.center:first"), (d = function d() {
      c = e.width(), l = u.width(), m = i.adaptive ? c : c > l ? c : l, h.width(m), f.width(p * m), z ? f.css({ transform: I(), transition: "transform 0ms" }) : f.css({ left: S() });
    })(), t(n).resize(function () {
      d();
    })) : r.add(h), z ? f.css({ transform: I() }).on("webkitTransitionEnd", function () {
      _ && (b >= 0 && (b = -p / 3, f.css({ transform: I(), transition: "transform 0ms" })), b <= -(p - i.num) && (b = -(2 * p / 3 - i.num), f.css({ transform: I(), transition: "transform 0ms" })), _ = !1);
    }) : f.css({ position: "absolute", top: 0, left: S() }), o = function o(t) {
      _ || (_ = !0, void 0 !== t && ("+" == t ? b++ : b--), y.removeClass("in").eq(-b % (p / 3)).addClass("in"), z ? f.css({ transform: I(), transition: "transform " + i.speed + "ms " + i.timing }) : f.stop(!0, !0).animate({ left: S() }, i.speed, i.easing, function () {
        b >= 0 && (b = -p / 3, f.css("left", S())), b <= -(p - i.num) && (b = -(2 * p / 3 - i.num), f.css("left", S())), _ = !1;
      }));
    }, v.click(function () {
      o("+");
    }), g.click(function () {
      o("-");
    }), y.click(function (n) {
      n.stopPropagation(), _ = !1, b = -p / 3 - t(this).index(), o();
    }), e.on("touchstart", function (t) {
      _ = !1, f.css("transition", "transform 0ms"), e.roll_stop(), x = t.originalEvent.changedTouches[0].clientX, C = Date.now(), A = f.position().left, c = e.width() / i.num;
    }), e.on("touchmove", function (t) {
      t.preventDefault(), (k = t.originalEvent.changedTouches[0].clientX - x) > c / 3 ? f.css("transform", "translate3d(" + (A + c / 3 + 2 * c / 3 * (1 - c / 3 / k)) + "px, 0px, 0px)") : k < -c / 3 ? f.css("transform", "translate3d(" + (A - c / 3 - 2 * c / 3 * (1 - -c / 3 / k)) + "px, 0px, 0px)") : f.css("transform", "translate3d(" + (A + k) + "px, 0px, 0px)");
    }), e.on("touchend", function (t) {
      T = !1, b >= 0 && k > 0 && (b = -1, T = 1), b <= -(p - i.num) && k < 0 && (b = 1 - (p - i.num), T = 2), (k = t.originalEvent.changedTouches[0].clientX - x) >= c / 3 || Date.now() - C < 300 && k > 30 || 1 == T ? o("+") : k < -c / 3 || Date.now() - C < 300 && k < -30 || 2 == T ? o("-") : o(), e.roll_start();
    }), w = setInterval(function () {
      o("-");
    }, i.timer), r.hover(function () {
      e.roll_stop();
    }, function () {
      e.roll_start();
    }), e.fadeTo("slow", 1), this;
  }, t.fn.imgAuto = function (e, i) {
    i = arguments[1] ? arguments[1] : {};var o = function o(t, n) {
      "function" == typeof i[t] && i[t](n);
    };return t(this).each(function () {
      function i() {
        s.width > 0 || s.height > 0 ? (o("imgAutoStart", s), a.css({ display: "block", margin: 0 }).parent().css("overflow", "hidden"), c = s.width, l = s.height, u = r.width(), d = r.height(), f = d / l * c, h = u / c * l, c / l < u / d ? p ? a.css({ width: "100%", height: "auto" }).css("margin-top", -(h - d) / 2) : a.css({ width: "auto", height: "100%" }).css("margin-left", (u - f) / 2) : p ? a.css({ width: "auto", height: "100%" }).css("margin-left", -(f - u) / 2) : a.css({ width: "100%", height: "auto" }).css("margin-top", (d - h) / 2)) : setTimeout(i), o("callback", s);
      }var a = t(this);a.css("opacity", 0);var s = new Image();s.src = a.attr("src");var r,
          c,
          l,
          u,
          d,
          f,
          h,
          p = !("cover" != a.attr("img-Auto") && !e),
          m = a.attr("width"),
          v = a.attr("height");m && v ? ((r = t('<div class="imgAuto_box"></div>')).css({ width: m, height: v, "text-align": "left", overflow: "hidden" }), a.wrapAll(r)) : r = a.parent(), i(), a.fadeTo(2e3, 1);var g = yunu.letter(i);t(n).resize(g);
    }), this;
  };
}(jQuery, window, document), yunu.rem(320), $(window).resize(function () {
  yunu.rem(320);
});
//# sourceMappingURL=yunu.js.map
//# sourceMappingURL=yunu.js.map
