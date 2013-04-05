define (require) ->
	View = require 'View'
	Highcharts = require 'Highcharts'


	class DonutView extends View

		render: ->
			@chart = new Highcharts.Chart @getChartOptions()

			@addChanks()


		addChanks: ->
			@collection.each @addChank, this


		addChank: (model) ->
			series = @chart.series[0]
			series.addPoint
				name: model.get('name')
				y: model.get('value')
				color: model.get('color')


		getChartOptions: ->
			chart:
				renderTo: @el
				type: 'pie'

			title:
				text: null

			credits:
				enabled: false

			legend:
				enabled: false

			plotOptions:
				series:
					animation: false

				pie:
					innerSize: '50%'


			series: [{
				data: []
				dataLabels:
					formatter: ->
						"#{ @point.name } <br> #{ Math.round @point.percentage }%"
			}]
