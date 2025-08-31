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
-- Name: agreement_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_role (
    agreement_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_role OWNER TO ofbiz;

--
-- Name: agreement_role pk_agreement_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_role
    ADD CONSTRAINT pk_agreement_role PRIMARY KEY (agreement_id, party_id, role_type_id);


--
-- Name: agrmnt_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_rl_txcrts ON agreement_role USING btree (created_tx_stamp);


--
-- Name: agrmnt_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_rl_txstmp ON agreement_role USING btree (last_updated_tx_stamp);


--
-- Name: agrmnt_role_agr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_role_agr ON agreement_role USING btree (agreement_id);


--
-- Name: agrmnt_role_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_role_prle ON agreement_role USING btree (party_id, role_type_id);


--
-- Name: agrmnt_role_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_role_pty ON agreement_role USING btree (party_id);


--
-- Name: agreement_role agrmnt_role_agr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_role
    ADD CONSTRAINT agrmnt_role_agr FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_role agrmnt_role_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_role
    ADD CONSTRAINT agrmnt_role_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: agreement_role agrmnt_role_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_role
    ADD CONSTRAINT agrmnt_role_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

