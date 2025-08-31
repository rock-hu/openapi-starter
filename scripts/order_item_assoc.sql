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
-- Name: order_item_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_assoc (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    to_order_id character varying(20) NOT NULL,
    to_order_item_seq_id character varying(20) NOT NULL,
    to_ship_group_seq_id character varying(20) NOT NULL,
    order_item_assoc_type_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_assoc OWNER TO ofbiz;

--
-- Name: order_item_assoc pk_order_item_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_assoc
    ADD CONSTRAINT pk_order_item_assoc PRIMARY KEY (order_id, order_item_seq_id, ship_group_seq_id, to_order_id, to_order_item_seq_id, to_ship_group_seq_id, order_item_assoc_type_id);


--
-- Name: order_itass_frhd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itass_frhd ON order_item_assoc USING btree (order_id);


--
-- Name: order_itass_tohd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itass_tohd ON order_item_assoc USING btree (to_order_id);


--
-- Name: order_itass_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itass_type ON order_item_assoc USING btree (order_item_assoc_type_id);


--
-- Name: orr_itm_asc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_asc_txcrts ON order_item_assoc USING btree (created_tx_stamp);


--
-- Name: orr_itm_asc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_asc_txstmp ON order_item_assoc USING btree (last_updated_tx_stamp);


--
-- Name: order_item_assoc order_itass_frhd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_assoc
    ADD CONSTRAINT order_itass_frhd FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_assoc order_itass_tohd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_assoc
    ADD CONSTRAINT order_itass_tohd FOREIGN KEY (to_order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_assoc order_itass_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_assoc
    ADD CONSTRAINT order_itass_type FOREIGN KEY (order_item_assoc_type_id) REFERENCES order_item_assoc_type(order_item_assoc_type_id);


--
-- PostgreSQL database dump complete
--

