
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
    $('.manga-box').on("click", function(){
        var i = $(this).attr('for');
        $("#" + i).prop('checked', true);
    });

    $('.toggle').click(function(e){
        e.preventDefault();
        $(this).toggleClass('toggle-on');
    });
});