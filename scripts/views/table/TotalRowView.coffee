define (require) ->
	RowView = require 'views/table/RowView'
	template = require 'tpl!templates/total-row.html'


	class TotalRowView extends RowView

		template: template

		className: 't__row_all'