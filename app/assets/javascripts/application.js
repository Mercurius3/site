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
//= require jquery
//= require jquery_ujs
//= require raphael
//= require logo
//= require mailchimp
//= require foundation
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.localization/messages_nl
//= require users
//= require youtube
$(document).foundation();
if (!(/^http:\/\/lassche-lassche.nl/).test(window.location.href)) {
	$('<header id="devbanner">').prependTo('body');
}
$(function(){ $(document).foundation(); });
