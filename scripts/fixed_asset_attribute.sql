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
-- Name: fixed_asset_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_attribute (
    fixed_asset_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_attribute OWNER TO ofbiz;

--
-- Name: fixed_asset_attribute pk_fixed_asset_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_attribute
    ADD CONSTRAINT pk_fixed_asset_attribute PRIMARY KEY (fixed_asset_id, attr_name);


--
-- Name: fixedast_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_attr ON fixed_asset_attribute USING btree (fixed_asset_id);


--
-- Name: fxd_ast_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_attt_txcrs ON fixed_asset_attribute USING btree (created_tx_stamp);


--
-- Name: fxd_ast_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_attt_txstp ON fixed_asset_attribute USING btree (last_updated_tx_stamp);


--
-- Name: fixed_asset_attribute fixedast_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_attribute
    ADD CONSTRAINT fixedast_attr FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- PostgreSQL database dump complete
--

