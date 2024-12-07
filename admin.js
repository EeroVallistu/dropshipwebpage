document.getElementById('loginForm').addEventListener('submit', async (event) => {
    event.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    const response = await fetch('http://localhost:3000/api/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ username, password })
    });

    if (response.ok) {
        const result = await response.json();
        if (result.success) {
            window.location.href = 'dashboard.html';
        } else {
            document.getElementById('errorMessage').textContent = result.message;
        }
    } else {
        document.getElementById('errorMessage').textContent = 'Error: ' + response.statusText;
    }
});