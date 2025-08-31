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
-- Name: shipment_receipt_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_receipt_role (
    receipt_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_receipt_role OWNER TO ofbiz;

--
-- Name: shipment_receipt_role pk_shipment_receipt_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt_role
    ADD CONSTRAINT pk_shipment_receipt_role PRIMARY KEY (receipt_id, party_id, role_type_id);


--
-- Name: shp_rcptrl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcptrl_ptrl ON shipment_receipt_role USING btree (party_id, role_type_id);


--
-- Name: shp_rcptrl_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcptrl_pty ON shipment_receipt_role USING btree (party_id);


--
-- Name: shp_rcptrl_rcpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcptrl_rcpt ON shipment_receipt_role USING btree (receipt_id);


--
-- Name: shpmt_rct_rl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rct_rl_txcrs ON shipment_receipt_role USING btree (created_tx_stamp);


--
-- Name: shpmt_rct_rl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rct_rl_txstp ON shipment_receipt_role USING btree (last_updated_tx_stamp);


--
-- Name: shipment_receipt_role shp_rcptrl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt_role
    ADD CONSTRAINT shp_rcptrl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: shipment_receipt_role shp_rcptrl_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt_role
    ADD CONSTRAINT shp_rcptrl_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: shipment_receipt_role shp_rcptrl_rcpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt_role
    ADD CONSTRAINT shp_rcptrl_rcpt FOREIGN KEY (receipt_id) REFERENCES shipment_receipt(receipt_id);


--
-- PostgreSQL database dump complete
--

