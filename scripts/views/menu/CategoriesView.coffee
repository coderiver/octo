define (require) ->
	$ = require '$'
	View = require 'View'


	class CategoryView extends View

		events:
			'click @toggle': 'toggleDropdown'
			'click .category__list li': 'changeCategory'

		initialize: ->
			@listenTo this, 'change:category', @render


		render: ->
			@setCurrent @model.get('category')


		setCurrent: (name) ->
			@_swapElements @getPointByName(name), @$('@toggle').find('span')


		getPointByName: (name) ->
			@$ "span[data-name=#{ name }]"


		toggleDropdown: (event) ->
			event.stopPropagation()
			event.preventDefault()
			@showDropdown not @$('@toggle').hasClass('category__selected_open')


		showDropdown: (show) ->
			target = @$ '@toggle'
			target.next('.category__drop').toggle show
			target.toggleClass 'category__selected_open', show


		changeCategory: (event) ->
			event.stopPropagation()
			event.preventDefault()
			target = $(event.currentTarget)

			@model.set category: target.find('span').data('name')

			@_swapElements @$('@toggle').find('span'), target.find('span')
			@showDropdown false


		_swapElements: (a, b) ->
			copy_a = a.clone true
			copy_b = b.clone true
			a.replaceWith copy_b
			b.replaceWith copy_a
