$(document).ready(function(){
  $('#sign-up-link').on('click', signupForm)
  $('#login-link').on('click', loginForm)
})

var signupForm = function(){
  $('#sign-up').slideToggle()
}

var loginForm = function(){
  $('#log-in').slideToggle()
}





// // Set up an event listener for the contact form.
// $(form).submit(function(event) {
//     // Stop the browser from submitting the form.
//     event.preventDefault();

// Serialize the form data.
// var formData = $(form).serialize();
// // });

// // Submit the form using AJAX.
// $.ajax({
//     type: 'POST',
//     url: $(form).attr('action'),
//     data: formData
// // })

// .fail(function(data) {
//     // Make sure that the formMessages div has the 'error' class.
//     $(formMessages).removeClass('success');
//     $(formMessages).addClass('error');

//     // Set the message text.
//     if (data.responseText !== '') {
//         $(formMessages).text(data.responseText);
//     } else {
//         $(formMessages).text('Oops! An error occured and your message could not be sent.');
//     }
// });
