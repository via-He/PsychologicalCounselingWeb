(function () {
    layui.define(['jquery','layer','form'] , function (exports) {
        var $ = layui.jquery;
        var form = layui.form;
        if(!window.layer){
            window.layer = layui.layer;
        }
        $(function () {
            var cache = {};
            var index = 1;
            $(document).on('click','[lay-model]' , function (e) {
                var model = $(this).attr('lay-model');
                var size = $(model).attr('lay-size');
                var title = $(model).attr('title');
                var layKey = $(this).attr('lay-key-index');
                if(!layKey){
                    layKey = 'key_'+(index++);
                    $(this).attr('lay-key-index',layKey);
                    cache[layKey] = $(model).html();
                }

                $(model).find('*').remove();
                var area = '600px';
                if(size == 'sm'){
                    area = '480px';
                }else if(size == 'lg'){
                    area = '80%';
                }
                var div = document.createElement('div');
                div.style.padding = "10px";
                div.innerHTML = $(model).html();
                layer.open({
                    type:1,
                    title:title,
                    area:area,
                    offset:'100px',
                    shade:[0.8, '#393D49'],
                    shadeClose:true,
                    content:cache[layKey],
                });
                form.render();
            })

        });
        exports('model' , {});
    })
})();