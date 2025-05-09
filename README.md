# GROUP_229-ECOMMERCE-DATABASE

## Project Overview
This is an e-commerce database system designed to manage products, inventory, and related data for an online retail platform. The database supports various product types including electronics, clothing, books, and accessories.

## Features
- Product management with variations (size, color)
- Brand and category organization
- Image handling for products
- Detailed product attributes
- Inventory tracking
- SKU and barcode management

## Database Structure
The database consists of multiple interconnected tables handling:
- Products and their variations
- Product categories and brands
- Product attributes and specifications
- Size and color options
- Product images

## Entity Relationship Diagram (ERD)
![E-commerce Database ERD](ERD image/Ecommerce ERD.png)

The ERD shows the relationships between:
- Products and their variations (size, color)
- Product categorization and branding
- Attribute management system
- Image handling structure
- Inventory tracking system

## Tables Overview
1. **Brand**: Stores brand information
2. **Product Category**: Manages product classifications
3. **Product**: Core product information
4. **Product Variation**: Handles different versions of products
5. **Product Item**: Individual item tracking
6. **Product Attribute**: Product specifications and features
7. **Product Image**: Product visual content
8. **Color**: Color options for products
9. **Size Category**: Size classification system
10. **Size Option**: Available size options
11. **Attribute Type**: Types of product attributes
12. **Attribute Category**: Categories for product attributes

## Usage
The database is designed for:
- Managing product inventory
- Tracking product variations
- Handling product specifications
- Managing product images
- Organizing products by categories and brands

## Technical Details
- Database System: MySQL
- Character Set: UTF-8
- Includes optimized indexes for performance