define (require) ->

	ChartModel = require 'models/chart'
	ChartView = require 'views/chart'

	chartModel = new ChartModel()
	chartView = new ChartView model: chartModel
	chartView.render()

