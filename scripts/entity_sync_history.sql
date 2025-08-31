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
-- Name: entity_sync_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_sync_history (
    entity_sync_id character varying(20) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    run_status_id character varying(20),
    beginning_synch_time timestamp with time zone,
    last_successful_synch_time timestamp with time zone,
    last_candidate_end_time timestamp with time zone,
    last_split_start_time numeric(20,0),
    to_create_inserted numeric(20,0),
    to_create_updated numeric(20,0),
    to_create_not_updated numeric(20,0),
    to_store_inserted numeric(20,0),
    to_store_updated numeric(20,0),
    to_store_not_updated numeric(20,0),
    to_remove_deleted numeric(20,0),
    to_remove_already_deleted numeric(20,0),
    total_rows_exported numeric(20,0),
    total_rows_to_create numeric(20,0),
    total_rows_to_store numeric(20,0),
    total_rows_to_remove numeric(20,0),
    total_splits numeric(20,0),
    total_store_calls numeric(20,0),
    running_time_millis numeric(20,0),
    per_split_min_millis numeric(20,0),
    per_split_max_millis numeric(20,0),
    per_split_min_items numeric(20,0),
    per_split_max_items numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_sync_history OWNER TO ofbiz;

--
-- Name: entity_sync_history pk_entity_sync_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_history
    ADD CONSTRAINT pk_entity_sync_history PRIMARY KEY (entity_sync_id, start_date);


--
-- Name: ent_snc_hsr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_hsr_txcrts ON entity_sync_history USING btree (created_tx_stamp);


--
-- Name: ent_snc_hsr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_hsr_txstmp ON entity_sync_history USING btree (last_updated_tx_stamp);


--
-- Name: entsync_hstsnc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entsync_hstsnc ON entity_sync_history USING btree (entity_sync_id);


--
-- Name: entity_sync_history entsync_hstsnc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_history
    ADD CONSTRAINT entsync_hstsnc FOREIGN KEY (entity_sync_id) REFERENCES entity_sync(entity_sync_id);


--
-- PostgreSQL database dump complete
--

