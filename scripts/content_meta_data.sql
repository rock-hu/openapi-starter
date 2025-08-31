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
-- Name: content_meta_data; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_meta_data (
    content_id character varying(20) NOT NULL,
    meta_data_predicate_id character varying(20) NOT NULL,
    meta_data_value character varying(255),
    data_source_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_meta_data OWNER TO ofbiz;

--
-- Name: content_meta_data pk_content_meta_data; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_meta_data
    ADD CONSTRAINT pk_content_meta_data PRIMARY KEY (content_id, meta_data_predicate_id);


--
-- Name: cntnt_mt_dt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_mt_dt_txcrts ON content_meta_data USING btree (created_tx_stamp);


--
-- Name: cntnt_mt_dt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_mt_dt_txstmp ON content_meta_data USING btree (last_updated_tx_stamp);


--
-- Name: contentmd_cntnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentmd_cntnt ON content_meta_data USING btree (content_id);


--
-- Name: contentmd_dmdprd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentmd_dmdprd ON content_meta_data USING btree (meta_data_predicate_id);


--
-- Name: contentmd_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contentmd_dtsrc ON content_meta_data USING btree (data_source_id);


--
-- Name: content_meta_data contentmd_cntnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_meta_data
    ADD CONSTRAINT contentmd_cntnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: content_meta_data contentmd_dmdprd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_meta_data
    ADD CONSTRAINT contentmd_dmdprd FOREIGN KEY (meta_data_predicate_id) REFERENCES meta_data_predicate(meta_data_predicate_id);


--
-- Name: content_meta_data contentmd_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_meta_data
    ADD CONSTRAINT contentmd_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- PostgreSQL database dump complete
--

