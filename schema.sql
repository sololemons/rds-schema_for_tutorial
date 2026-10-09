CREATE TABLE Customers (
   customer_id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   email VARCHAR(100) UNIQUE,
   phone VARCHAR(20),
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Categories (
   category_id INT AUTO_INCREMENT PRIMARY KEY,
   category_name VARCHAR(100)
);


CREATE TABLE Products (
   product_id INT AUTO_INCREMENT PRIMARY KEY,
   category_id INT,
   product_name VARCHAR(200),
   description TEXT,
   price DECIMAL(10,2),
   stock_quantity INT,
   FOREIGN KEY (category_id)
   REFERENCES Categories(category_id)
);


CREATE TABLE Suppliers (
   supplier_id INT AUTO_INCREMENT PRIMARY KEY,
   supplier_name VARCHAR(100),
   contact_email VARCHAR(100)
);


CREATE TABLE Orders (
   order_id INT AUTO_INCREMENT PRIMARY KEY,
   customer_id INT,
   order_date DATETIME,
   total_amount DECIMAL(10,2),
   FOREIGN KEY (customer_id)
   REFERENCES Customers(customer_id)
);


 CREATE TABLE Order_Items (
   order_item_id INT AUTO_INCREMENT PRIMARY KEY,
   order_id INT,
   product_id INT,
   quantity INT,
   price DECIMAL(10,2),
   FOREIGN KEY (order_id)
   REFERENCES Orders(order_id),
   FOREIGN KEY (product_id)
   REFERENCES Products(product_id)
);
