
CREATE TABLE "users" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "email" VARCHAR(40),
    "password" VARCHAR(50),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "cart" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id"),
    "products_ID" INT[],  
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "favorite" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id"),
    "products_ID" INT[],  
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "orders" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id"),
    "products_ID" INT[],
    "status_checkout" INT,
    "subtotal" BIGINT,
    "total" BIGINT,  
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "address" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id"),
    "fulladdress" TEXT,
    "city" VARCHAR(30),
    "province" VARCHAR(30),
    "postcode" VARCHAR(10),
    "optional" TEXT
);

CREATE TABLE "checkout_histories" (
    "id_user" INT,
    "products_ID" INT[],
    "payment_method" VARCHAR(22),
    "order_status" INT
);

CREATE TABLE "profile" (
    "id_user" INT REFERENCES "users"("id"),
    "fullname" VARCHAR(40),
    "username" VARCHAR(40),
    "phone" VARCHAR(13),
    "address_ID" INT[],
    "id_cart" INT REFERENCES "cart"("id"),
    "id_favorite" INT REFERENCES "favorite"("id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "user_permissions" (
    "id_user" INT REFERENCES "users"("id"),
    "status" INT
);