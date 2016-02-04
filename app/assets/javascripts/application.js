// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require lib/jquery-tiny-pubsub
//= require lib/sha256
//= require lib/handlebars
//= require lib/angular.min
//= require lib/transition
//= require lib/modal
//= require lib/Chart.min
//= require lib/toastr.min
//= require_self
//= require_tree .

window.app = angular.module('Nevermore', ['neverMoreFilters']);

angular.element(document).ready(function() {
  window.credit_book = []
  window.order_book = []
  window.currentUser = 'me'

  // Bootstrap Angualr module
  angular.bootstrap(document, ['Nevermore']);
});
