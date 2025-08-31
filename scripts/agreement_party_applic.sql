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
-- Name: agreement_party_applic; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_party_applic (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_party_applic OWNER TO ofbiz;

--
-- Name: agreement_party_applic pk_agreement_party_applic; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_party_applic
    ADD CONSTRAINT pk_agreement_party_applic PRIMARY KEY (agreement_id, agreement_item_seq_id, party_id);


--
-- Name: agrmnt_ptya_agr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_ptya_agr ON agreement_party_applic USING btree (agreement_id);


--
-- Name: agrmnt_ptya_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_ptya_pty ON agreement_party_applic USING btree (party_id);


--
-- Name: agrt_prt_apc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_prt_apc_txcrs ON agreement_party_applic USING btree (created_tx_stamp);


--
-- Name: agrt_prt_apc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_prt_apc_txstp ON agreement_party_applic USING btree (last_updated_tx_stamp);


--
-- Name: agreement_party_applic agrmnt_ptya_agr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_party_applic
    ADD CONSTRAINT agrmnt_ptya_agr FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_party_applic agrmnt_ptya_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_party_applic
    ADD CONSTRAINT agrmnt_ptya_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

