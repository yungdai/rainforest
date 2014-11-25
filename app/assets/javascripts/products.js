//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

// JavaScript Code  for the products controller
$(document).on('ready page:load', function() {
    $('#search-form').submit(function(event) {
        event.preventDefault();
        var searchValue = $('#search').val();

        $.ajax({
            url: '/products?search=' + searchValue,
            type: 'GET',
            dataType: 'html'
        }).done(function(data){
            $('#products').html(data);
        });
    });
});