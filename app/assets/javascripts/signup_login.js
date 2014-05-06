UserIntro = {
  bindEvents: function(){
    $('#sign-up-link').on('click', this.signupForm);
    $('#login-link').on('click', this.loginForm)
  },

  signupForm: function(){
    $('#sign-up').slideToggle()
  },

  loginForm: function(){
    $('#log-in').slideToggle()
  }
}


