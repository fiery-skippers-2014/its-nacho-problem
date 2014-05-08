UserIntro = {
  bindEvents: function(){
    $('#sign-up-link').on('click', this.signupForm);
    $('#login-link').on('click', this.loginForm)
  },

  signupForm: function(){
    $('#log-in').hide()
    $('#sign-up').slideToggle()
  },

  loginForm: function(){
    $('#sign-up').hide()
    $('#log-in').slideToggle()
  }
}