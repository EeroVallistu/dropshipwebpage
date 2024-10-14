document.addEventListener('DOMContentLoaded', () => {
    console.log('script.js loaded'); // Debug log
    updateCartCount(); // Call updateCartCount on page load

    let products = JSON.parse(localStorage.getItem('products')) || [
        { id: 1, name: 'Product 1', price: '$10', image: 'https://via.placeholder.com/150' },
        { id: 2, name: 'Product 2', price: '$20', image: 'https://via.placeholder.com/150' },
        { id: 3, name: 'Product 3', price: '$30', image: 'https://via.placeholder.com/150' },
    ];

    console.log('Products:', products); // Debug log

    const productsContainer = document.getElementById('products');

    if (productsContainer) {
        products.forEach(product => {
            const productElement = document.createElement('div');
            productElement.classList.add('product');
            productElement.innerHTML = `
                <img src="${product.image}" alt="${product.name}">
                <h2>${product.name}</h2>
                <p>${product.price}</p>
                <button class="buy-button" data-id="${product.id}">Buy</button>
            `;
            productsContainer.appendChild(productElement);
        });

        document.querySelectorAll('.buy-button').forEach(button => {
            button.addEventListener('click', (event) => {
                const productId = event.target.getAttribute('data-id');
                const product = products.find(p => p.id === Number(productId));
                addToCart(product);
            });
        });
    } else {
        console.error('Products container not found');
    }
});

function addToCart(item) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart.push(item);
    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartCount();
}

function updateCartCount() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartCount = cart.length;
    localStorage.setItem('cartCount', cartCount);
    const cartCountElement = document.getElementById('cart-count');
    if (cartCountElement) {
        cartCountElement.textContent = cartCount;
    }
}