IngredientRevealer = {
  bindEvents: function(){
    $('.see_more').on('click', this.toggleIngredients)
  },

  toggleIngredients: function(event){
    event.preventDefault()
    $(this).next('.toggle').slideToggle()
  }
}



