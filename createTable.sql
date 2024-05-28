--users
CREATE TABLE IF NOT EXISTS public.users
(
    user_id serial,
    email character varying COLLATE pg_catalog."default",
    password character varying COLLATE pg_catalog."default",
    role character(6) COLLATE pg_catalog."default",
    full_name character varying COLLATE pg_catalog."default",
    birthday date,
    avatar character varying COLLATE pg_catalog."default",
    phone_number character(10) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    identity character(12) COLLATE pg_catalog."default" DEFAULT NULL::bpchar,
    createdat date DEFAULT CURRENT_DATE,
    CONSTRAINT prikey PRIMARY KEY (user_id)
);

--products
CREATE TABLE IF NOT EXISTS public.products
(
    product_id serial,
    seller_id integer,
    product_name character varying COLLATE pg_catalog."default",
    slug character varying COLLATE pg_catalog."default",
    price integer,
    img character varying COLLATE pg_catalog."default",
    category_id integer,
    in_stock integer,
    sold integer,
    brand character varying COLLATE pg_catalog."default",
    description character varying COLLATE pg_catalog."default",
    createdat date DEFAULT CURRENT_DATE,
    is_deleted boolean DEFAULT false,
    updatedat date DEFAULT CURRENT_DATE,
    checked boolean DEFAULT false,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

--payments
CREATE TABLE IF NOT EXISTS public.payments(
    payment_id serial,
    user_id integer,
    method_id integer,
    card_id character(16) COLLATE pg_catalog."default",
    cvv character(4) COLLATE pg_catalog."default",
    CONSTRAINT payments_pkey PRIMARY KEY (payment_id)
);

--paymentmethod
CREATE TABLE IF NOT EXISTS public.paymentmethod
(
    method_id serial,
    methodname character varying COLLATE pg_catalog."default",
    CONSTRAINT paymentmethod_pkey PRIMARY KEY (method_id)
);
-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id serial,
    buyer_id integer,
    address_id integer,
    status character varying COLLATE pg_catalog."default",
    payment_id integer,
    message character varying COLLATE pg_catalog."default",
    createdat date DEFAULT CURRENT_DATE,
    amount integer,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id)
);

--orderlines
CREATE TABLE IF NOT EXISTS public.orderlines
(
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    CONSTRAINT orderlinespk PRIMARY KEY (order_id, product_id)
);

--comments
CREATE TABLE IF NOT EXISTS public.comments
(
    comment_id serial,
    product_id integer,
    user_id integer,
    rate integer,
    body character varying COLLATE pg_catalog."default",
    createat date,
    checked boolean,
    CONSTRAINT comments_pkey PRIMARY KEY (comment_id)
);

--categories
CREATE TABLE IF NOT EXISTS public.categories
(
    category_id serial,
    title character varying COLLATE pg_catalog."default",
    slug character varying COLLATE pg_catalog."default",
    CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);

--cart
CREATE TABLE IF NOT EXISTS public.cart
(
    user_id integer,
    product_id integer,
    quantity integer NOT NULL,
	CONSTRAINT cart_pk PRIMARY KEY (user_id, product_id)
);

--addresses
CREATE TABLE IF NOT EXISTS public.addresses
(
    address_id serial,
    user_id integer,
    full_name character varying COLLATE pg_catalog."default",
    contact_number character(10) COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    district character varying COLLATE pg_catalog."default",
    ward character varying COLLATE pg_catalog."default",
    label character(4) COLLATE pg_catalog."default",
    specific_address character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT address_pkey PRIMARY KEY (address_id),
	CONSTRAINT address_label_check CHECK (label = ANY (ARRAY['home'::bpchar, 'work'::bpchar]))
)

