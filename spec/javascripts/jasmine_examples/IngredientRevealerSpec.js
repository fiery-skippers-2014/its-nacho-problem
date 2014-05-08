describe("IngredientRevealer", function(){
  var seeMore = $('.see_more')
  var click = jQuery.Event("click", { target: $('.see_more') });
  spyOn(seeMore, 'click')
  it("should bind button to click event", function(){
    IngredientRevealer.bindEvents()
    seeMore.click()
    expect(IngredientRevealer.toggleIngredients).toHaveBeenCalled
  });
});



