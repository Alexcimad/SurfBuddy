import $ from 'jquery';
import "jquery-bar-rating";

const initStarRating = () => {
    $('#spot_review_rating').barrating({
        theme: 'css-stars'
        });
};
  
export { initStarRating };