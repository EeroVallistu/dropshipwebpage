document.addEventListener('DOMContentLoaded', () => {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartContainer = document.getElementById('cart');

    cart.forEach(product => {
        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <img src="${product.image}" alt="${product.name}">
            <h2>${product.name}</h2>
            <p>${product.price}</p>
        `;
        cartContainer.appendChild(cartItem);
    });

    document.getElementById('checkout-button').addEventListener('click', () => {
        window.location.href = 'checkout.html';
    });
});