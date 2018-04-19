/*$('#mycheckbox').change(function(){
            if(this.checked) {
                $("mycheckboxdiv").next().show();
            } else {
                $("mycheckboxdiv").next().hide();
            }
        });
$(document).ready(function(){
    $('#sell').change(function(){
        if(this.checked)
            $('#duration').fadeIn('slow');
        else
            $('#duration').fadeOut('slow');

    });
});*/

$(document).ready(function() {
   $('input[type="radio"]').click(function() {
       if($(this).attr('id') == 'watch-me') {
            $('#show-me').show();           
       }

       else {
            $('#show-me').hide();   
       }
   });
});