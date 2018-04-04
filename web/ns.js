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


$(document).ready(function() {

   
    $(".count").ready(function() {
        $('.count').each(function () {
            $(this).prop('Counter',0).animate({
                Counter: $(this).text()
            }, {
                duration: 6000,
                easing: 'swing',
                step: function (now) {
                    $(this).text(Math.ceil(now));
                }
            });
        });
    });

    $("#banner").ready(function() {
        // Have the banner text fade on scroll
        $(window).scroll(function(){
            $(".banner-text-overlay").css("opacity", 1 - $(window).scrollTop() / 550);

            var bannerTextOpacity = $(".banner-text-overlay").css("opacity");
            if(bannerTextOpacity > 0) {
                $(".banner-text-overlay").css("z-index", 0);
            } else {
                $(".banner-text-overlay").css("z-index", -1);
            }
        });
        // Have the banner text stay in position on scroll
        $(window).scroll(function(){
            $(".banner-text-overlay").css("top", $(window).scrollTop() + 12);
        }); 
    });  


    $(".news-item").ready(function() {
        // Colours each news item box 
        var newsItems = $('.news-item');
        var availableColors = ['#FFE1E0', '#E7FBEA', '#E7E7FF', '#FFE5FF', '#FFFFE7'];
        for(var i = 0; i < newsItems.length; i++) {
            var randomColor = availableColors[Math.floor(Math.random() * availableColors.length)];
            newsItems[i].style.backgroundColor = randomColor;
            newsItems[i].style.boxShadow = "2px 2px";
            availableColors.splice(availableColors.indexOf(randomColor),1);
        }
    });


    $(".accordion").ready(function(){
        var acc = $(".accordion");
        

        for (var i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                } 
            });
        }
    });

});



