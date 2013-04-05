define (require) ->
	View = require 'View'
	CheckedCountView = require 'views/table-top/CheckedCountView'


	class TableTopView extends View

		events:
			'click @show-checked': 'showChecked'
			'click @show-all': 'showAll'

		initialize: ->
			@listenTo @model, 'change:showAll', @renderButtons
			@listenTo @model, 'change:checkedCount', @preventShowNothing


		render: ->
			new CheckedCountView
				el: @$ '@checked-count'
				model: @model
				autoRender: true

			@renderButtons()


		renderButtons: ->
			if @model.get 'showAll'
				@$('@show-all').addClass('active')
				@$('@show-checked').removeClass('active')
			else
				@$('@show-all').removeClass('active')
				@$('@show-checked').addClass('active')


		showChecked: (event) ->
			event.preventDefault()
			if @model.get 'checkedCount'
				@model.set showAll: false


		showAll: ->
			event.preventDefault()
			@model.set showAll: true


		preventShowNothing: ->
			unless @model.get 'checkedCount'
				@model.set showAll: true

