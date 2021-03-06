import "owl.carousel/dist/assets/owl.carousel.css";
import 'owl.carousel';
import $ from 'jquery';

const initSlider = () => {
    if (document.querySelector('.owl-carousel')){
        console.log("Owl carousel init")
        $('.owl-carousel').owlCarousel({
            loop: false,
            margin: 50,
            items: 1.4,
            dots:false,
            nav:false,
            autoHeight: true,
            center: true
        })
        
        $('#owl-carousel-hp').owlCarousel({
            loop: true,
            margin: 30,
            items: 1.7,
            dots:true,
            nav:true,
            autoHeight: true,
            center: true
        })
        window.addEventListener ("dragmove", function (event) { event.preventDefault (); }, {passive: false});
    }
};

export {initSlider};
