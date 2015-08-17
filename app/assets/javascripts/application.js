// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jade/runtime
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require bootstrap-sprockets
//
$(document).ready(function(){

    // $("#jade").prepend(JST['templates/amazing_template']());
    $("body").prepend(JST['templates/features']({featurelist: ['f1', 'f2', 'f3']}));
    $("body").prepend(JST['templates/jumbotron']());
    $("body").prepend(JST['templates/nav']({link1: 'RailsJS Link'}));
    $("body").append(JST['templates/footer']());
});
