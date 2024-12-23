document.getElementById('logoutButton').addEventListener('click', () => {
    window.location.href = 'admin.html';
});

document.getElementById('addProductForm').addEventListener('submit', async (event) => {
    event.preventDefault();
    const name = document.getElementById('productName').value;
    const price = parseFloat(document.getElementById('productPrice').value); // Parse as float
    const image_url = document.getElementById('productImage').value;

    const response = await fetch('http://localhost:3000/api/products', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ name, price, image_url })
    });

    if (response.ok) {
        document.getElementById('addProductMessage').textContent = 'Product added successfully!';
        document.getElementById('addProductForm').reset();
    } else {
        document.getElementById('addProductMessage').textContent = 'Error adding product: ' + response.statusText;
    }
});