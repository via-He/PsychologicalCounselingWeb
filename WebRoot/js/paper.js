(function (w,$){


    function paper( target , option ){
        var options = {
            list:[],
            daan:'daan',
            leixing:'leixing',
            danxuanti:'单选题',
            duoxuanti:'多选题',
            isShuxiang:false,
            biaoti:'',
            jiexi:'',
            zhengquedaan:'',
            kaoshishichang:0,
            isPrevTime:false,
            isRequired:false,
            submit:null
        };
        this.options = $.extend(true,{},options,option);
        if(this.options.list.length == 0){
            return;
        }
        this.target = target;
        this.initKaoshishichang();
        this.initForm(target);

        this.startTime = Math.floor(new Date().getTime()/1000);

    }

    paper.prototype = {
        options:{},
        target:'',
        $form:null,
        startTime:0,
        $shichang:null,
        initForm:function (target) {
            var form = this.$form = $('<form action="javascript:;"></form>');
            form.append(this.initItems());
            form.append(this.initButton());
            if(this.options.isShuxiang){
                form.addClass('shuxiang');
            }
            $(target).append(form);
            this.initEvent();
        },
        initEvent:function(){
            // 加载事件
            var that = this;
            var options = that.options;
            this.$form.on('submit', function (e){
                // 获取数据
                e.preventDefault();
                e.stopPropagation();
                that.submitForm();
            });
            if(options.jiexi || options.zhengquedaan){
                this.$form.on('click' , 'input[type="radio"],input[type="checkbox"]' , function (){

                    var name = $(this).attr('name');
                    var type = $(this).attr('type');
                    type = type.toLocaleLowerCase();
                    var isJiexi = false;
                    var isOpenZhengquedaan = false;
                    if(type == 'radio'){
                        if( options.jiexi ){
                            isJiexi = true;
                        }
                        if(options.zhengquedaan){
                            isOpenZhengquedaan = true;
                        }
                        $(this).parents('.daan').find('input').prop('disabled',true);
                    }else {
                        var isZhengquedaan = true;
                        $(this).parents('.daan').find('input').each(function (){
                            if(isJiexi)return;
                            if(this.checked){
                                // 已选中
                                if($(this).data('point') <= 0){
                                    isJiexi = true; // 选了个错题
                                }
                            }else{
                                if($(this).data('point') > 0){
                                    isZhengquedaan = false; // 还有正确答案
                                }
                            }
                        });
                        if((isZhengquedaan || isJiexi) && options.zhengquedaan){
                            isOpenZhengquedaan = true;
                            isJiexi = true;
                        }
                        if(isJiexi || isZhengquedaan)
                        {
                            $(this).parents('.daan').find('input').prop('disabled',true);
                        }
                    }
                    if(isJiexi){
                        $(this).parents('.zhangjie-list').find('.jiexi').slideDown(500);
                    }
                    if(isOpenZhengquedaan){
                        $(this).parents('.zhangjie-list').find('.zhengquedaan').slideDown(500);
                    }
                });
            }
        },
        initKaoshishichang(){
            var that = this;
            var options = that.options;
            if(options.kaoshishichang > 0){

                var shichang = this.$shichang = $('<div\n' +
                    '             style="position: fixed;right: 10px;top: 10px;padding: 10px;background: #f2f2f2; color: red; text-align: center;"></div>');
                $('body').append(shichang);

                var fenshu = options.kaoshishichang;
                var key = "stopTime";
                var stopTime = sessionStorage.getItem(key);
                stopTime = (new Date().getTime()) + 60 * fenshu * 1000;
                stopTime = new Date(Math.floor(stopTime));

                function clock() {
                    if (new Date().getTime() > stopTime) {
                        that.submitForm(true);
                        return;
                    }
                    var today = new Date(),//当前时间
                        h = today.getHours(),
                        m = today.getMinutes(),
                        s = today.getSeconds();
                    var stopH = stopTime.getHours(),
                        stopM = stopTime.getMinutes(),
                        stopS = stopTime.getSeconds();
                    var shenyu = stopTime.getTime() - today.getTime(),//倒计时毫秒数
                        shengyuD = parseInt(shenyu / (60 * 60 * 24 * 1000)),//转换为天
                        D = parseInt(shenyu) - parseInt(shengyuD * 60 * 60 * 24 * 1000),//除去天的毫秒数
                        shengyuH = parseInt(D / (60 * 60 * 1000)),//除去天的毫秒数转换成小时
                        H = D - shengyuH * 60 * 60 * 1000,//除去天、小时的毫秒数
                        shengyuM = parseInt(H / (60 * 1000)),//除去天的毫秒数转换成分钟
                        M = H - shengyuM * 60 * 1000;//除去天、小时、分的毫秒数
                    var S = parseInt((shenyu - shengyuD * 60 * 60 * 24 * 1000 - shengyuH * 60 * 60 * 1000 - shengyuM * 60 * 1000) / 1000)//除去天、小时、分的毫秒数转化为秒
                    shichang.html('剩余时间：' + (shengyuH + "小时" + shengyuM + "分" + S + "秒" + "<br>"));

                    // setTimeout("clock()",500);
                    setTimeout(clock, 500);
                }
                clock();
            }
        },
        submitForm(force){
            var that = this;
            var options = that.options;
            var result = [];
            var zongdefen = 0;
            var leixingdefen = {};

            for (var j=0;j<options.list.length;j++){
                // 循环获取数据,这些都是试题上的数据
                var o = options.list[j];
                var obj = $.extend(true,{},o);

                var type = o[options.leixing];
                if(options.danxuanti.indexOf(type)!==-1){
                    // 单选提
                    var op = that.$form.find('[name="daan'+j+'"]:checked')
                    if(op.length == 0 && options.isRequired && !force){
                        // 必填项
                        alert('请选择【'+o[options.biaoti]+'】');
                        return;
                    }
                    if(op.length == 0){
                        obj.zimu = '';
                        obj.daan = '';
                        obj.defen = 0;
                    }else{
                        obj.zimu = op.val();
                        obj.daan = op.data('title');
                        obj.defen = Math.floor(op.data('point'));
                    }
                    zongdefen+=obj.defen;
                    if( !leixingdefen[type] ){
                        leixingdefen[type] = 0;
                    }
                    leixingdefen[type] += obj.defen;
                }else if(options.duoxuanti.indexOf(type) !== -1){
                    var op = that.$form.find('[name="daan'+j+'"]:checked');
                    if(op.length == 0 && options.isRequired && !force ){
                        // 必填项
                        alert('请选择【'+o[options.biaoti]+'】');
                        return;
                    }
                    var defen = 0;
                    var daan = [];
                    var zimu = [];
                    op.each(function (){
                        daan.push($(this).attr('data-title'));
                        defen += Math.floor($(this).attr('data-point'));
                        zimu.push(this.value);
                    });
                    obj.daan = daan.join(",");
                    obj.defen = defen;
                    obj.zimu = zimu.join(",");
                    zongdefen+=obj.defen;
                    if( !leixingdefen[type] ){
                        leixingdefen[type] = 0;
                    }
                    leixingdefen[type] += obj.defen;
                }else{
                    obj.daan = that.$form.find('[name="daan' + j + '"]').val();
                    obj.defen = -1;
                    obj.zimu = '';
                }
                result.push(obj);
            }
            if(options.submit){
                var endTime = Math.floor(new Date().getTime()/1000);
                options.submit.call(that , result,zongdefen,leixingdefen,endTime-this.startTime);
            }
        },
        initButton(){
            return '<div style="margin-top: 15px"> <input type="submit" name="Submit" value="提交" class="btn btn-primary"/>\n' +
                '            <input type="reset" name="Submit2" value="重置" class="btn btn-default"/></div>';
        },
        initItems(){
            var that = this;
            var options = this.options;
            var result = '<div id="zhangjielianxi">';

            $.each(options.list , function(i,o){
                var type = o[options.leixing];
                result += '<div class="zhangjie-list" style="margin-bottom: 10px; padding: 10px; background: #fff">' +
                    '<h3>第' + (i+1) + '题：' + o[options.biaoti] + '</h3>' +
                    '<div class="daan">';
                if(options.danxuanti.indexOf(type) !== -1){
                    var daan = eval('('+o[options.daan]+')');
                    $.each(daan,function (index,item){
                        result += that.createRadio(i,item);
                    });
                }else if(options.duoxuanti.indexOf(type) !== -1){
                    var daan = eval('('+o[options.daan]+')');
                    $.each(daan,function (index,item){
                        result += that.createCheckbox(i,item);
                    });
                }else{
                    result += that.createTextarea(i);
                }
                result+="</div>";
                if(options.zhengquedaan && o[options.zhengquedaan]){
                    result += '<div class="zhengquedaan tiku-message-zhengque">' +
                        o[options.zhengquedaan] +
                        '</div>';
                }
                if(options.jiexi && o[options.jiexi]){
                    result += '<div class="jiexi tiku-message-jiexi">' +
                        o[options.jiexi] +
                        '</div>';
                }
                result+="</div>";
            });
            result += '</div>';
            return result;
        },
        createRadio:function (j, obj )
        {
            return '<label><input type="radio" name="daan' + j + '" data-index="'+j+'" data-point="'+obj.point+'" data-title="' + obj.zimu + '、' + obj.title + '" value="' + obj.zimu + '"  /> ' + obj.zimu + ' ' + obj.title + ' </label> ';
        },
        createCheckbox:function (j, obj )
        {
            return '<label><input type="checkbox" name="daan' + j + '" data-index="'+j+'" data-point="'+obj.point+'" data-title="' + obj.zimu + '、' + obj.title + '" value="' + obj.zimu + '" /> ' + obj.zimu + ' ' + obj.title + ' </label>';
        },
        createTextarea:function (j,obj){
            return '<textarea name="daan' + j + '" data-index="'+j+'" style="width: 100%;height: 85px;" placeholder="请填写答案"></textarea>';
        }
    };

    w.paper = paper;
})(window,jQuery);