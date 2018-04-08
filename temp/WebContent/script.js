/**
 * 
 */
$('#mycheckbox').change(function(){
            if(this.checked) {
                $("mycheckboxdiv").next().show();
            } else {
                $("mycheckboxdiv").next().hide();
            }
        });