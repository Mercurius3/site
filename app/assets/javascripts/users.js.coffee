$ ->
  $(".change > .change_form").hide()
  $(".change a").click (event)->
    event.preventDefault()
    $(this).closest(".change").children(".change_form").toggle("slow")
    $(this).closest(".change").children(".change_info").toggle()
  $("#confirm_changes").hide()
  $("#confirm_changes_button").click (event)->
    event.preventDefault()
    $("#confirm_changes").toggle("slow")
    $("#confirm_changes_button").toggle()