// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"
import _ from "lodash";


// Example usage of lodash function
const array = [1, 2, 3, 4];
const revesed_array = _.reverse(array);
console.log(revesed_array); // Output: [4, 3, 2, 1]
