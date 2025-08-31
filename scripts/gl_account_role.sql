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
-- Name: gl_account_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_role (
    gl_account_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_role OWNER TO ofbiz;

--
-- Name: gl_account_role pk_gl_account_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_role
    ADD CONSTRAINT pk_gl_account_role PRIMARY KEY (gl_account_id, party_id, role_type_id, from_date);


--
-- Name: gl_accnt_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_accnt_rl_txcrts ON gl_account_role USING btree (created_tx_stamp);


--
-- Name: gl_accnt_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_accnt_rl_txstmp ON gl_account_role USING btree (last_updated_tx_stamp);


--
-- Name: glacct_rl_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_rl_gla ON gl_account_role USING btree (gl_account_id);


--
-- Name: glacct_rl_ptrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_rl_ptrle ON gl_account_role USING btree (party_id, role_type_id);


--
-- Name: gl_account_role glacct_rl_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_role
    ADD CONSTRAINT glacct_rl_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_role glacct_rl_ptrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_role
    ADD CONSTRAINT glacct_rl_ptrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

