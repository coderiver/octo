define (require) ->
	Collection = require 'Collection'


	class PartsCollection extends Collection

		initialize: ->
			@reset [
				{
					name: 'Казахстан'
					value: 400
					color: '#9fc313'
				}
				{
					name: 'Таджикистан'
					value: 380
					color: '#60baea'
				}
				{
					name: 'Нигерия'
					value: 300
					color: '#f3b140'
				}
				{
					name: 'Лаос'
					value: 200
					color: '#ed745a'
				}
				{
					name: 'Чад'
					value: 170
					color: '#46bfd9'
				}
				{
					name: 'Судан'
					value: 165
					color: '#d8aaeb'
				}
			]
