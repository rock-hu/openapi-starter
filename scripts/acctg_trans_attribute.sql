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
-- Name: acctg_trans_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE acctg_trans_attribute (
    acctg_trans_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.acctg_trans_attribute OWNER TO ofbiz;

--
-- Name: acctg_trans_attribute pk_acctg_trans_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_attribute
    ADD CONSTRAINT pk_acctg_trans_attribute PRIMARY KEY (acctg_trans_id, attr_name);


--
-- Name: accttx_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_attr ON acctg_trans_attribute USING btree (acctg_trans_id);


--
-- Name: acg_trs_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acg_trs_attt_txcrs ON acctg_trans_attribute USING btree (created_tx_stamp);


--
-- Name: acg_trs_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acg_trs_attt_txstp ON acctg_trans_attribute USING btree (last_updated_tx_stamp);


--
-- Name: acctg_trans_attribute accttx_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_attribute
    ADD CONSTRAINT accttx_attr FOREIGN KEY (acctg_trans_id) REFERENCES acctg_trans(acctg_trans_id);


--
-- PostgreSQL database dump complete
--

