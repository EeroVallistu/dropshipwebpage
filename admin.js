document.addEventListener('DOMContentLoaded', () => {
    const adminContent = document.getElementById('admin-content');
    const loginForm = document.getElementById('login-form');
    const adminLoginForm = document.getElementById('adminLoginForm');

    // Check if the user is already logged in
    if (localStorage.getItem('isAdminLoggedIn') === 'true') {
        loginForm.style.display = 'none';
        adminContent.style.display = 'block';
    }

    adminLoginForm.addEventListener('submit', (event) => {
        event.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        // Simple login check
        if (username === 'admin' && password === 'admin') {
            localStorage.setItem('isAdminLoggedIn', 'true');
            loginForm.style.display = 'none';
            adminContent.style.display = 'block';
        } else {
            alert('Invalid username or password');
        }
    });

    const productForm = document.getElementById('productForm');

    productForm.addEventListener('submit', (event) => {
        event.preventDefault();

        const productName = document.getElementById('productName').value;
        const productPrice = document.getElementById('productPrice').value;
        const productImage = document.getElementById('productImage').value;

        const newProduct = {
            id: Date.now(), // Unique ID based on timestamp
            name: productName,
            price: productPrice,
            image: productImage
        };

        console.log('Adding product:', newProduct); // Debug log
        addProduct(newProduct);
    });
});

function addProduct(product) {
    let products = JSON.parse(localStorage.getItem('products')) || [];
    products.push(product);
    localStorage.setItem('products', JSON.stringify(products));
    console.log('Updated products:', products); // Debug log
}