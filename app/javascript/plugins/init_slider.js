import "owl.carousel/dist/assets/owl.carousel.css";
import 'owl.carousel';
import $ from 'jquery';

const initSlider = () => {
    console.log("Owl carousel init")
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 10,
        items: 1.5,
        dots:false,
        nav:false,
        autoHeight: true,
        center: true
    })

    window.addEventListener ("dragmove", function (event) { event.preventDefault (); }, {passive: false});
};

export {initSlider};