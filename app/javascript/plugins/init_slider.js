import "owl.carousel/dist/assets/owl.carousel.css";
import 'owl.carousel';
import $ from 'jquery';

const initSlider = () => {
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

    window.addEventListener ("dragmove", function (event) { event.preventDefault (); }, {passive: false});
};

export {initSlider};
