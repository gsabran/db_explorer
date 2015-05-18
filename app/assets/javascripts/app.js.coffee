$(document).on "page:change", ->
  setTimeout ->
    $("table.table-condensed.table-striped.table").fixedHeaderTable
      footer: false
      cloneHeadToFoot: false
      fixedColumn: true
      height: "#{$(window).height() - 250}"
      width: "#{$(window).width() - 400}"
      fixedColumns: 2

    options = $("#table-list option")
    new_options = []
    map = {}
    for k in options
      k = $(k)
      new_options.push $(k).val()
      map[$(k).val()] = k
      $(k).remove()
    new_options.sort()
    for k in new_options
      $("#table-list").append(map[k])

  , 500

  $("#table-list").on 'change', (e) ->
    url = $(e.target).data("url") + "/#{$(e.target).val()}"
    Turbolinks.visit url
