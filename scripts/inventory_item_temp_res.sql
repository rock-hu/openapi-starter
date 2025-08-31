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
-- Name: inventory_item_temp_res; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_temp_res (
    visit_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    product_store_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    reserved_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_temp_res OWNER TO ofbiz;

--
-- Name: inventory_item_temp_res pk_inventory_item_temp_res; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_temp_res
    ADD CONSTRAINT pk_inventory_item_temp_res PRIMARY KEY (visit_id, product_id, product_store_id);


--
-- Name: inr_itm_tmp_rs_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_tmp_rs_txp ON inventory_item_temp_res USING btree (last_updated_tx_stamp);


--
-- Name: inr_itm_tmp_rs_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_tmp_rs_txs ON inventory_item_temp_res USING btree (created_tx_stamp);


--
-- Name: inv_item_tr_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_tr_prds ON inventory_item_temp_res USING btree (product_store_id);


--
-- Name: inv_item_tr_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_tr_prod ON inventory_item_temp_res USING btree (product_id);


--
-- Name: inventory_item_temp_res inv_item_tr_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_temp_res
    ADD CONSTRAINT inv_item_tr_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: inventory_item_temp_res inv_item_tr_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_temp_res
    ADD CONSTRAINT inv_item_tr_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

