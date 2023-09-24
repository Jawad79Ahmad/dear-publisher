import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pagination"
export default class extends Controller {
  connect() {
    console.log('hi pagination controller');
    var paginationElements = document.querySelectorAll('.pagination');

    paginationElements.forEach(function(pagination) {
      pagination.classList.add('flex', 'flex-wrap', 'text-xs', 'justify-center');

      var allSpans = pagination.querySelectorAll('span');
      allSpans.forEach(function(span) {
        span.classList.remove('bg-white');
        span.classList.add('py-1', 'px-2', 'mx-1', 'no-underline', 'rounded-md', 'hover:text-white', 'hover:bg-cyan-600', 'text-gray-500', 'dark:text-gray-400', 'dark:hover:text-white');
      });

      var currentSpans = pagination.querySelectorAll('span.current');
      currentSpans.forEach(function(span) {
        span.classList.remove('text-gray-500', 'dark:text-gray-400');
        span.classList.add('text-white', 'bg-cyan-600');
      });
    });
  }
}
