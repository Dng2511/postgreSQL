--products
Alter table products
Add CONSTRAINT cate_fk FOREIGN KEY (category_id)
        REFERENCES public.categories (category_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE SET NULL,
add CONSTRAINT product_fk_user FOREIGN KEY (seller_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE;

--payments
alter table payments
add CONSTRAINT method_fk FOREIGN KEY (method_id)
        REFERENCES public.paymentmethod (method_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;
		
--orders
alter table orders
add CONSTRAINT orders_buyer_id_fkey FOREIGN KEY (buyer_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION;
		
--orderlines	
alter table orderlines
add CONSTRAINT orderlines_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
add CONSTRAINT orderlines_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION;

--comments
alter table comments
ADD CONSTRAINT user_fk FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES products(product_id)
	ON UPDATE CASCADE;
	
--cart
alter table cart
add CONSTRAINT cart_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE cascade
        ON DELETE NO ACTION,
add CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE cascade
        ON DELETE NO ACTION;

--addresses
alter table addresses
ADD CONSTRAINT user_fl FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE cascade
        ON DELETE NO ACTION


		
		
