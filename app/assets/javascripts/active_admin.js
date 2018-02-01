//= require active_admin/base
//= require activeadmin_addons/all
$(document).on("change", "#booking_requirement_start, #booking_requirement_end", function(){
  if ($("#booking_requirement_start").length && $("#booking_requirement_end").length){
    var diff = ( new Date($("#booking_requirement_end").val()) - new Date($("#booking_requirement_start").val()) ) / 1000 / 60 / 60; 
    $("#booking_duration").val(diff)
  }
});
$(document).on("change", "#booking_ride_start, #booking_ride_end", function(){
  if ($("#booking_ride_start").length && $("#booking_ride_end").length){
    var diff = ( new Date($("#booking_ride_end").val()) - new Date($("#booking_ride_start").val()) ) / 1000 / 60 / 60; 
    $("#booking_ride_duration").val(diff)
    $("#booking_on_ride_duration").val(diff)
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
  }
});

$(document).on("change", "#booking_pre_ride_duration", function(){
  $("#booking_pre_ride_duration_amount").val((parseInt($(this).val()) || 0) * 100);
});

$(document).on("change", "#booking_post_ride_duration", function(){
  $("#booking_post_ride_duration_amount").val((parseInt($(this).val()) || 0) * 100);
});
$(document).on("change", "#booking_ride_amount, #booking_pre_ride_duration_amount, #booking_pre_ride_distance_amount, #booking_post_ride_duration_amount, #booking_post_ride_distace_amount, #booking_food_charges, #booking_accomodation_charges, #booking_toll_parking_charges, #booking_other_charges, #booking_tip_charges, #booking_total_waiver, #booking_clap_waiver, #booking_collected_from_customer", function(){
  var total = (parseInt($("#booking_on_ride_amount").val()) || 0) + (parseInt($("#booking_pre_ride_duration_amount").val()) || 0) + (parseInt($("#booking_pre_ride_distance_amount").val()) || 0) + (parseInt($("#booking_post_ride_duration_amount").val()) || 0) + (parseInt($("#booking_post_ride_distance_amount").val()) || 0) + (parseInt($("#booking_food_charges").val()) || 0) + (parseInt($("#booking_accomodation_charges").val()) || 0) + (parseInt($("#booking_toll_parking_charges").val()) || 0) + (parseInt($("#booking_other_charges").val()) || 0) + (parseInt($("#booking_tip_charges").val()) || 0) - (parseInt($("#booking_total_waiver").val()) || 0) - (parseInt($("#booking_clap_waiver").val()) || 0);
  var expense = (parseInt($("#booking_pre_ride_duration_amount").val()) || 0) + (parseInt($("#booking_post_ride_duration_amount").val()) || 0) + (parseInt($("#booking_food_charges").val()) || 0) + (parseInt($("#booking_accomodation_charges").val()) || 0) + (parseInt($("#booking_toll_parking_charges").val()) || 0) + (parseInt($("#booking_total_waiver").val()) || 0) + (parseInt($("#booking_clap_waiver").val()) || 0);
  var driver_expense = expense - (parseInt($("#booking_clap_waiver").val()) || 0);
  $("#booking_net_billing").val(total);
  $("#booking_expense").val(expense);
  $("#booking_driver_expense").val(driver_expense);
  $("#booking_after_expense_trip").val(total - expense);
  $("#booking_clap_expenses").val((parseInt($("#booking_clap_waiver").val())|| 0));
  $("#booking_balance").val(total - (parseInt($("#booking_collected_from_customer").val())));
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
    }
  })
});
