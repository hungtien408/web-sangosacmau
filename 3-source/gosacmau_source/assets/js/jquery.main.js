function pageLoad() {
    mypageload();
}
(function ($) {
    $(window).load(function () {
    });
    $(function () {
        myfunload();
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").clone().appendTo($("#menuMobile"));
    $("#menuMobile input").remove();
    $("#menuMobile > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobile li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu li:last-child").addClass("last");
    $("#menu li:first-child").addClass("fisrt");
    jQuery('#menu').superfish({
        animation: { height: 'show' },
        delay: 200
    });
    $(".menu-level").menulevel({
        csscurrent: "active",
        cssicon: true,
        cssdown: "fa fa-caret-down",
        cssup: "fa fa-caret-up"
    });
    $(".menu-level li:last-child").addClass("last");
    $(".menu-level .active").find("ul:first").show();
    $('#sliderBanner').nivoSlider({
        pauseOnHover: false
    });
    $('#sliderAds').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: false,
        dots: false,
        arrows: false,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
    });
    $(".fancybox").fancybox({
        padding: 10,
        wrapCSS: 'pro-popup',
        openEffect: 'elastic',
        closeEffect: 'elastic',

        helpers: {
            title: {
                type: 'inside'
            }
        }
    });
   
    if ($('#silderProduct').size() == 1) {
        var silderProduct = $('#silderProduct').imagesLoaded(function () {

            silderProduct.owlCarousel({
                margin: 10,
                loop: true,
                margin: 10,
                nav: true,
                autoplay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 4
                    }
                }
            });

            silderProduct.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-img" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
        });
    }
    $('#bxsliderText').bxSlider({
        ticker: true,
        speed: 16000
    });
    if ($("#sliderDetails").size() == 1) {
        var sliderdetails = $('#sliderDetails').imagesLoaded(function () {
            sliderdetails.find(".slider-for").slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: false,
                infinite: false,
                fade: true,
                asNavFor: '#sliderDetails .slider-nav'
            }).textHeight({
                activetit: true,
                listcss: [{ cssname: ".images-box" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: true
            });
            sliderdetails.find(".slider-nav").slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                asNavFor: '#sliderDetails .slider-for',
                dots: false,
                infinite: false,
                focusOnSelect: true
            }).textHeight({
                activetit: true,
                listcss: [{ cssname: ".small-img span" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: false,
                csstr: ".element-item",
                max: false
            });
        });
    }
    mapfooterre();
    mymap();
    myfunsroll();
}
/*=========================================================================*/
function mypageload() {
    $(".select").uniform();
    $(".fullbox-img").bgsizebox({
        fimg: true,
        imgcss: "hideo",
        attrname: "data-src"
    });
    myListTb();
}
/*========================================================================*/
function myListTb() {
    if ($('.isotopelist').size() > 0) {
        var isolist = $('.isotopelist').imagesLoaded(function () {
            isolist.isotope({
                itemSelector: '.element-item',
                layoutMode: 'fitRows'
            });
        });
    }
    if ($('.product-tb').size() > 0) {
        var tbpro;
        var producttb = $('.product-tb').imagesLoaded(function () {
            producttb.textHeight({
                activetit: true,
                listcss: [{ cssname: ".product-img" }, { cssname: ".product-name" }, { cssname: ".product-code" }],
                desbool: false,
                listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                tbrow: true,
                csstr: ".element-item",
                max: true
            });
            clearTimeout(tbpro);
            tbpro = setTimeout(function () {
                producttb.isotope({
                    itemSelector: '.element-item',
                    layoutMode: 'fitRows'
                });
            }, 100);
        });
    }
}
/*===============================*/
function myfunsroll() {
    menusroll();
    mysroll();
    $("#sroltop a").click(function () {
        $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
        return false;
    });
}
function mysroll() {
    mysrol();
    $(window).scroll(function () {
        mysrol();
    });
}
function mysrol() {
    var topsroll = $(window).scrollTop();
    if (topsroll > 100) {
        $("#sroltop").stop(true, true).animate({ "opacity": 0.8 }, 500);
    } else {
        $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
    }
}
function menusroll() {
    var htop = $("#header").height();
    srollmenu(htop);
    $(window).scroll(function () {
        srollmenu(htop);
    });
}
function srollmenu(htop) {
    if ($(window).scrollTop() > htop) {
        $("#header").addClass("header-sroll");
    } else {
        $("#header").removeClass("header-sroll");
    }
}
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}
function mapfooterre() {
    mapfooters();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mapfooters();
        }, 500);
    });
}
function mapfooters() {
    $('.map-footer').remove();
    if ($(window).width() > 768) {
        $('#mapfooter').append('<div class="map-footer"><iframe id="iframe" src="mapfooter.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}