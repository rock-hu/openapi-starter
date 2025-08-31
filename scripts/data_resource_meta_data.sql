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
-- Name: data_resource_meta_data; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource_meta_data (
    data_resource_id character varying(20) NOT NULL,
    meta_data_predicate_id character varying(20) NOT NULL,
    meta_data_value character varying(255),
    data_source_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource_meta_data OWNER TO ofbiz;

--
-- Name: data_resource_meta_data pk_data_resource_meta_data; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_meta_data
    ADD CONSTRAINT pk_data_resource_meta_data PRIMARY KEY (data_resource_id, meta_data_predicate_id);


--
-- Name: data_md_datrec; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_md_datrec ON data_resource_meta_data USING btree (data_resource_id);


--
-- Name: data_md_dmdprd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_md_dmdprd ON data_resource_meta_data USING btree (meta_data_predicate_id);


--
-- Name: data_md_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_md_dtsrc ON data_resource_meta_data USING btree (data_source_id);


--
-- Name: dt_rsc_mt_dt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_mt_dt_txcrs ON data_resource_meta_data USING btree (created_tx_stamp);


--
-- Name: dt_rsc_mt_dt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_mt_dt_txstp ON data_resource_meta_data USING btree (last_updated_tx_stamp);


--
-- Name: data_resource_meta_data data_md_datrec; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_meta_data
    ADD CONSTRAINT data_md_datrec FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: data_resource_meta_data data_md_dmdprd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_meta_data
    ADD CONSTRAINT data_md_dmdprd FOREIGN KEY (meta_data_predicate_id) REFERENCES meta_data_predicate(meta_data_predicate_id);


--
-- Name: data_resource_meta_data data_md_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_meta_data
    ADD CONSTRAINT data_md_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- PostgreSQL database dump complete
--

