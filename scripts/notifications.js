const popupSound = new Audio('sounds/plop.mp3');

const createNotification = (msg, options) => {
	const opts = options ? JSON.parse(options)[0] : {};
	const type = opts.type || 'info';
	const animIn = 'animated ' + (opts.animIn || 'rubberBand');
	const animOut = 'animated ' + (opts.animOut || 'flipOutY delay-4s');
	const animEnd = 'webkitAnimationEnd';
	const style = opts.css || opts.style || {};
	const animOutDelay = {};

	if (opts.animDuration) {
		style['-webkit-animation-duration'] = opts.animDuration + 's';
	}

	if (opts.animInDelay) {
		style['animation-delay'] = opts.animInDelay + 's';
	}

	if (opts.animOutDelay) {
		animOutDelay['animation-delay'] = opts.animOutDelay + 's';
	}

	const popup = $('<div/>')
		.addClass('popup')
		.addClass(type)
		.css(style)
		.addClass(animIn).one(animEnd, function() {
			$(this).addClass(animOut).css(animOutDelay).one(animEnd, function() {
				$(this).remove();
			});
		});

	$('<span>')
		.html($.parseHTML(msg))
		.appendTo(popup)
		.before(`<img src="img/sign-${type}-icon.png"/>`);

	$('.messages').prepend(popup);

	popupSound.play();
}

const setZoomLevel = lvl => $('body').css('zoom', lvl);