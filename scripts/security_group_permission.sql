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
-- Name: security_group_permission; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE security_group_permission (
    group_id character varying(20) NOT NULL,
    permission_id character varying(60) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.security_group_permission OWNER TO ofbiz;

--
-- Name: security_group_permission pk_security_group_permission; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY security_group_permission
    ADD CONSTRAINT pk_security_group_permission PRIMARY KEY (group_id, permission_id, from_date);


--
-- Name: sct_grp_prmn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sct_grp_prmn_txcrs ON security_group_permission USING btree (created_tx_stamp);


--
-- Name: sct_grp_prmn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sct_grp_prmn_txstp ON security_group_permission USING btree (last_updated_tx_stamp);


--
-- Name: sec_grp_perm_grp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sec_grp_perm_grp ON security_group_permission USING btree (group_id);


--
-- Name: security_group_permission sec_grp_perm_grp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY security_group_permission
    ADD CONSTRAINT sec_grp_perm_grp FOREIGN KEY (group_id) REFERENCES security_group(group_id);


--
-- PostgreSQL database dump complete
--

