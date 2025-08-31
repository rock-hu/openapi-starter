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
-- Name: agreement_facility_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_facility_appl (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_facility_appl OWNER TO ofbiz;

--
-- Name: agreement_facility_appl pk_agreement_facility_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_facility_appl
    ADD CONSTRAINT pk_agreement_facility_appl PRIMARY KEY (agreement_id, agreement_item_seq_id, facility_id);


--
-- Name: agrmnt_faclt_aitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_faclt_aitm ON agreement_facility_appl USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_faclt_prd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_faclt_prd ON agreement_facility_appl USING btree (facility_id);


--
-- Name: agrt_fct_apl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_fct_apl_txcrs ON agreement_facility_appl USING btree (created_tx_stamp);


--
-- Name: agrt_fct_apl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_fct_apl_txstp ON agreement_facility_appl USING btree (last_updated_tx_stamp);


--
-- Name: agreement_facility_appl agrmnt_faclt_aitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_facility_appl
    ADD CONSTRAINT agrmnt_faclt_aitm FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: agreement_facility_appl agrmnt_faclt_prd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_facility_appl
    ADD CONSTRAINT agrmnt_faclt_prd FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

