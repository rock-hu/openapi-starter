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
-- Name: order_item_price_info; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_price_info (
    order_item_price_info_id character varying(20) NOT NULL,
    order_id character varying(20),
    order_item_seq_id character varying(20),
    product_price_rule_id character varying(20),
    product_price_action_seq_id character varying(20),
    modify_amount numeric(18,3),
    description character varying(255),
    rate_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_price_info OWNER TO ofbiz;

--
-- Name: order_item_price_info pk_order_item_price_info; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_price_info
    ADD CONSTRAINT pk_order_item_price_info PRIMARY KEY (order_item_price_info_id);


--
-- Name: order_oipi_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_oipi_oitm ON order_item_price_info USING btree (order_id, order_item_seq_id);


--
-- Name: order_oipi_prai; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_oipi_prai ON order_item_price_info USING btree (product_price_rule_id, product_price_action_seq_id);


--
-- Name: orr_itm_prc_inf_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_prc_inf_tp ON order_item_price_info USING btree (last_updated_tx_stamp);


--
-- Name: orr_itm_prc_inf_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_prc_inf_ts ON order_item_price_info USING btree (created_tx_stamp);


--
-- Name: order_item_price_info order_oipi_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_price_info
    ADD CONSTRAINT order_oipi_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: order_item_price_info order_oipi_prai; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_price_info
    ADD CONSTRAINT order_oipi_prai FOREIGN KEY (product_price_rule_id, product_price_action_seq_id) REFERENCES product_price_action(product_price_rule_id, product_price_action_seq_id);


--
-- PostgreSQL database dump complete
--

