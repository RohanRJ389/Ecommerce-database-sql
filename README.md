# E-commerce Platform Database Schema

This project contains the SQL schema for an E-commerce platform, which includes tables for users, products, orders, and order items. The schema is designed to manage customer data, product information, and order processing.

## Database Schema

The schema includes the following tables:

- **User**: Represents a customer or admin of the platform.
- **Product**: Represents a product available for purchase.
- **Order**: Represents a customer's order.
- **OrderItem**: Represents individual items within an order.

### Relationships:
- A **User** can have many **Orders**.
- An **Order** can have many **OrderItems**.
- An **OrderItem** is associated with one **Product**.



## SQL File

The SQL file `ecommerce_schema.sql` contains the `CREATE TABLE` statements to define the schema, as well as example `INSERT` statements to populate the tables.

## How to Use

1. Run the SQL script `ecommerce_schema.sql` on your preferred SQL database.
2. The script will create the necessary tables and insert example data into them.
3. Use the schema for your E-commerce platform or modify it as needed for your application.


