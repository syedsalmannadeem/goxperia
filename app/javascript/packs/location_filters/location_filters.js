import Rails from '@rails/ujs'

var form = document.getElementById('location-filter-form');

document.addEventListener('input', function (event) {
	if (event.target.id !== 'category-select' && event.target.id !== 'location-select') return;
	Rails.fire(form, 'submit');
}, false);