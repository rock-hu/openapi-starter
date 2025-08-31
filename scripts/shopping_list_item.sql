--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: shopping_list_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shopping_list_item (
    shopping_list_id character varying(20) NOT NULL,
    shopping_list_item_seq_id character varying(20) NOT NULL,
    product_id character varying(20),
    quantity numeric(18,6),
    modified_price numeric(18,3),
    reserv_start timestamp with time zone,
    reserv_length numeric(18,6),
    reserv_persons numeric(18,6),
    quantity_purchased numeric(18,6),
    config_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shopping_list_item OWNER TO ofbiz;

--
-- Name: shopping_list_item pk_shopping_list_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item
    ADD CONSTRAINT pk_shopping_list_item PRIMARY KEY (shopping_list_id, shopping_list_item_seq_id);


--
-- Name: shlist_item_list; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_item_list ON shopping_list_item USING btree (shopping_list_id);


--
-- Name: shlist_item_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_item_prod ON shopping_list_item USING btree (product_id);


--
-- Name: shpg_lst_itm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpg_lst_itm_txcrs ON shopping_list_item USING btree (created_tx_stamp);


--
-- Name: shpg_lst_itm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpg_lst_itm_txstp ON shopping_list_item USING btree (last_updated_tx_stamp);


--
-- Name: shopping_list_item shlist_item_list; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item
    ADD CONSTRAINT shlist_item_list FOREIGN KEY (shopping_list_id) REFERENCES shopping_list(shopping_list_id);


--
-- Name: shopping_list_item shlist_item_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_item
    ADD CONSTRAINT shlist_item_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

