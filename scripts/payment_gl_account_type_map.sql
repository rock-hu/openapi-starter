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
-- Name: payment_gl_account_type_map; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gl_account_type_map (
    payment_type_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gl_account_type_map OWNER TO ofbiz;

--
-- Name: payment_gl_account_type_map pk_payment_gl_account_type_map; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gl_account_type_map
    ADD CONSTRAINT pk_payment_gl_account_type_map PRIMARY KEY (payment_type_id, organization_party_id);


--
-- Name: pmt_act_tp_mp_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_act_tp_mp_tp ON payment_gl_account_type_map USING btree (last_updated_tx_stamp);


--
-- Name: pmt_act_tp_mp_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_act_tp_mp_ts ON payment_gl_account_type_map USING btree (created_tx_stamp);


--
-- Name: pmtglacct_glacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmtglacct_glacct ON payment_gl_account_type_map USING btree (gl_account_type_id);


--
-- Name: pmtglacct_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmtglacct_party ON payment_gl_account_type_map USING btree (organization_party_id);


--
-- Name: pmtglacct_pmttype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmtglacct_pmttype ON payment_gl_account_type_map USING btree (payment_type_id);


--
-- Name: payment_gl_account_type_map pmtglacct_glacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gl_account_type_map
    ADD CONSTRAINT pmtglacct_glacct FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: payment_gl_account_type_map pmtglacct_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gl_account_type_map
    ADD CONSTRAINT pmtglacct_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: payment_gl_account_type_map pmtglacct_pmttype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gl_account_type_map
    ADD CONSTRAINT pmtglacct_pmttype FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id);


--
-- PostgreSQL database dump complete
--

