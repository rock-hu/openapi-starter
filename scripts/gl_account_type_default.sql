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
-- Name: gl_account_type_default; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_type_default (
    gl_account_type_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_type_default OWNER TO ofbiz;

--
-- Name: gl_account_type_default pk_gl_account_type_default; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_type_default
    ADD CONSTRAINT pk_gl_account_type_default PRIMARY KEY (gl_account_type_id, organization_party_id);


--
-- Name: gl_act_tp_dft_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_tp_dft_txcs ON gl_account_type_default USING btree (created_tx_stamp);


--
-- Name: gl_act_tp_dft_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_tp_dft_txsp ON gl_account_type_default USING btree (last_updated_tx_stamp);


--
-- Name: glacct_tpdf_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_tpdf_gla ON gl_account_type_default USING btree (gl_account_id);


--
-- Name: glacct_tpdf_glat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_tpdf_glat ON gl_account_type_default USING btree (gl_account_type_id);


--
-- Name: glacct_tpdf_opty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_tpdf_opty ON gl_account_type_default USING btree (organization_party_id);


--
-- Name: gl_account_type_default glacct_tpdf_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_type_default
    ADD CONSTRAINT glacct_tpdf_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_type_default glacct_tpdf_glat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_type_default
    ADD CONSTRAINT glacct_tpdf_glat FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: gl_account_type_default glacct_tpdf_opty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_type_default
    ADD CONSTRAINT glacct_tpdf_opty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

