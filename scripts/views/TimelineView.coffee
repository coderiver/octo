define (require) ->
	View = require 'View'


	class TimelineView extends View

		getChartOptions: ->
			# http://jsfiddle.net/NpbXE/3/

			chart:
				renderTo: 'container'
				type: 'area'

			title:
				text: null

			credits:
				enabled: false

			legend:
				enabled: false

			plotOptions:
				series:
					animation: false
					enableMouseTracking: false
					lineWidth: 0
					marker:
						enabled: false

			yAxis:
				labels:
					enabled: false

				title:
					text: null

				gridLineWidth: 0

			xAxis:
				type: 'datetime',
				labels:
					enabled: false

				lineColor: 'transparent'
				tickLength: 0


