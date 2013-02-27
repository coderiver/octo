define (require) ->

	Model = require 'core/model'


	class ChartModel extends Model

		defaults:
			xAxis: ['Сентябрь 2012', 'Октябрь 2012', 'Ноябрь 2012',
					'Декабрь 2012', 'Январь 2013', 'Февраль 2013',
					'Март 2013', 'Апрель 2013']
			series: [
				{
					name: 'Реклама для каналов'
					data: [50, 210, 305, 195, 270, 360, 420, 470]
				}
				{
					name: 'Colins Collection'
					data: [100, 105, 210, 150, 160, 400, 390, 200]
				}
			]


