
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
    $('.image-collection').on("click", function(){
        var i = $(this).attr('for');
        $("#" + i).prop('checked', true);
    });
});