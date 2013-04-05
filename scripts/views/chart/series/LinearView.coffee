define (require) ->
	_ = require '_'
	View = require 'View'
	Highcharts = require 'Highcharts'
	utils = require 'utils'


	class LinearView extends View

		initialize: ->
			@listenTo @collection, 'reset', @render
			@listenTo @collection, 'add', @addSeries
			@listenTo @collection, 'remove', @removeSeries
			@listenTo @collection, 'change:selected', @onChangeSelect


		render: ->
			@chart = new Highcharts.Chart @getChartOptions()

			@addSeriesList @collection.models, false
			@chart.redraw()


		addSeriesList: (seriesList, redraw) ->
			_.each seriesList, ((series) -> @addSeries series, redraw), this


		addSeries: (series, redraw) ->
			@chart.addSeries series.toJSON(), redraw


		removeSeries: (seriesModel) ->
			@getSeriesById(seriesModel.id).remove()


		getSeriesById: (id) ->
			_.find @chart.series, (series) ->
				series.options.id == id


		onChangeSelect: (seriesModel) ->
			if seriesModel.get 'selected'
				@collection.each (seriesModel) =>
					@setSeriesVisibility seriesModel, 0.2

				@setSeriesVisibility seriesModel, 1
			else
				@collection.each (seriesModel) =>
					@setSeriesVisibility seriesModel, 1

			@chart.redraw()


		setSeriesVisibility: (seriesModel, visibility) ->
			originalColor = seriesModel.get 'color'
			rgb = utils.hexToRgb originalColor
			color = "rgba(#{rgb.r},#{rgb.g},#{rgb.b},#{visibility})"

			series = @getSeriesById(seriesModel.id)
			@setSeriesColor(series, color)


		setSeriesColor: (series, color) ->
			series.color = color
			series.graph.attr
				stroke: color
#
#			@chart.legend.colorizeItem(series, series.visible)
#
			_.each series.data, (point) ->
				point.graphic.attr
					fill: color


		getMinTickInterval: ->
			return unless model = @collection.at(0)
			data = model.get 'data'
			data[1][0] - data[0][0]


		getChartOptions: ->
			Highcharts.setOptions {
				lang:
					shortMonths: [
						'Янв', 'Фев', 'Мар', 'Апр'
						'Май', 'Июн', 'Июл', 'Авг'
						'Сен', 'Окт', 'Ноя', 'Дек'
					]

					months: [
						'Январь', 'Февраль', 'Март', 'Апрель'
						'Май', 'Июнь', 'Июль', 'Август'
						'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
					]

					weekdays: [
						'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'
					]

					thousandsSep: ' '
					decimalPoint: ','
			}

			chart:
				renderTo: @el
				type: 'line'
				marginRight: 130
				marginTop: 70

			title:
				text: null

			credits:
				enabled: false

			legend:
				enabled: false

			xAxis:
				type: 'datetime'
				gridLineWidth: 1
				gridLineDashStyle: 'ShortDot'
				#minorTickInterval: 'auto'
				lineColor: '#60baea'
				lineWidth: 3
				dateTimeLabelFormats:
					second: '%H:%M:%S',
					minute: '%H:%M',
					hour: '%H:%M',
					day: '%e %b',
					week: '%e %B',
					month: '%B %Y',
					year: '%Y'

				minTickInterval: @getMinTickInterval()
				labels:
					y: 25
					style:
						color: '#282f34'
						fontWeight: 'bold'
						fontSize:'14px'



			yAxis:
				title:
					text: null

				labels:
					x: -100
					style:
						color: '#282f34'
						fontWeight: 'bold'
						fontSize:'14px'

#				plotLines: [{
#					value: 0
#					width: 1
#					color: '#808080'
#				}]

				gridLineWidth: 2
				gridLineDashStyle: 'ShortDot'
				#minorTickInterval: 'auto'
				endOnTick: false
				min: 0


			plotOptions:
				line:
					marker:
						symbol: 'circle'

				series:
					animation: false

