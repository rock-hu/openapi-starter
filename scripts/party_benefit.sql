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
-- Name: party_benefit; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_benefit (
    role_type_id_from character varying(20) NOT NULL,
    role_type_id_to character varying(20) NOT NULL,
    party_id_from character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    benefit_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    period_type_id character varying(20),
    cost numeric(18,2),
    actual_employer_paid_percent double precision,
    available_time numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_benefit OWNER TO ofbiz;

--
-- Name: party_benefit pk_party_benefit; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pk_party_benefit PRIMARY KEY (role_type_id_from, role_type_id_to, party_id_from, party_id_to, benefit_type_id, from_date);


--
-- Name: prt_bnft_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_bnft_txcrts ON party_benefit USING btree (created_tx_stamp);


--
-- Name: prt_bnft_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_bnft_txstmp ON party_benefit USING btree (last_updated_tx_stamp);


--
-- Name: pty_bnft_bnfttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_bnft_bnfttp ON party_benefit USING btree (benefit_type_id);


--
-- Name: pty_bnft_fptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_bnft_fptrl ON party_benefit USING btree (party_id_from, role_type_id_from);


--
-- Name: pty_bnft_fpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_bnft_fpty ON party_benefit USING btree (party_id_from);


--
-- Name: pty_bnft_tptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_bnft_tptrl ON party_benefit USING btree (party_id_to, role_type_id_to);


--
-- Name: pty_bnft_tpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_bnft_tpty ON party_benefit USING btree (party_id_to);


--
-- Name: party_benefit pty_bnft_bnfttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pty_bnft_bnfttp FOREIGN KEY (benefit_type_id) REFERENCES benefit_type(benefit_type_id);


--
-- Name: party_benefit pty_bnft_fptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pty_bnft_fptrl FOREIGN KEY (party_id_from, role_type_id_from) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_benefit pty_bnft_fpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pty_bnft_fpty FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: party_benefit pty_bnft_tptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pty_bnft_tptrl FOREIGN KEY (party_id_to, role_type_id_to) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_benefit pty_bnft_tpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_benefit
    ADD CONSTRAINT pty_bnft_tpty FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

