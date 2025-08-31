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
-- Name: party_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_gl_account (
    organization_party_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    gl_account_type_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_gl_account OWNER TO ofbiz;

--
-- Name: party_gl_account pk_party_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT pk_party_gl_account PRIMARY KEY (organization_party_id, party_id, role_type_id, gl_account_type_id);


--
-- Name: prt_gl_acct_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_gl_acct_txcrts ON party_gl_account USING btree (created_tx_stamp);


--
-- Name: prt_gl_acct_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_gl_acct_txstmp ON party_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: prtyglacct_glacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtyglacct_glacct ON party_gl_account USING btree (gl_account_id);


--
-- Name: prtyglacct_glat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtyglacct_glat ON party_gl_account USING btree (gl_account_type_id);


--
-- Name: prtyglacct_orgprty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtyglacct_orgprty ON party_gl_account USING btree (organization_party_id);


--
-- Name: prtyglacct_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtyglacct_prty ON party_gl_account USING btree (party_id);


--
-- Name: prtyglacct_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtyglacct_ptrl ON party_gl_account USING btree (party_id, role_type_id);


--
-- Name: party_gl_account prtyglacct_glacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT prtyglacct_glacct FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: party_gl_account prtyglacct_glat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT prtyglacct_glat FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: party_gl_account prtyglacct_orgprty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT prtyglacct_orgprty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: party_gl_account prtyglacct_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT prtyglacct_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_gl_account prtyglacct_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_gl_account
    ADD CONSTRAINT prtyglacct_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

