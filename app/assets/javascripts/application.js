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
//= require foundation
//= require angular
//= require angular-route
//= require angular-rails-templates
// Templates in app/assets/javascript/templates
//= require_tree ../templates
//= require angular-touch
//= require angular-animate
//= require_tree .


$(document).ajaxSend(function(e, xhr, options) {
  var token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
});


function spinProfileImage() {
	// alert('start searching?');
	$('#profileImage').load('searching_for_developers.html.erb', function() {
    $('#profileImage').addClass('jqueryhover');
    $('#pow').addClass('scaleUp');
    // $('#pow').addClass('scaleDown');
    $('#pow2').addClass('scaleUp');
    // $('#pow2').addClass('scaleDown');
});

}


function renderContracts() {
		setTimeout(function(){ 
       		window.location.href = '/contracts#/list_contracts'; 
		}, 3700);
}


function renderDevelopers() {
		setTimeout(function(){ 
       		window.location.href = '/developers#/list_developers'; 
		}, 3700);
}

function popupCenter(url, width, height, name) {
  var left = (screen.width/2)-(width/2);
  var top = (screen.height/2)-(height/2);
  return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
}

$(document).ready(function(){
  $("a.popup").click(function(e) {
    popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
    e.stopPropagation(); return false;
  });
});

function facebookPopUp(){
  if(window.opener) {
    window.close();
    window.opener.location.reload(true);
  }
};

function facebookNewEmailConversion(){
    var _fbq = window._fbq || (window._fbq = []);
    if (!_fbq.loaded) {
      var fbds = document.createElement('script');
      fbds.async = true;
      fbds.src = '//connect.facebook.net/en_US/fbds.js';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(fbds, s);
      _fbq.loaded = true;
    }
  window._fbq = window._fbq || [];
  window._fbq.push(['track', '6027479917035', {'value':'0.00','currency':'USD'}]);
}


function facebookNewProfileConversion(){
  var _fbq = window._fbq || (window._fbq = []);
  if (!_fbq.loaded) {
    var fbds = document.createElement('script');
    fbds.async = true;
    fbds.src = '//connect.facebook.net/en_US/fbds.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(fbds, s);
    _fbq.loaded = true;
  }
window._fbq = window._fbq || [];
window._fbq.push(['track', '6027479917035', {'value':'0.00','currency':'USD'}]);
}

function embedGoogleAnalyticsTrackingCode(){
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-62227306-1', 'auto');
  ga('send', 'pageview');
};


function revealModal(){
  $(document).ready(function(){
    
    $('#revealNewDeveloperForm').foundation('reveal', 'open');
  });
};
