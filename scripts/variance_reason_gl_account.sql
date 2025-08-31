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
-- Name: variance_reason_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE variance_reason_gl_account (
    variance_reason_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.variance_reason_gl_account OWNER TO ofbiz;

--
-- Name: variance_reason_gl_account pk_variance_reason_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY variance_reason_gl_account
    ADD CONSTRAINT pk_variance_reason_gl_account PRIMARY KEY (variance_reason_id, organization_party_id);


--
-- Name: vrc_rsn_gl_act_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vrc_rsn_gl_act_txp ON variance_reason_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: vrc_rsn_gl_act_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vrc_rsn_gl_act_txs ON variance_reason_gl_account USING btree (created_tx_stamp);


--
-- Name: vrgl_glacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vrgl_glacct ON variance_reason_gl_account USING btree (gl_account_id);


--
-- Name: vrgl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vrgl_party ON variance_reason_gl_account USING btree (organization_party_id);


--
-- Name: vrgl_vreas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vrgl_vreas ON variance_reason_gl_account USING btree (variance_reason_id);


--
-- Name: variance_reason_gl_account vrgl_glacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY variance_reason_gl_account
    ADD CONSTRAINT vrgl_glacct FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: variance_reason_gl_account vrgl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY variance_reason_gl_account
    ADD CONSTRAINT vrgl_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: variance_reason_gl_account vrgl_vreas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY variance_reason_gl_account
    ADD CONSTRAINT vrgl_vreas FOREIGN KEY (variance_reason_id) REFERENCES variance_reason(variance_reason_id);


--
-- PostgreSQL database dump complete
--

