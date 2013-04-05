define (require) ->
	$ = require '$'
	Model = require 'Model'
	moment = require 'moment'


	class TimelineModel extends Model

		url: ->
			url = 'timeline'
			param = $.param
				type: 'ctr' # просмотры, ctr ...
				detail: 'day' # ['day', 'week', 'month']
				begin: 0 # timeoffset
				end: 1 # timeoffset

			"#{url}?#{param}"


		defaults:
			begin: moment().day -10
			end: moment()


		initialize: ->




