(function(){

    (function () {
        function selectRadio(obj) {
            var form = $(obj).parents('form');
            var div = $(obj).parent();
            div.find('input').val($(obj).attr('data-value'));
            form.submit();
        }
        window.selectRadio = selectRadio;
    })()



})();