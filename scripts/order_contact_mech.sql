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
-- Name: order_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_contact_mech (
    order_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_contact_mech OWNER TO ofbiz;

--
-- Name: order_contact_mech pk_order_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_contact_mech
    ADD CONSTRAINT pk_order_contact_mech PRIMARY KEY (order_id, contact_mech_purpose_type_id, contact_mech_id);


--
-- Name: order_cmech_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_cmech_cm ON order_contact_mech USING btree (contact_mech_id);


--
-- Name: order_cmech_cmpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_cmech_cmpt ON order_contact_mech USING btree (contact_mech_purpose_type_id);


--
-- Name: order_cmech_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_cmech_hdr ON order_contact_mech USING btree (order_id);


--
-- Name: orr_cntt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_cntt_mch_txcrs ON order_contact_mech USING btree (created_tx_stamp);


--
-- Name: orr_cntt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_cntt_mch_txstp ON order_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: order_contact_mech order_cmech_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_contact_mech
    ADD CONSTRAINT order_cmech_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: order_contact_mech order_cmech_cmpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_contact_mech
    ADD CONSTRAINT order_cmech_cmpt FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- Name: order_contact_mech order_cmech_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_contact_mech
    ADD CONSTRAINT order_cmech_hdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- PostgreSQL database dump complete
--

