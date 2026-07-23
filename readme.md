# BeliMudah

## Entity Relationship Diagram (ERD)
 
ERD dari database program e commerce belimudah yang dibuat dengan konsep database migrations.

### Tech stack:
- PostgreSQL 18.4
- github.com/golang-migrate/migrate/v4/cmd/migrate@latest


### Schema:
```mermaid
erDiagram
    USERS {
        int id PK
        varchar email
        varchar password
        timestamp created_at
        timestamp updated_at
    }

    PROFILE {
        int id_user PK, FK
        varchar fullname
        varchar username
        varchar phone
        int address_ID FK
        int status
        int id_cart FK
        int id_favorite FK
        int id_checkout_orders FK
        timestamp created_at
        timestamp updated_at
    }

    CART {
        int id PK
        int id_user FK
        int products_ID
        timestamp created_at
        timestamp updated_at
    }

    FAVORITE {
        int id PK
        int id_user FK
        int products_ID
        timestamp created_at
        timestamp updated_at
    }

    CHECKOUT_ORDERS {
        int id PK
        int id_user FK
        int products_ID
        int status_checkout
        timestamp created_at
        timestamp updated_at
    }

    USER_ADDRESS {
        int id PK
        int id_user FK
    }

    USER_PERMISSIONS {
        int id_user FK
        int status
    }

    USERS ||--o{ CART : owns
    USERS ||--o{ FAVORITE : owns
    USERS ||--o{ CHECKOUT_ORDERS : creates
    USERS ||--|| PROFILE : has
    USERS ||--o| USER_ADDRESS : has
    USERS ||--|| USER_PERMISSIONS : has

    PROFILE }o--|| CART : cart
    PROFILE }o--|| FAVORITE : favorite
    PROFILE }o--|| CHECKOUT_ORDERS : checkout
```