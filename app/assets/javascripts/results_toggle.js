// $('ul').click(function() {
//   $('.toggle').slideToggle();
//   console.log(this);
// });

$('ol').on("click", ".see_more", function(event) {
	event.preventDefault();
	$(this).next('.toggle').slideToggle();
});