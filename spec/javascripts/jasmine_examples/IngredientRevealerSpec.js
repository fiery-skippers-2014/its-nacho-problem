describe("IngredientRevealer.bindEvents", function(){
  it("should bind button to click event", function(){
    var seeMore = $('.see_more')
    spyOn(seeMore, 'click')
    IngredientRevealer.bindEvents()
    seeMore.click()
    expect(IngredientRevealer.toggleIngredients).toHaveBeenCalled
  });
});

