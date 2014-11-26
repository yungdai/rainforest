//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

// JavaScript Code  for the products controller
//$(document).on('ready page:load', function() {
//    $('#search-form').submit(function(event) {
//        event.preventDefault();
//        var searchValue = $('#search').val();
//
//        $.ajax({
//            url: '/products?search=' + searchValue,
//            type: 'GET',
//            dataType: 'html'
//        }).done(function(data){
//            $('#products').html(data);
//        });
//    });
//});

$(document).on('ready page:load', function() {
    // This checks for the length of the .pagination class to see if it exists
    if ($('.pagination').length) {
        $(window).scroll(function() {
            var url = $('.pagination span.next').children().attr('href');
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
                $('.pagination').text("Fetching more products...");
                return $.getScript(url);
            }
        });
    }
});