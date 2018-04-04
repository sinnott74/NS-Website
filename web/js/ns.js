/* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
function openNav() {
    var width = 325;
    $("#sidenav").css("width", width + "px");
    $("#grid-content").css("margin-left", width + "px");
    $("body").css("background-color", "rgba(0,0,0,0.4)");
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
function closeNav() {
    $("#sidenav").css("width", 0);
    $("#grid-content").css("margin-left", 0);
    $("body").css("background-color", "white");
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
        var availableColors = ['#FFE1E0', '#E7FBEA', '#E7E7FF', '#FFE5FF', '#FFFFE7'];
        $('.news-item').each(function () {
            $(this).css("box-shadow", "2px 2px");
            if($(this).parent().attr("id") == "quick-news-container") {
                var randomColor = availableColors[Math.floor(Math.random() * availableColors.length)];
                $(this).css("background-color", randomColor);
                availableColors.splice(availableColors.indexOf(randomColor),1);
            }
            else {
                $(this).css("background-color", "white");
            }
        });
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



