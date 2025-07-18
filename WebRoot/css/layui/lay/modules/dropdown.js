/**
 * layui_dropdown
 * v2.3.4
 * by Microanswer
 * http://layuidropdown.microanswer.cn/
 **/

layui.define(["jquery"] , function (exports) {

    var $ = layui.jquery;
    $(function () {
        layui.link(layui.layer.path + 'css/modules/dropdown.css');
        var isOpen = false;
        $(document).on('click','[lay-dropdown]',function (e) {
            var a = $(this).next();
            if(a.hasClass("layui-show")){
                a.removeClass('layui-show');
            }else{
                e.stopPropagation();
                isOpen = true;
                a.addClass('layui-show');
            }
        });
        $(document).on('click' , function (e) {
            if(isOpen){
                $('.layui-show').removeClass('layui-show');
            }
        })
    });

    exports("dropdown" , {

    })
})


/*
layui.define(["jquery", "laytpl"], function (n) {
    function i(n, t) {
        var i = o[n] || [];
        i.push(t), o[n] = i
    }

    function r(n, i) {
        var t = o[n] || [];
        a.each(t, function (n, t) {
            t(i)
        })
    }

    var a = layui.jquery || layui.$, l = layui.laytpl, e = "a", p = "b", o = {}, h = "1", c = "2", m = "3";

    function f(n) {
        if (!n) throw new Error("菜单条目内必须填写内容。");
        if ("hr" === n) return "hr";
        if (0 !== n.indexOf("{")) throw new Error("除了分割线hr，别的菜单条目都必须保证是合格的Javascript对象或json对象。");
        return new Function("return " + n)()
    }

    function u(n) {
        if (n && 0 < n.length) {
            for (var t = 0, i = new Array(n.length), e = 0; e < n.length; e++) for (var o = n[e], s = 0; s < o.length; s++) o[s].header && o[s].fixed && (t++, i[e] = o[s], o.splice(s, 1), s--);
            if (0 < t) return i
        }
        return null
    }

    var w = window.MICROANSWER_DROPDOWAN || "dropdown",
        y = "<div tabindex='0' class='layui-anim layui-anim-upbit layu-dropdown-root' " + w + "-id='{{d.downid}}' style='display: none;z-index: {{d.zIndex}}'>{{# if (d.arrow){ }}<div class='layu-dropdown-pointer'></div>{{# } }}<div class='layu-dropdown-content' style='margin: {{d.gap}}px {{d.gap}}px;background-color: {{d.backgroundColor}};min-width: {{d.minWidth}}px;max-width: {{d.maxWidth}}px;min-height: {{d.minHeight}}px;max-height: {{d.maxHeight}}px;white-space: {{d.nowrap?\"nowrap\":\"normal\"}}'>",
        v = "</div></div>",
        g = y + "<div class='layu-dropdown-content-table' cellpadding='0' cellspacing='0'>{{# if (d.fixHeaders && d.fixHeaders.length > 0){ }}<div class='layu-dropdown-content-thead'><div class='layu-dropdown-content-tr'>{{# layui.each(d.fixHeaders, function(i, fixHeader){ }}{{# if (fixHeader) { }}<div class='layu-dropdown-content-th'><div class='layu-dropdown-menu-fixed-head {{(d.menuSplitor && i < (d.menus.length-1))?\"layu-menu-splitor\":\"\"}}'><div class='layu-menu-fixed-head' style='text-align: {{fixHeader.align||\"center\"}}'>{{fixHeader.header}}</div></div></div>{{# } else { }}<th><div class='layu-dropdown-menu-fixed-head {{(d.menuSplitor && i < (d.menus.length-1))?\"layu-menu-splitor\":\"\"}}'><div class='layu-menu-fixed-head'>&nbsp;</div></div></th>{{# } }}{{# }); }}</div></div>{{# } }}<div class='layu-dropdown-content-tbody'><div class='layu-dropdown-content-tr'>{{# layui.each(d.menus, function(i, menu){ }}<div class='layu-dropdown-content-td' valign='top'><div class='layu-dropdown-menu-wrap {{(d.menuSplitor && i < (d.menus.length-1))?\"layu-menu-splitor\":\"\"}} layu-overflowauto' style='min-height: {{d.minHeight}}px;max-height: {{d.maxHeight - ((d.fixHeaders)?24:0)}}px;'><ul class='layu-dropdown-menu' dropdown-menu-index='{{i}}' style=''>{{# layui.each(menu, function(index, item){ }}<li class='layu-menu-item-wrap {{(d.fixHeaders && d.fixHeaders.length) > 0?\"layu-nomargin\":\"\"}}'>{{# if ('hr' === item) { }}<hr>{{# } else if (item.header) { }}{{# if (item.withLine) { }}<fieldset class=\"layui-elem-field layui-field-title layu-menu-header layu-withLine\"><legend>{{item.header}}</legend></fieldset>{{# } else { }}<div class='layu-menu-header' style='text-align: {{item.align||\"left\"}}'>{{item.header}}</div>{{# } }}{{# } else { }}<div class='layu-menu-item' dropdown-menu-item-index='{{index}}'><a href='javascript:;' lay-event='{{item.event}}'>{{# if (item.layIcon){ }}<i class='layui-icon {{item.layIcon}}'></i>&nbsp;{{# } }}<span class='{{item.txtClass||\"\"}}'>{{item.txt}}</span></a></div>{{# } }}</li>{{# }); }}</ul></div></div>{{#});}}</div></div></div>" + v,
        x = {
            menus: [],
            templateMenu: "",
            templateMenuStr: "",
            template: "",
            showBy: "click",
            align: "left",
            minWidth: 76,
            maxWidth: 500,
            minHeight: 10,
            maxHeight: 400,
            zIndex: 891,
            gap: 8,
            onHide: function (n, t) {
            },
            onShow: function (n, t) {
            },
            onItemClick: function (n, t) {
            },
            scrollBehavior: "follow",
            backgroundColor: "#FFF",
            cssLink: "layui/css/modules/dropdown.css",
            immed: !1,
            arrow: !0,
            templateMenuSptor: "[]",
            menuSplitor: !0,
            appendTo: "next"
        };

    function s(n) {
        "string" == typeof n && (n = a(n)), this.$dom = n, this.systemListeners = {}
    }

    function d(n, o) {
        console.log(a(n || "[lay-" + w + "]"))
        a(n || "[lay-" + w + "]").each(function () {
            var n = a(this), t = new Function("return " + (n.attr("lay-" + w) || "{}"))();
            n.removeAttr("lay-" + w);
            var i = a.extend({}, t, o || {}), e = n.data(w) || new s(n);
            n.data(w, e), e.init(i)
        })
    }

    s.prototype.onMenuLaytplEnd = function (n) {
        var t = this;
        t.downHtml = n, t.initEvent(), t.option.immed && t.downHtml && t.show()
    }, s.prototype.init = function (n) {
        var t = this;
        console.log(n);
        if (t.fcd = !1, t.mic = !1, t.opened = !1, t.option ? t.option = a.extend(t.option, n || {}) : t.option = a.extend({
            downid: String(Math.random()).split(".")[1],
            filter: t.$dom.attr("lay-filter")
        }, x, n), 20 < t.option.gap && (t.option.gap = 20), t.$down && (t.$down.remove(), t.$down = void 0), t.option.menus && 0 < t.option.menus.length) {
            var i = t.option.menus[0];
            Array.isArray(i) || (t.option.menus = [t.option.menus]), t.option.fixHeaders = u(t.option.menus), t.option.nowrap = !0, l(g).render(t.option, function (n) {
                t.onMenuLaytplEnd(n)
            })
        } else if (t.option.templateMenu || t.option.templateMenuStr) {
            var e, o;
            if (t.option.templateMenu) o = -1 === t.option.templateMenu.indexOf("#") ? "#" + t.option.templateMenu : t.option.templateMenu, e = a(o).text(); else t.option.templateMenuStr && (e = t.option.templateMenuStr);
            var s = a.extend(a.extend({}, t.option), t.option.data || {});
            l(e).render(s, function (n) {
                t.option.menus = function (n, t) {
                    if (!n) return "";
                    if (!t) throw new Error("请指定菜单模板限定符。");
                    for (var i, e, o = t.charAt(0), s = t.charAt(1), d = n.length, r = 0, a = h, l = !1, p = []; r < d;) {
                        var u = n.charAt(r);
                        a !== h || l ? a !== c || l ? a === m && (l ? (e.srcStr += u, l = !1) : "\\" === u ? l = !0 : u === s ? (e = f(e.srcStr), i.push(e), a = c) : e.srcStr += u) : o === u ? (e = {srcStr: ""}, a = m) : s === u && (a = h) : o === u && (i = [], p.push(i), a = c), r += 1
                    }
                    return p
                }(n, t.option.templateMenuSptor), t.option.fixHeaders = u(t.option.menus), t.option.nowrap = !0, l(g).render(t.option, function (n) {
                    t.onMenuLaytplEnd(n)
                })
            })
        } else if (t.option.template) {
            var d;
            d = -1 === t.option.template.indexOf("#") ? "#" + t.option.template : t.option.template, (s = a.extend(a.extend({}, t.option), t.option.data || {})).nowrap = !1, l(y + a(d).html() + v).render(s, function (n) {
                t.onMenuLaytplEnd(n)
            })
        } else layui.hint().error("下拉框目前即没配置菜单项，也没配置下拉模板。[#" + (t.$dom.attr("id") || "") + ",filter=" + t.option.filter + "]")
    }, s.prototype.initSize = function () {
        if (this.$down && (this.$down.find(".layu-dropdown-pointer").css({
            width: 2 * this.option.gap,
            height: 2 * this.option.gap
        }), !this._sized)) {
            var n = 0;
            this.$down.find(".dropdown-menu-wrap").each(function () {
                n = Math.max(n, a(this).height())
            }), this.$down.find(".dropdown-menu-wrap").css({height: n}), this._sized = !0
        }
    }, s.prototype.initPosition = function () {
        if (this.$down) {
            var n, t, i, e, o = this.$dom.offset(), s = this.$dom.outerHeight(), d = this.$dom.outerWidth(), r = o.left,
                a = o.top - window.pageYOffset, l = this.$down.outerHeight(), p = this.$down.outerWidth();
            t = s + a, (n = "right" === this.option.align ? r + d - p + this.option.gap : "center" === this.option.align ? r + (d - p) / 2 : r - this.option.gap) + p >= window.innerWidth && (n = window.innerWidth - p - 2 * this.option.gap), i = n < r ? d < p ? r - n + d / 2 : p / 2 : d < p ? n + (r + d - n) / 2 : p / 2, i -= this.option.gap;
            var u = this.$arrowDom;
            e = -this.option.gap, u.css("left", i), u.css("right", "unset"), t + l >= window.innerHeight ? (t = a - l, e = l - this.option.gap, u.css("top", e).addClass("bottom")) : u.css("top", e).removeClass("bottom"), this.$down.css("left", n), this.$down.css("top", t)
        }
    }, s.prototype.renderDownHtml = function () {
        this.$down = a(this.downHtml);
        var n = this.option.appendTo;
        if ("next" === n) this.$dom.after(this.$down); else if ("before" === n) this.$dom.before(this.$down); else {
            if (0 !== n.indexOf("selector_")) throw new Error("不支持此渲染方式。请填写：next, before, selector_xxx 某一项内容。");
            a(n.substr(n.indexOf("_") + 1)).append(this.$down)
        }
    }, s.prototype.show = function () {
        var n = this, t = !1;
        n.$down || (n.renderDownHtml(), n.$arrowDom = n.$down.find(".layu-dropdown-pointer"), t = !0), n.initPosition(), n.opening = !0, setTimeout(function () {
            n.$down.focus()
        }, 100), n.$down.addClass("layui-show"), n.initSize(), n.opened = !0, t && n.initDropdownEvent(), r(e, n), t && n.onSuccess(), n.option.onShow && n.option.onShow(n.$dom, n.$down)
    }, s.prototype.hide = function () {
        this.opened && (this.fcd = !1, this.$down.removeClass("layui-show"), this.opened = !1, this.option.onHide && this.option.onHide(this.$dom, this.$down))
    }, s.prototype.hideWhenCan = function () {
        this.mic || this.opening || this.fcd || this.hide()
    }, s.prototype.toggle = function () {
        this.opened ? this.hide() : this.show()
    }, s.prototype.onSuccess = function () {
        this.option.success && this.option.success(this.$down)
    }, s.prototype._onScroll = function () {
        var n = this;
        n.opened && ("follow" === this.option.scrollBehavior ? setTimeout(function () {
            n.initPosition()
        }, 10) : this.hide())
    }, s.prototype._onResize = function () {
        this.opened && this.initPosition()
    }, s.prototype.initEvent = function () {
        var t = this;
        t.initEvented || (t.initEvented = !0, i(e, function (n) {
            n !== t && t.hide()
        }), this.systemListeners.scrollListener = t._onScroll.bind(t), this.systemListeners.resizeListener = t._onResize.bind(t), a(window).on("scroll", this.systemListeners.scrollListener), t.$dom.parents().on("scroll", this.systemListeners.scrollListener), a(window).on("resize", this.systemListeners.resizeListener), t.initDomEvent())
    }, s.prototype.initDomEvent = function () {
        var n = this;
        n.$dom.mouseenter(function () {
            n.mic = !0, "hover" === n.option.showBy && (n.fcd = !0, n.show())
        }), n.$dom.mouseleave(function () {
            n.mic = !1
        }), "click" === n.option.showBy && n.$dom.on("click", function () {
            n.fcd = !0, n.toggle()
        }), n.$dom.on("blur", function () {
            n.fcd = !1, n.hideWhenCan()
        })
    }, s.prototype.initDropdownEvent = function () {
        var d = this;
        d.$down.find(".layu-dropdown-menu-wrap").on("mousewheel", function (n) {
            var t = a(this);
            (n = n || window.event).cancelable = !0, n.cancelBubble = !0, n.preventDefault(), n.stopPropagation(), n.stopImmediatePropagation && n.stopImmediatePropagation(), n.returnValue = !1, d.scrolling && t.finish();
            var i = -n.originalEvent.wheelDelta || n.originalEvent.detail;
            0 < i ? (50 < i && (i = 50), d.scrolling = !0, t.animate({scrollTop: t.scrollTop() + i}, {
                duration: 170,
                complete: function () {
                    d.scrolling = !1
                }
            })) : i < 0 ? (i < -50 && (i = -50), d.scrolling = !0, t.animate({scrollTop: t.scrollTop() + i}, {
                duration: 170,
                complete: function () {
                    d.scrolling = !1
                }
            })) : d.scrolling = !1
        }), d.$down.mouseenter(function () {
            d.mic = !0, d.$down.focus()
        }), d.$down.mouseleave(function () {
            d.mic = !1
        }), d.$down.on("blur", function () {
            d.fcd = !1, d.hideWhenCan()
        }), d.$down.on("focus", function () {
            d.opening = !1
        }), d.option.menus && a("[" + w + "-id='" + d.option.downid + "']").on("click", "a", function () {
            var n = a(this), t = (n.attr("lay-event") || "").trim();
            if (t) {
                var i = w + "(" + d.option.filter + ")." + p, e = n.parents("[dropdown-menu-index]"),
                    o = n.parents("[dropdown-menu-item-index]"),
                    s = d.option.menus[parseInt(e.attr("dropdown-menu-index"))][parseInt(o.attr("dropdown-menu-item-index"))];
                d.option.onItemClick && d.option.onItemClick(t, s), r(i, {event: t, data: s}), d.hide()
            } else layui.hint().error("菜单条目[" + this.outerHTML + "]未设置event。")
        })
    }, s.prototype.destroy = function (n) {
        if (this.fcd = !1, this.downHtml = void 0, this.mic = !1, this.opened = !1, a(window).off("scroll", this.systemListeners.scrollListener), this.$dom.parents().off("scroll", this.systemListeners.scrollListener), a(window).off("resize", this.systemListeners.resizeListener), this.$down && this.$down.remove(), this.$dom.removeData(w, null), void 0 === n && (n = !0), !n) {
            var t = w + "(" + this.option.filter + ")." + p;
            delete o[t]
        }
    }, d(), window[w + "_useOwnCss"] || layui.link(window[w + "_cssLink"] || x.cssLink, function () {
    }, w + "_css"), n(w, {
        suite: d, onFilter: function (n, t) {
            i(w + "(" + n + ")." + p, function (n) {
                t && t(n.event, n.data)
            })
        }, hide: function (n) {
            a(n).each(function () {
                var n = a(this).data(w);
                n && n.hide()
            })
        }, show: function (t, i) {
            a(t).each(function () {
                var n = a(this).data(w);
                n ? n.show() : (layui.hint().error("警告：尝试在选择器【" + t + "】上进行下拉框show操作，但此选择器对应的dom并没有初始化下拉框。"), (i = i || {}).immed = !0, d(t, i))
            })
        }, destroy: function (n, t) {
            a(n).each(function () {
                var n = a(this).data(w);
                n && n.destroy(t)
            })
        }, version: "2.3.4"
    })
});*/
