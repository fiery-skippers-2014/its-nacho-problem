Init = {
  bindEvents: function(){
    $('form#search-form').on('ajax:success', this.getSearchResults);
    $('.search-result-container').on('ajax:success','form', this.addToPantry);
  },

  getSearchResults: function(e, data){
    $('.search-result-container').html(data);
  },

  addToPantry: function(e, data){
    $('.pantry-container').html(data)
  }

}




$(document).ready(function(){
  Init.bindEvents()

})
