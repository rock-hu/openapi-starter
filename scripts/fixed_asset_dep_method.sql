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
-- Name: fixed_asset_dep_method; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_dep_method (
    depreciation_custom_method_id character varying(20) NOT NULL,
    fixed_asset_id character varying(20) NOT NULL,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_dep_method OWNER TO ofbiz;

--
-- Name: fixed_asset_dep_method pk_fixed_asset_dep_method; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_dep_method
    ADD CONSTRAINT pk_fixed_asset_dep_method PRIMARY KEY (depreciation_custom_method_id, fixed_asset_id);


--
-- Name: fixdast_dm_cmet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdast_dm_cmet ON fixed_asset_dep_method USING btree (depreciation_custom_method_id);


--
-- Name: fixdast_dm_fxast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdast_dm_fxast ON fixed_asset_dep_method USING btree (fixed_asset_id);


--
-- Name: fxd_ast_dp_mtd_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_dp_mtd_txp ON fixed_asset_dep_method USING btree (last_updated_tx_stamp);


--
-- Name: fxd_ast_dp_mtd_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_dp_mtd_txs ON fixed_asset_dep_method USING btree (created_tx_stamp);


--
-- Name: fixed_asset_dep_method fixdast_dm_cmet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_dep_method
    ADD CONSTRAINT fixdast_dm_cmet FOREIGN KEY (depreciation_custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: fixed_asset_dep_method fixdast_dm_fxast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_dep_method
    ADD CONSTRAINT fixdast_dm_fxast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- PostgreSQL database dump complete
--

