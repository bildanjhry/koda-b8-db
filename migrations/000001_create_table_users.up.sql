
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

CREATE TABLE "checkout_orders" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id"),
    "products_ID" INT[],
    "status_checkout" INT,  
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "user_address" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "id_user" INT REFERENCES "users"("id")
);

CREATE TABLE "profile" (
    "id_user" INT REFERENCES "users"("id"),
    "fullname" VARCHAR(40),
    "username" VARCHAR(40),
    "phone" VARCHAR(13),
    "address_ID" INT[],
    "status" INT,
    "id_cart" INT REFERENCES "cart"("id"),
    "id_favorite" INT REFERENCES "favorite"("id"),
    "id_checkout_orders" INT REFERENCES "checkout_orders"("id"),
    "created_at" TIMESTAMP DEFAULT NOW(),
    "updated_at" TIMESTAMP DEFAULT NOW()
);

