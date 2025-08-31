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
-- Name: party_name_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_name_history (
    party_id character varying(20) NOT NULL,
    change_date timestamp with time zone NOT NULL,
    group_name character varying(100),
    first_name character varying(100),
    middle_name character varying(100),
    last_name character varying(100),
    personal_title character varying(100),
    suffix character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_name_history OWNER TO ofbiz;

--
-- Name: party_name_history pk_party_name_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_name_history
    ADD CONSTRAINT pk_party_name_history PRIMARY KEY (party_id, change_date);


--
-- Name: prt_nm_hstr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_nm_hstr_txcrts ON party_name_history USING btree (created_tx_stamp);


--
-- Name: prt_nm_hstr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_nm_hstr_txstmp ON party_name_history USING btree (last_updated_tx_stamp);


--
-- Name: pty_nmhis_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pty_nmhis_party ON party_name_history USING btree (party_id);


--
-- Name: party_name_history pty_nmhis_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_name_history
    ADD CONSTRAINT pty_nmhis_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

