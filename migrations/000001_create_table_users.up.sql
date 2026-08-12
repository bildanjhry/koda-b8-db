
CREATE TABLE "users" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "email" VARCHAR(40),
    "password" VARCHAR(100),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "cart" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id"),
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

CREATE TABLE "cart_items" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_cart" BIGINT REFERENCES "cart"("id"),
    "id_product" BIGINT REFERENCES "products_variants"("id"),
    "quantity" INT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "favorite" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "favorite_items" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_cart" BIGINT REFERENCES "cart"("id"),
    "id_product" BIGINT REFERENCES "products_variants"("id"),
    "quantity" INT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "orders" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id"),
    "status_checkout" INT,
    "subtotal" BIGINT,
    "total" BIGINT,  
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "categories" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(40),
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

CREATE TABLE "products_categories" (
    "id_product" BIGINT REFERENCES "products"("id") ON DELETE CASCADE,
    "id_category" BIGINT REFERENCES "categories"("id") ON DELETE CASCADE
);


CREATE TABLE "products_events" (
    "id_event" BIGINT REFERENCES "events"("id") ON DELETE CASCADE,
    "id_product" BIGINT REFERENCES "products"("id") ON DELETE CASCADE,
    "discount" INT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "payment_method" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(50),
    "desc" VARCHAR(50),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "delivery_method" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(50),
    "desc" VARCHAR(50),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "order_items" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_order" BIGINT REFERENCES "orders"("id"),
    "id_product" BIGINT REFERENCES "products_variants"("id"),
    "quantity" INT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "address" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id"),
    "status" INT,
    "fulladdress" TEXT,
    "city" VARCHAR(30),
    "province" VARCHAR(30),
    "postcode" VARCHAR(10),
    "optional" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "checkout_address" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_order" BIGINT REFERENCES "orders"("id"),
    "recipient_name" VARCHAR(40),
    "recipient_phone" VARCHAR(15),
    "recipient_fulladdress" TEXT,
    "recipient_city" VARCHAR(30),
    "recipient_province" VARCHAR(30),
    "recipient_postcode" VARCHAR(10),
    "recipient_optional_address" TEXT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "order_status" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" VARCHAR(40),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "checkout_histories" (
    "id" BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" BIGINT REFERENCES "users"("id"),
    "id_order" BIGINT REFERENCES "orders"("id"),
    "id_checkout_address" BIGINT REFERENCES "checkout_address"("id"),
    "id_payment_method" INT REFERENCES "payment_method"("id"),
    "id_delivery_method" INT REFERENCES "delivery_method"("id"),
    "id_order_status" INT REFERENCES "order_status"("id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "profile" (
    "id_user" BIGINT REFERENCES "users"("id"),
    "fullname" VARCHAR(40),
    "username" VARCHAR(40),
    "phone" VARCHAR(13),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "user_permissions" (
    "id_user" BIGINT REFERENCES "users"("id"),
    "status" INT,
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

INSERT INTO "users" ("email", "password") VALUES ('superuser@mail.com', 'admin123');
INSERT INTO "user_permissions" ("id_user", "status") VALUES (1, 6);