$(function() {

	//ottengo form
	var form = $('#contattaci');

	//ottengo messaggio
	var formMessages = $('#messaggio_c');

	//imposto in ascolto la funzione
	$(form).submit(function(e) {
		//Impedisco al browser di fare il submit, per usare ajax
		e.preventDefault();

		//ricavo dati form
		var formData = $(form).serialize();

		//faccio submit con ajax
		$.ajax({
			type: 'POST',
			url: $(form).attr('action'),
			data: formData
		})
		.done(function(response) {
			// Make sure that the formMessages div has the 'success' class.
			$(formMessages).removeClass('error');
			$(formMessages).addClass('success');

			// Set the message text.
			$(formMessages).text(response);

			// Clear the form.
			$('#name').val('');
			$('#email').val('');
			$('#subject').val('');
			$('#message').val('');
		})
		.fail(function(data) {
			// Make sure that the formMessages div has the 'error' class.
			$(formMessages).removeClass('success');
			$(formMessages).addClass('error');

			// Set the message text.
			if (data.responseText !== '') {
				$(formMessages).text(data.responseText);
			} else {
				$(formMessages).text('Oops! An error occured and your message could not be sent.');
			}
		});

	});

});
