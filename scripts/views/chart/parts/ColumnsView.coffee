define (require) ->
	View = require 'View'
	Highcharts = require 'Highcharts'


	class ColumnsView extends View

		render: ->
			@chart = new Highcharts.Chart @getChartOptions()

			@addColumns()
			@chart.redraw()


		addColumns: ->
			@collection.each @addColumn, this


		addColumn: (model) ->
			@addCategory model.get('name')
			@addPoint model.get('value'), model.get('color')


		addPoint: (value, color, redraw = false) ->
			series = @chart.series[0]

			series.addPoint
				y: value
				color: color
			, redraw


		addCategory: (name, redraw = false) ->
			categories = @chart.xAxis[0].categories
			categories.push name
			@chart.xAxis[0].setCategories categories, redraw


		getChartOptions: ->
			chart:
				renderTo: @el
				type: 'column'

			title:
				text: null

			credits:
				enabled: false

			legend:
				enabled: false

			yAxis:
				title:
					text: null

				gridLineWidth: 2
				gridLineDashStyle: 'ShortDot'
				minorTickInterval: 'auto'
				endOnTick: false
				min: 0

			xAxis:
				gridLineWidth: 2
				minorTickInterval: 'auto'
				gridLineDashStyle: 'ShortDot'
				categories: []
				lineColor: 'transparent'
				tickLength: 0

			plotOptions:
				series:
					colorByPoint: true
					animation: false

			series: [{
				data: []
				color: ''
				dataLabels:
					enabled: true,
					color: '#000',
					align: 'center',
					style:
						fontSize: '13px',
						fontFamily: 'Verdana, sans-serif'
			}]