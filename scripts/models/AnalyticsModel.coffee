define (require) ->
	Model = require 'Model'


	class AnalyticsModel extends Model

		defaults:
			category: 'campaigns'
			subcategory: 'common'
			type: 'clicks'

		getUrl: ->
			'test'


		isCommonSelected: ->
			@get('subcategory') == 'common'