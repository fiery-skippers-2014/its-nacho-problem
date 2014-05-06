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
