/*
// When the user scrolls the page, execute stickToTop 
window.onscroll = function() {stickToTop()};



// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function stickToTop() {
	
	// Get the navbar
	var navbar = document.getElementById("navigation");
				
	// Get the offset position of the navbar
	var sticky = navbar.offsetTop;

  	if (window.pageYOffset >= sticky) {
    	navbar.classList.add("sticky")
	 } else {
    	navbar.classList.remove("sticky");
	 }
}
*/