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
-- Name: shipment_package_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_package_content (
    shipment_id character varying(20) NOT NULL,
    shipment_package_seq_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    sub_product_id character varying(20),
    sub_product_quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_package_content OWNER TO ofbiz;

--
-- Name: shipment_package_content pk_shipment_package_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_content
    ADD CONSTRAINT pk_shipment_package_content PRIMARY KEY (shipment_id, shipment_package_seq_id, shipment_item_seq_id);


--
-- Name: pck_cntnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pck_cntnt_prod ON shipment_package_content USING btree (sub_product_id);


--
-- Name: pck_cntnt_shitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pck_cntnt_shitm ON shipment_package_content USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: pck_cntnt_shpkg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pck_cntnt_shpkg ON shipment_package_content USING btree (shipment_id, shipment_package_seq_id);


--
-- Name: shpt_pcg_cnt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_pcg_cnt_txcrs ON shipment_package_content USING btree (created_tx_stamp);


--
-- Name: shpt_pcg_cnt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_pcg_cnt_txstp ON shipment_package_content USING btree (last_updated_tx_stamp);


--
-- Name: shipment_package_content pck_cntnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_content
    ADD CONSTRAINT pck_cntnt_prod FOREIGN KEY (sub_product_id) REFERENCES product(product_id);


--
-- Name: shipment_package_content pck_cntnt_shitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_content
    ADD CONSTRAINT pck_cntnt_shitm FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- Name: shipment_package_content pck_cntnt_shpkg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_content
    ADD CONSTRAINT pck_cntnt_shpkg FOREIGN KEY (shipment_id, shipment_package_seq_id) REFERENCES shipment_package(shipment_id, shipment_package_seq_id);


--
-- PostgreSQL database dump complete
--

