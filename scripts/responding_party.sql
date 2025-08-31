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
-- Name: responding_party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE responding_party (
    responding_party_seq_id character varying(20) NOT NULL,
    cust_request_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    contact_mech_id character varying(20),
    date_sent timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.responding_party OWNER TO ofbiz;

--
-- Name: responding_party pk_responding_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY responding_party
    ADD CONSTRAINT pk_responding_party PRIMARY KEY (responding_party_seq_id, cust_request_id, party_id);


--
-- Name: resp_pty_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX resp_pty_cmech ON responding_party USING btree (contact_mech_id);


--
-- Name: resp_pty_csreq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX resp_pty_csreq ON responding_party USING btree (cust_request_id);


--
-- Name: resp_pty_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX resp_pty_party ON responding_party USING btree (party_id);


--
-- Name: rspndng_prt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rspndng_prt_txcrts ON responding_party USING btree (created_tx_stamp);


--
-- Name: rspndng_prt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rspndng_prt_txstmp ON responding_party USING btree (last_updated_tx_stamp);


--
-- Name: responding_party resp_pty_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY responding_party
    ADD CONSTRAINT resp_pty_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: responding_party resp_pty_csreq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY responding_party
    ADD CONSTRAINT resp_pty_csreq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: responding_party resp_pty_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY responding_party
    ADD CONSTRAINT resp_pty_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

