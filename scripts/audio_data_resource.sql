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
-- Name: audio_data_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE audio_data_resource (
    data_resource_id character varying(20) NOT NULL,
    audio_data bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.audio_data_resource OWNER TO ofbiz;

--
-- Name: audio_data_resource pk_audio_data_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY audio_data_resource
    ADD CONSTRAINT pk_audio_data_resource PRIMARY KEY (data_resource_id);


--
-- Name: ad_dt_rsrc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ad_dt_rsrc_txcrts ON audio_data_resource USING btree (created_tx_stamp);


--
-- Name: ad_dt_rsrc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ad_dt_rsrc_txstmp ON audio_data_resource USING btree (last_updated_tx_stamp);


--
-- Name: data_rec_audio; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_audio ON audio_data_resource USING btree (data_resource_id);


--
-- Name: audio_data_resource data_rec_audio; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY audio_data_resource
    ADD CONSTRAINT data_rec_audio FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- PostgreSQL database dump complete
--

