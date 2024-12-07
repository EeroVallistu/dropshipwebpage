// loadHeader.js
document.addEventListener('DOMContentLoaded', () => {
    fetch('header.html')
        .then(response => response.text())
        .then(data => {
            document.body.insertAdjacentHTML('afterbegin', data);
            const goToCartButton = document.querySelector('.go-to-cart');
            if (goToCartButton) {
                goToCartButton.addEventListener('click', () => {
                    window.location.href = 'cart.html';
                });
            }
            updateCartCount(); // Call after header is loaded
        })
        .catch(error => console.error('Error loading header:', error));
});