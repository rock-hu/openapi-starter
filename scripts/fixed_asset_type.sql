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
-- Name: fixed_asset_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_type (
    fixed_asset_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_type OWNER TO ofbiz;

--
-- Name: fixed_asset_type pk_fixed_asset_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type
    ADD CONSTRAINT pk_fixed_asset_type PRIMARY KEY (fixed_asset_type_id);


--
-- Name: fixedast_typpar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_typpar ON fixed_asset_type USING btree (parent_type_id);


--
-- Name: fxd_asst_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_asst_tp_txcrts ON fixed_asset_type USING btree (created_tx_stamp);


--
-- Name: fxd_asst_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_asst_tp_txstmp ON fixed_asset_type USING btree (last_updated_tx_stamp);


--
-- Name: fixed_asset_type fixedast_typpar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_type
    ADD CONSTRAINT fixedast_typpar FOREIGN KEY (parent_type_id) REFERENCES fixed_asset_type(fixed_asset_type_id);


--
-- PostgreSQL database dump complete
--

