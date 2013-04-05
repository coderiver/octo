define (require) ->

	numFormat: (num) ->
		num.toString().replace /(\d{1,3})(?=(?:\d{3})+$)/g, '$1 '


	hexToRgb: (hex) ->
		# Expand shorthand form (e.g. "03F") to full form (e.g. "0033FF")
		shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i
		hex = hex.replace shorthandRegex, (m, r, g, b) ->
			r + r + g + g + b + b

		result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex)

		if result
			r: parseInt(result[1], 16)
			g: parseInt(result[2], 16)
			b: parseInt(result[3], 16)
		else
			null
