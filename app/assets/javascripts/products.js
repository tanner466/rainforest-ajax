// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('ready page:load', function() {
  // function display_search_results() {
  //   if (this.readyState === 4) {
  //     console.log(this);
  //     document.getElementById('products').innerHTML = this.responseText;
  //   }
  // }
  //
  // var form = document.getElementById('search-form');
  //
  // form.addEventListener('submit', function(e) {
  //   e.preventDefault();
  //   var searchValue = document.getElementById('search').value;
  //
  //   var xhr = new XMLHttpRequest();
  //   xhr.onload = display_search_results;
  //   xhr.open('GET', '/products?search=' + searchValue, true);
  //   xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
  //   xhr.send();
  // });
  // put your javascript here
  $('#search-form').submit(function(e) {
    e.preventDefault();
    var searchValue = $('#search').val();

    // $.ajax({
    //   url: '/products?search=' + searchValue,
    //   type: 'GET',
    //   dataType: 'html'
    // }).done(function(data){
    //   $('#products').html(data);
    // });
    // $.get('/products?search=' + searchValue)
    //   .done(function(data) {
    //     console.log(data);
    //     $('#products').html(data);
    //   });
    $.getScript('/products?search=' + searchValue);
  });
});
