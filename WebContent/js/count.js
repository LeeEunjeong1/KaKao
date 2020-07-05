$(function(){
    $('#minus').click(function(e){
        e.preventDefault();
        
        var stat = $('#count').text();
        var num = parseInt(stat,10);
        num--;
        
        if(num<=0){
            num =1;
        }
        
        
        $('#count').text(num);
    });

    $('#plus').click(function(e){
        e.preventDefault();
        
        var stat = $('#count').text();
        var num = parseInt(stat,10);
        num++;


        $('#count').text(num);
    });
});