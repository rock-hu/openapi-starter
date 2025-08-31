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
-- Name: picklist_bin; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist_bin (
    picklist_bin_id character varying(20) NOT NULL,
    picklist_id character varying(20),
    bin_location_number numeric(20,0),
    primary_order_id character varying(20),
    primary_ship_group_seq_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist_bin OWNER TO ofbiz;

--
-- Name: picklist_bin pk_picklist_bin; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_bin
    ADD CONSTRAINT pk_picklist_bin PRIMARY KEY (picklist_bin_id);


--
-- Name: pcklst_bin_oisg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_bin_oisg ON picklist_bin USING btree (primary_order_id, primary_ship_group_seq_id);


--
-- Name: pcklst_bin_pklt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_bin_pklt ON picklist_bin USING btree (picklist_id);


--
-- Name: pcklst_bn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_bn_txcrts ON picklist_bin USING btree (created_tx_stamp);


--
-- Name: pcklst_bn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_bn_txstmp ON picklist_bin USING btree (last_updated_tx_stamp);


--
-- Name: picklist_bin pcklst_bin_oisg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_bin
    ADD CONSTRAINT pcklst_bin_oisg FOREIGN KEY (primary_order_id, primary_ship_group_seq_id) REFERENCES order_item_ship_group(order_id, ship_group_seq_id);


--
-- Name: picklist_bin pcklst_bin_pklt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_bin
    ADD CONSTRAINT pcklst_bin_pklt FOREIGN KEY (picklist_id) REFERENCES picklist(picklist_id);


--
-- PostgreSQL database dump complete
--

