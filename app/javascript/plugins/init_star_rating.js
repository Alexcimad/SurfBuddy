import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
    $('#spot_review_rating').barrating({
        theme: 'css-stars'
        });
};
  
export { initStarRating };