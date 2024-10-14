document.addEventListener('DOMContentLoaded', () => {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const checkoutContainer = document.getElementById('checkout');

    cart.forEach(product => {
        const checkoutItem = document.createElement('div');
        checkoutItem.classList.add('checkout-item');
        checkoutItem.innerHTML = `
            <img src="${product.image}" alt="${product.name}">
            <h2>${product.name}</h2>
            <p>${product.price}</p>
        `;
        checkoutContainer.appendChild(checkoutItem);
    });

    // Implement further checkout logic here, such as payment processing
});