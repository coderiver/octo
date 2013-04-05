define (require) ->
	RowView = require 'views/table/RowView'
	template = require 'tpl!templates/average-row.html'


	class AverageRowView extends RowView

		template: template

		className: 't__row_mid'