PantryOrganizer = {
  bindEvents: function(){
    $('form#search-form').on('ajax:success', this.getSearchResults);
    $('.search-result-container').on('ajax:success','form', this.addToPantry);
    $('.pantry-container').on('ajax:success', 'form', this.deletePantryItem);
  },

  getSearchResults: function(e, data){
    $('.search-result-container').html(data);
  },

  addToPantry: function(e, data){
    $('.pantry-container').html(data)
  },

  deletePantryItem: function(e, data){
    $('.pantry-container').html(data)
  }

}




