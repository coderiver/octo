$(document).ready(function() {

	$('.inp-arr').hover(
		function () {
			$(this).children('.hint').fadeIn();
		},
		function () {
			$(this).children('.hint').fadeOut();
		}
	);

	$('.category__selected').click(function() {
		if ($(this).hasClass('category__selected_open')){
				$(this).next('.category__drop').fadeOut('fast');
				$(this).removeClass('category__selected_open');
			}
			else{
				$(this).next('.category__drop').fadeIn('fast');
				$(this).addClass('category__selected_open');
			}
		return false;
	});

	$('.category__list li a').click(function() {
		var temporary = $('.category__selected span').html();
		$('.category__selected span').html($(this).html());
		$(this).html(temporary);
		$('.category__drop').fadeOut('fast');
		$('.category__selected').removeClass('category__selected_open');
		return false;
	});
});