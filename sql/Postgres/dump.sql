PGDMP                      |            postgres    17.2 (Debian 17.2-1.pgdg120+1)    17.0 /    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Z           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                     root    false            [           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        root    false    3418                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            \           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16873    address_details    TABLE     �   CREATE TABLE public.address_details (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    postal_code character varying(20) NOT NULL,
    country character varying(100) NOT NULL
);
 #   DROP TABLE public.address_details;
       public         heap r       root    false    4            �            1259    16872    address_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.address_details_id_seq;
       public               root    false    220    4            ]           0    0    address_details_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.address_details_id_seq OWNED BY public.address_details.id;
          public               root    false    219            �            1259    16910    order_items    TABLE     �   CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity smallint NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.order_items;
       public         heap r       root    false    4            �            1259    16909    order_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_items_id_seq;
       public               root    false    226    4            ^           0    0    order_items_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;
          public               root    false    225            �            1259    16887    orders    TABLE     n  CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'pending'::character varying,
    address_details_id integer NOT NULL,
    paid_amount numeric(10,2) NOT NULL,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    payment_method character varying(50) NOT NULL,
    payment_url character varying(255) DEFAULT NULL::character varying,
    CONSTRAINT orders_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['montonio'::character varying, 'NOWPayments'::character varying])::text[]))),
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'shipped'::character varying, 'delivered'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap r       root    false    4            �            1259    16886    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               root    false    224    4            _           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               root    false    223            �            1259    16880    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    price numeric(10,2) NOT NULL,
    image_url character varying(255) NOT NULL
);
    DROP TABLE public.products;
       public         heap r       root    false    4            �            1259    16879    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public               root    false    4    222            `           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public               root    false    221            �            1259    16861    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(191) NOT NULL,
    password character varying(191) NOT NULL,
    is_admin boolean DEFAULT false,
    email character varying(191) NOT NULL
);
    DROP TABLE public.users;
       public         heap r       root    false    4            �            1259    16860    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               root    false    218    4            a           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               root    false    217            �           2604    16876    address_details id    DEFAULT     x   ALTER TABLE ONLY public.address_details ALTER COLUMN id SET DEFAULT nextval('public.address_details_id_seq'::regclass);
 A   ALTER TABLE public.address_details ALTER COLUMN id DROP DEFAULT;
       public               root    false    219    220    220            �           2604    16913    order_items id    DEFAULT     p   ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);
 =   ALTER TABLE public.order_items ALTER COLUMN id DROP DEFAULT;
       public               root    false    225    226    226            �           2604    16890 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               root    false    223    224    224            �           2604    16883    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               root    false    221    222    222            �           2604    16864    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               root    false    218    217    218            N          0    16873    address_details 
   TABLE DATA                 public               root    false    220   �4       T          0    16910    order_items 
   TABLE DATA                 public               root    false    226   15       R          0    16887    orders 
   TABLE DATA                 public               root    false    224   �5       P          0    16880    products 
   TABLE DATA                 public               root    false    222   w6       L          0    16861    users 
   TABLE DATA                 public               root    false    218   N7       b           0    0    address_details_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.address_details_id_seq', 4, true);
          public               root    false    219            c           0    0    order_items_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.order_items_id_seq', 6, true);
          public               root    false    225            d           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public               root    false    223            e           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 5, true);
          public               root    false    221            f           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public               root    false    217            �           2606    16878 $   address_details address_details_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.address_details
    ADD CONSTRAINT address_details_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.address_details DROP CONSTRAINT address_details_pkey;
       public                 root    false    220            �           2606    16915    order_items order_items_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public                 root    false    226            �           2606    16898    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 root    false    224            �           2606    16885    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 root    false    222            �           2606    16869    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 root    false    218            �           2606    16871    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 root    false    218            �           2606    16904    orders fk_address    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_address FOREIGN KEY (address_details_id) REFERENCES public.address_details(id);
 ;   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_address;
       public               root    false    3247    220    224            �           2606    16916    order_items fk_order    FK CONSTRAINT     u   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public.orders(id);
 >   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order;
       public               root    false    3251    224    226            �           2606    16921    order_items fk_product    FK CONSTRAINT     {   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(id);
 @   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_product;
       public               root    false    3249    226    222            �           2606    16899    orders fk_user    FK CONSTRAINT     m   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id);
 8   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_user;
       public               root    false    218    224    3243            N   �   x���v
Q���W((M��L�KLI)J-.�OI-I��)Vs�	uV�0�QP742V�M��S.Qr�srR�3K*�!�&�����y%E���\���c�j�"��"d�m��jm�	4�h��� [�n�      T   l   x���v
Q���W((M��L��/JI-��,I�-Vs�	uV�0�Q0�Q���z����\��i5k��&M����1������e����	�VS=ⵚ����uôrq �-a{      R   �   x����
�0��{�bw���m]u� �=@m��6���oEꢂ]Ɵ��dE�n+����}�����h���D3�}>���@BLPSN�o��l�MvR��0�0������L?��}�I��t߂�y�1�ԟ��z<:�"H8f��~G+�P�h��u�0~Ë:�⩋�%�a��.q�v�{�s8}Q      P   �   x���;�0  НStC菏����Q#�J�ED�6��&.�N��M/�g�����Hskje'�aZ��fw�f`F<������$���Z�B�����yH1|����7�E�eW*�z�3�����F\!�I�p�x]պhrV�ˮ��Ch���C���SV�|��?,�hI�Nr���]�\��eh��$��h�e����| ]
      L   p   x���v
Q���W((M��L�+-N-*Vs�	uV�0�QPOL���SGb���¸�鹉�9z�����\��4iLJV�Si�9� �JR�K�H4�bJ�:�F6��8.. `fHE     