$ ->
	if $('input#search').length > 0
		$('#search').autocomplete
			minLength: 0
			source:->
				$.ajax
					url: '/releases/search'
					method: 'GET'
					dataType: 'html'
					data:
						search: $('#search').val()
					beforeSend: (jqXHR, settings) ->
						$('#toolbar img').show()
					success: (data, textStatus, jqXHR) ->
						$('#toolbar img').hide()
						$('tr').remove(':not(#headers)')
						$('table').append(data)
						