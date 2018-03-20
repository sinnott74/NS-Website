/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    document.getElementById("sidenav").style.width = "150px";
    document.getElementById("grid-content").style.marginLeft = "150px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    document.getElementById("sidenav").style.width = "0";
    document.getElementById("grid-content").style.marginLeft = "0";
    document.body.style.backgroundColor = "white";
}

/* Move the viewer back to the page top */
function topFunction() {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

// Have the banner text fade on scroll
$(window).scroll(function(){
    $("#banner-text-overlay").css("opacity", 1 - $(window).scrollTop() / 400);
 });
// Have the banner text stay in position on scroll
$(window).scroll(function(){
    $("#banner-text-overlay").css("top", $(window).scrollTop() + 12);
 });  
