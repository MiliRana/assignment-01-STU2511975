// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
  product_id: "E101",
  name: "Smartphone X12",
  category: "Electronics",
  brand: "TechNova",
  price: 39999,
  specifications: {
    voltage: "220V",
    battery: "5000mAh",
    storage: "256GB"
  },
  warranty: {
    period: "1 year",
    type: "manufacturer"
  },
  features: ["5G", "AMOLED Display", "Fast Charging"]
},

{
  product_id: "C205",
  name: "Men's Casual Shirt",
  category: "Clothing",
  brand: "UrbanStyle",
  price: 1499,
  sizes: ["S", "M", "L", "XL"],
  material: "Cotton",
  colors: ["Blue", "Black", "White"],
  care_instructions: {
    wash: "Machine Wash",
    dry: "Tumble Dry"
  }
},

{
  product_id: "G310",
  name: "Organic Almonds",
  category: "Groceries",
  brand: "NatureFresh",
  price: 750,
  weight: "500g",
  expiry_date: ISODate("2024-12-01"),
  nutritional_info: {
    calories: "575 kcal",
    protein: "21g",
    fat: "49g"
  },
  ingredients: ["Almonds"]
}
]);



// OP2: find() — retrieve all Electronics products with price > 20000

db.products.find(
  { category: "Electronics", price: { $gt: 20000 } }
);



// OP3: find() — retrieve all Groceries expiring before 2025-01-01

db.products.find(
  {
    category: "Groceries",
    expiry_date: { $lt: ISODate("2025-01-01") }
  }
);



// OP4: updateOne() — add a "discount_percent" field to a specific product

db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);



// OP5: createIndex() — create an index on category field and explain why

db.products.createIndex({ category: 1 });

// This index improves query performance when filtering products by category,
// such as retrieving all Electronics or Groceries products quickly.
