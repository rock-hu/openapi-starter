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
-- Name: agreement_employment_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_employment_appl (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    party_id_from character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    role_type_id_from character varying(20) NOT NULL,
    role_type_id_to character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    agreement_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_employment_appl OWNER TO ofbiz;

--
-- Name: agreement_employment_appl pk_agreement_employment_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_employment_appl
    ADD CONSTRAINT pk_agreement_employment_appl PRIMARY KEY (agreement_id, agreement_item_seq_id, party_id_to, party_id_from, role_type_id_to, role_type_id_from, from_date);


--
-- Name: agrmnt_empl_aitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_empl_aitm ON agreement_employment_appl USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_empl_appl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_empl_appl ON agreement_employment_appl USING btree (role_type_id_from, role_type_id_to, party_id_from, party_id_to, from_date);


--
-- Name: agrt_empt_apl_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_empt_apl_txcs ON agreement_employment_appl USING btree (created_tx_stamp);


--
-- Name: agrt_empt_apl_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_empt_apl_txsp ON agreement_employment_appl USING btree (last_updated_tx_stamp);


--
-- Name: agreement_employment_appl agrmnt_empl_aitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_employment_appl
    ADD CONSTRAINT agrmnt_empl_aitm FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: agreement_employment_appl agrmnt_empl_appl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_employment_appl
    ADD CONSTRAINT agrmnt_empl_appl FOREIGN KEY (role_type_id_from, role_type_id_to, party_id_from, party_id_to, from_date) REFERENCES employment(role_type_id_from, role_type_id_to, party_id_from, party_id_to, from_date);


--
-- PostgreSQL database dump complete
--

