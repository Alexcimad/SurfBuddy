import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
    console.log("ok")
    $('#spot_review_rating').barrating({
        theme: 'css-stars'
        });
};
  
export { initStarRating };