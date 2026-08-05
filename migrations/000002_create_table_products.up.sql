CREATE TABLE "categories" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(40),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "products" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "slugs" VARCHAR(50),
    "title" VARCHAR(50),
    "price" INT,
    "image" VARCHAR(100),
    "alt" VARCHAR(50),
    "description" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "colors" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(15),
    "hex" VARCHAR(15),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "sizes" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(15),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "products_variants" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_product" BIGINT REFERENCES "products"("id"),
    "id_color" BIGINT REFERENCES "colors"("id"),
    "id_size" BIGINT REFERENCES "sizes"("id"),
    "stocks" INT,
    "price" BIGINT,
    "sku" VARCHAR(20),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "events" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(40),
    "start_at" TIMESTAMP DEFAULT NOW(),
    "end_at" TIMESTAMP DEFAULT NOW(),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "reviews" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_product" BIGINT REFERENCES "products"("id"),
    "id_user" BIGINT REFERENCES "users"("id"),
    "rating" INT,
    "comment" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "categories_products" (
    "id_product" BIGINT REFERENCES "products"("id") ON DELETE CASCADE,
    "id_category" BIGINT REFERENCES "categories"("id") ON DELETE CASCADE
);

CREATE TABLE "products_events" (
    "id_event" BIGINT REFERENCES "events"("id") ON DELETE CASCADE,
    "id_product" BIGINT REFERENCES "products"("id") ON DELETE CASCADE,
    "discount" INT
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "payment_method" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(50),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "delivery_method" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(50),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

