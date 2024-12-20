db.address_details.insertMany([
  {
    "address": "123 Main St",
    "city": "Sample City",
    "postal_code": "12345",
    "country": "Sample Country"
  },
  {
    "address": "123 Main Stt",
    "city": "City",
    "postal_code": "123456",
    "country": "Country"
  },
  {
    "address": "123 Main St",
    "city": "City",
    "postal_code": "123456",
    "country": "Country"
  },
  {
    "address": "456 Main St",
    "city": "City",
    "postal_code": "123456",
    "country": "Country"
  }
]);

db.orders.insertMany([
  {
    "user_id": 1,
    "order_date": new Date('2024-12-02 14:34:42'),
    "status": "delivered",
    "address_details_id": 1,
    "paid_amount": 100.00,
    "payment_date": new Date('2024-12-02 14:34:42'),
    "payment_method": "montonio",
    "payment_url": ""
  },
  {
    "user_id": 2,
    "order_date": new Date('2024-12-02 14:36:11'),
    "status": "delivered",
    "address_details_id": 2,
    "paid_amount": 99.00,
    "payment_date": new Date('2024-12-02 14:36:11'),
    "payment_method": "montonio",
    "payment_url": ""
  },
  {
    "user_id": 1,
    "order_date": new Date('2024-12-04 15:09:29'),
    "status": "pending",
    "address_details_id": 3,
    "paid_amount": 100.00,
    "payment_date": new Date('2024-12-04 15:09:29'),
    "payment_method": "montonio",
    "payment_url": null
  },
  {
    "user_id": 1,
    "order_date": new Date('2024-12-04 15:18:31'),
    "status": "pending",
    "address_details_id": 4,
    "paid_amount": 50.00,
    "payment_date": new Date('2024-12-04 15:18:31'),
    "payment_method": "montonio",
    "payment_url": null
  }
]);

db.order_items.insertMany([
  {
    "order_id": 2,
    "product_id": 1,
    "quantity": 2,
    "price": 19.99
  },
  {
    "order_id": 2,
    "product_id": 2,
    "quantity": 1,
    "price": 29.99
  },
  {
    "order_id": 3,
    "product_id": 1,
    "quantity": 2,
    "price": 19.99
  },
  {
    "order_id": 3,
    "product_id": 2,
    "quantity": 1,
    "price": 29.99
  },
  {
    "order_id": 6,
    "product_id": 1,
    "quantity": 2,
    "price": 50.00
  },
  {
    "order_id": 8,
    "product_id": 5,
    "quantity": 1,
    "price": 50.00
  }
]);

db.products.insertMany([
  {
    "name": "Product 1",
    "price": 19.99,
    "image_url": "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
  },
  {
    "name": "Product 2",
    "price": 29.99,
    "image_url": "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
  },
  {
    "name": "Product 3",
    "price": 39.99,
    "image_url": "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
  },
  {
    "name": "Product 4",
    "price": 49.99,
    "image_url": "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
  },
  {
    "name": "Product 5",
    "price": 59.99,
    "image_url": "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg"
  }
]);

db.users.insertMany([
  {
    "username": "admin",
    "password": "admin",
    "is_admin": 1,
    "email": "admins@gmail.com"
  },
  {
    "username": "abc",
    "password": "abc",
    "is_admin": 0,
    "email": "test2@gmail.com"
  },
  {
    "username": "abcd",
    "password": "abcd",
    "is_admin": 0,
    "email": "test5@gmail.com"
  }
]);

db.users_log.insertMany([
  {
    "user_id": 1,
    "old_email": "admin@gmail.com",
    "new_email": "admins@gmail.com",
    "changed_by": "student@localhost",
    "changed_at": new Date('2024-12-04 14:11:12')
  },
  {
    "user_id": 1,
    "old_email": "admins@gmail.com",
    "new_email": "admins@gmail.c",
    "changed_by": "student@localhost",
    "changed_at": new Date('2024-12-04 14:11:18')
  },
  {
    "user_id": 1,
    "old_email": "admins@gmail.c",
    "new_email": "admins@gmail.com",
    "changed_by": "student@localhost",
    "changed_at": new Date('2024-12-04 14:11:33')
  },
  {
    "user_id": 1,
    "old_email": "admins@gmail.com",
    "new_email": "admins@gmail.c",
    "changed_by": "student@localhost",
    "changed_at": new Date('2024-12-04 14:13:48')
  },
  {
    "user_id": 1,
    "old_email": "admins@gmail.c",
    "new_email": "admins@gmail.com",
    "changed_by": "student@localhost",
    "changed_at": new Date('2024-12-04 14:13:57')
  }
]);
