/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    var width = 350;
    document.getElementById("sidenav").style.width = width + "px";
    document.getElementById("grid-content").style.marginLeft = width + "px";
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
