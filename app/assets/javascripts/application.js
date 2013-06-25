// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require_tree .





$(document).ready(function() {

  $('input[type="radio"]').click(function(){
    $('#myModal').reveal();
    if($('#retailer_id').val() == ""){
      // alert("retailer need to select.")
      $('input[type="radio"]').prop('checked', false);

      return false;
    }


    // alert($(this).attr("name") + " is " +$(this).attr("value"));
  });



	// $('input[name="audit[status_id]"]:radio').change(function(){
  $('input[type="radio"]').change(function(){
		
    var retailer_id = $('#retailer_id').val();
    if(retailer_id == ""){
      alert("please choose retailer first");
      $('input[type="radio"]').prop('checked', false);
      return false;
    }
    else{
      var info = {}
      info['retailer_id'] = retailer_id;
      info['field_name'] = $(this).attr("name");
      // info['content'] = 

      $.ajax({
        url: '/audits/update_audit',
        type: "POST",
        dataType: 'script',
        data: info,
        success: function(data){

        }
      });

    }


		// var retailer_id = $('#retailer_id').val();
		// if(retailer_id == ""){
		// 	alert("please choose retailer first");
		// 	return false;
		// }


	});


  $('#retailer_id').on('change', function(){
	// alert("changed");
    var retailer_id = $(this).val();
    var info = {}
    info['retailer_id'] = $(this).val();
    info['gtin'] = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
    // info['pre_selected_brand_ids'] = pre_selected_brand_ids;
    $.ajax({
      url: '/audits/audit_product',
      type: "POST",
      dataType: 'script',
      data: info,
      success: function(data){

      }
    });
  })




});
