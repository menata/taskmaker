$(document).ready ->
  $(".ddd").each (index, el) ->
    $(this).attr "id", "sortable" + index
    $(this).attr "class", "ui-sortable"
    $("#sortable" + index).sortable()
    $("#sortable" + index).disableSelection()
  #show-hide rows
  $("#report tr:odd").addClass "odd"
  $("#report tr:not(.odd)").hide()
  $("#report tr:first-child").show()
  $("#report tr.odd").bind
    mouseover: ->
      unless $(this).next("tr").hasClass("zzz")
        $(this).next("tr").toggle()
        $(this).find(".arr").toggleClass "up"
    click: ->
      $(this).next("tr").find(".l").slideToggle "slow"
      unless $(this).next("tr").hasClass("zzz")
        $(this).next("tr").addClass "zzz"
      else
        $(this).next("tr").removeClass "zzz"
  $("#report tr:not(.odd)").mouseover ->
    $(this).show()
  $("#report input#ff").click ->
    $(this).val ""
  $("#report").mouseout ->
    $("#report tr:not(.odd)").hide()
    $("#report tr.zzz").show()
  $("#report li.ui-state-default").bind
    mouseover: ->
      $(this).css "background", "rgba( 255, 0, 0, 0.1)"
    mouseout: ->
      $(this).css "background", "rgba(224, 220, 224,0.2)"
  $("#report tr#1").css "display", "none"
  $("input[value=\"x\"]").click (e) ->
    if window.confirm("Are you sure?") is true
      $(this).closest("form").send()
    else
      e.preventDefault()       

