//= require active_admin/base
//= require activeadmin_addons/all
$(document).on("change","#booking_pickup_location", function(){
  $("#booking_ride_start_point").val($(this).val());
});
$(document).on("change","#booking_requirement_start, #booking_requirement_end", function(){
  if ($("#booking_requirement_start").val())
    $("#booking_ride_start").val($("#booking_requirement_start").val());
  if ($("#booking_requirement_start").val() && $("#booking_requirement_end").val()){
    //$("#booking_ride_end").val($("#booking_requirement_end").val());
    var diff = ( new Date($("#booking_requirement_end").val().replace(/-/g,"/")) - new Date($("#booking_requirement_start").val().replace(/-/g,"/")) ) / 1000 / 60 / 60; 
    $("#booking_duration").val(diff)
    //$("#booking_ride_duration").val(diff)
    //$("#booking_on_ride_duration").val(diff)
  }
});
$(document).on("change","#booking_ride_start, #booking_ride_end, #booking_pre_ride_duration, #booking_post_ride_duration, #booking_ride_amount, #booking_pre_ride_duration_amount, #booking_pre_ride_distance_amount, #booking_post_ride_duration_amount, #booking_post_ride_distance_amount, #booking_food_charges, #booking_accomodation_charges, #booking_toll_parking_charges, #booking_other_charges, #booking_tip_charges, #booking_total_waiver, #booking_clap_waiver, #booking_collected_from_customer, #booking_collected_from_customer, #booking_ride_type", function(){
  if ($("#booking_ride_start").val() && $("#booking_ride_end").val()){
    if ($("#booking_ride_type").val() === "Trip") {
      $("#booking_discount").val(0);
      var diff = ( new Date($("#booking_ride_end").val().replace(/-/g,"/")) - new Date($("#booking_ride_start").val().replace(/-/g,"/")) ) / 1000 / 60 / 60; 
      $("#booking_ride_duration").val(diff)
      $("#booking_on_ride_duration").val(diff)
      var ride_end = new Date($("#booking_ride_end").val().replace(/-/g,"/"));
      var ride_start = new Date($("#booking_ride_start").val().replace(/-/g,"/"));
      var ride_start_mid = new Date($("#booking_ride_start").val().replace(/-/g,"/"));
      var ride_start_six = new Date($("#booking_ride_start").val().replace(/-/g,"/").split(" ")[0] + " " + "18:00:00");
      ride_start_mid.setDate(ride_start_mid.getDate() + 1);
      ride_start_mid.setHours(0,0,0,0);
      var ride_end_mid = new Date($("#booking_ride_end").val().replace(/-/g,"/").split(" ")[0] + " " + "00:00:00");
      var ride_end_ten = new Date($("#booking_ride_end").val().replace(/-/g,"/").split(" ")[0] + " " + "22:00:00");
      var ride_end_five = new Date($("#booking_ride_end").val().replace(/-/g,"/").split(" ")[0] + " " + "05:00:00");
      if (ride_start < ride_start_six) {
        var pre_amount = 1000;
      } else {
        diff = ( ride_start_mid - ride_start) / 1000 / 60 / 60;
        var pre_amount = diff * 100;
      }
      var trip_diff = (ride_end_mid - ride_start_mid) / 1000 /60 / 60 / 24;
      var trip_amount = (trip_diff) * 1000; 
      if (ride_end > ride_end_five && ride_end < ride_end_ten) {
        var post_amount = 1000;
      } else {
        if (ride_end < ride_end_ten) {
          var diff = (ride_end - ride_end_ten.setDate(ride_end_ten.getDate() - 1)) / 1000 / 60 / 60;
          var post_amount = diff * 100;
        } else {
          var diff = (ride_end - ride_end_ten) / 1000 / 60 / 60;
          var post_amount = diff * 100;
        }
      }
      $("#booking_on_ride_amount").val(pre_amount + trip_amount + post_amount);
    } else {
      var diff = ( new Date($("#booking_ride_end").val().replace(/-/g,"/")) - new Date($("#booking_ride_start").val().replace(/-/g,"/")) ) / 1000 / 60 / 60; 
      $("#booking_ride_duration").val(diff)
      $("#booking_on_ride_duration").val(diff)
      //diff = diff + ( parseInt($("#booking_pre_ride_duration").val()) || 0) + ( parseInt($("#booking_post_ride_duration").val()) || 0);
      if (diff <= 3){
        if ($("#booking_ride_start").val().split(" ")[1].split(":")[0] > 8 && $("#booking_ride_start").val().split(" ")[1].split(":")[0] < 18)
          $("#booking_on_ride_amount").val("300");
        if ($("#booking_ride_start").val().split(" ")[1].split(":")[0] > 18)
          $("#booking_on_ride_amount").val("400");
        if ($("#booking_ride_start").val().split(" ")[1].split(":")[0] < 6)
          $("#booking_on_ride_amount").val("400");
      } else {
        $("#booking_on_ride_amount").val(diff * 100);
      }
      diff = diff + ( parseInt($("#booking_pre_ride_duration").val()) || 0) + ( parseInt($("#booking_post_ride_duration").val()) || 0);
      var ride_start = new Date($("#booking_ride_start").val().replace(/-/g,"/"));
      var ride_start_two = new Date($("#booking_ride_start").val().replace(/-/g,"/").split(" ")[0] + " " + "14:00:00");
      if (diff > 7 && ride_start_two > ride_start){
        var discount_minus = ((parseInt(diff/12)) * 200);
        rem = diff % 12;
        var more = 0;
        if (rem > 7)
          more = 100;
        $("#booking_discount").val(discount_minus + more );
      } else {
        $("#booking_discount").val(0);
      }
    }
  }
  if ($("#booking_post_ride_duration").val())
    $("#booking_post_ride_duration_amount").val((parseInt($("#booking_post_ride_duration").val()) || 0) * 100);
  if ($("#booking_pre_ride_duration").val())
    $("#booking_pre_ride_duration_amount").val((parseInt($("#booking_pre_ride_duration").val()) || 0) * 100);
  var total = (parseInt($("#booking_on_ride_amount").val()) || 0) + (parseInt($("#booking_pre_ride_duration_amount").val()) || 0) + (parseInt($("#booking_pre_ride_distance_amount").val()) || 0) + (parseInt($("#booking_post_ride_duration_amount").val()) || 0) + (parseInt($("#booking_post_ride_distance_amount").val()) || 0) + (parseInt($("#booking_food_charges").val()) || 0) + (parseInt($("#booking_accomodation_charges").val()) || 0) + (parseInt($("#booking_toll_parking_charges").val()) || 0) + (parseInt($("#booking_other_charges").val()) || 0) + (parseInt($("#booking_tip_charges").val()) || 0) - (parseInt($("#booking_total_waiver").val()) || 0) - (parseInt($("#booking_clap_waiver").val()) || 0) - (parseInt($("#booking_discount").val()) || 0);
  var expense = (parseInt($("#booking_pre_ride_distance_amount").val()) || 0) + (parseInt($("#booking_post_ride_distance_amount").val()) || 0) + (parseInt($("#booking_food_charges").val()) || 0) + (parseInt($("#booking_accomodation_charges").val()) || 0) + (parseInt($("#booking_toll_parking_charges").val()) || 0) + (parseInt($("#booking_total_waiver").val()) || 0) + (parseInt($("#booking_clap_waiver").val()) || 0);
  var expense_after = (parseInt($("#booking_pre_ride_distance_amount").val()) || 0) + (parseInt($("#booking_post_ride_distance_amount").val()) || 0) + (parseInt($("#booking_food_charges").val()) || 0) + (parseInt($("#booking_accomodation_charges").val()) || 0) + (parseInt($("#booking_toll_parking_charges").val()) || 0);
  var driver_expense = expense - (parseInt($("#booking_clap_waiver").val()) || 0);
  $("#booking_net_billing").val(total);
  $("#booking_expense").val(expense);
  $("#booking_driver_expense").val(driver_expense);
  $("#booking_after_expense_trip").val(total - expense_after);
  $("#booking_clap_expenses").val((parseInt($("#booking_clap_waiver").val())|| 0) + (( parseInt($("#booking_total_waiver").val()) || 0)/2));
  $("#booking_balance").val(total - (parseInt($("#booking_collected_from_customer").val()) || 0));
  if (($("#booking_collected_from_customer").val() < total) && ($("#booking_collected_from_customer").val() > 0)) {
    $("#booking_collection_status").val("Partially Collected").change();
  } else if ($("#booking_collected_from_customer").val() >= total) {
    $("#booking_collection_status").val("Collected").change();
  } else if ($("#booking_collected_from_customer").val() <= 0) {
    $("#booking_collection_status").val("Pending").change();
  }
});
//$("#booking_customer_id").change(function(){
$(document).on("change", "#booking_customer_id", function(){
  $.ajax({
    type: "post",
    url: "/home/contact_number.json",
    data: {
      customer_id: $(this).val()
    },
    success: function(json){
      $("#booking_contact_number").val(json.contact_number);
      $("#booking_alternate_number").val(json.alternate_number);
      $("#booking_vehicle_number").val(json.vehicle_number);
      $("#booking_vehicle_id").val(json.vehicle).change();
      $("#booking_additional_requirement").val(json.requirement);
    }
  })
});
$(document).on("change", "#booking_driver_id", function(){
  $.ajax({
    type: "post",
    url: "/home/driver_details.json",
    data: {
      driver_id: $(this).val()
    },
    success: function(json){
      $("#booking_ride_agency").val(json.agency);
    }
  })
});
