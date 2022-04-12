$( document ).ready(function() {
    console.log( "ready!" );
    
    $('#show-desc').hide();
    $('#show-tag').hide();
    $('#n-title').focus(function(){
        $('#show-title').show();
        $('#show-desc').hide();
        $('#show-tag').hide();
        $('#show-content').addClass('align-items-top')        
        $('#show-content').removeClass('align-items-center');
        $('#show-content').removeClass('align-items-end');
;
    })
    
    $('#n-desc').focus(function(){
        $('#show-title').hide();
        $('#show-desc').show();
        $('#show-tag').hide();
        $('#show-content').removeClass('align-items-top')        
        $('#show-content').addClass('align-items-center');
        $('#show-content').removeClass('align-items-end');
    })
    
    $('#n-tag').focus(function(){
        $('#show-title').hide();
        $('#show-desc').hide();
        $('#show-tag').show();
        $('#show-content').removeClass('align-items-top')        
        $('#show-content').removeClass('align-items-center');
        $('#show-content').addClass('align-items-end');
    })
});