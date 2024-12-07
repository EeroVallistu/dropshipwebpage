document.addEventListener('DOMContentLoaded', () => {
    console.log('script.js loaded');
    updateCartCount();

    fetch('http://localhost:3000/api/products')
        .then(response => {
            console.log('API response:', response);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(results => {
            console.log('Products data:', results);
            let products = results.map(row => ({
                id: row.id,
                name: row.name,
                price: `$${row.price}`,
                image: row.image_url
            }));

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
        })
        .catch(err => console.error('Error fetching products:', err));
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