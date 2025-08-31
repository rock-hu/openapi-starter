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
-- Name: product_order_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_order_item (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    engagement_id character varying(20) NOT NULL,
    engagement_item_seq_id character varying(20) NOT NULL,
    product_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_order_item OWNER TO ofbiz;

--
-- Name: product_order_item pk_product_order_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT pk_product_order_item PRIMARY KEY (order_id, order_item_seq_id, engagement_id, engagement_item_seq_id);


--
-- Name: prdt_orr_itm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_orr_itm_txcrs ON product_order_item USING btree (created_tx_stamp);


--
-- Name: prdt_orr_itm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_orr_itm_txstp ON product_order_item USING btree (last_updated_tx_stamp);


--
-- Name: prod_oitem_enohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_oitem_enohdr ON product_order_item USING btree (engagement_id);


--
-- Name: prod_oitem_enoitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_oitem_enoitm ON product_order_item USING btree (engagement_id, engagement_item_seq_id);


--
-- Name: prod_oitem_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_oitem_ohdr ON product_order_item USING btree (order_id);


--
-- Name: prod_oitem_oitem; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_oitem_oitem ON product_order_item USING btree (order_id, order_item_seq_id);


--
-- Name: prod_oitem_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_oitem_prod ON product_order_item USING btree (product_id);


--
-- Name: product_order_item prod_oitem_enohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT prod_oitem_enohdr FOREIGN KEY (engagement_id) REFERENCES order_header(order_id);


--
-- Name: product_order_item prod_oitem_enoitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT prod_oitem_enoitm FOREIGN KEY (engagement_id, engagement_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: product_order_item prod_oitem_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT prod_oitem_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: product_order_item prod_oitem_oitem; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT prod_oitem_oitem FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: product_order_item prod_oitem_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_order_item
    ADD CONSTRAINT prod_oitem_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

