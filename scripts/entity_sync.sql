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
-- Name: entity_sync; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_sync (
    entity_sync_id character varying(20) NOT NULL,
    run_status_id character varying(20),
    last_successful_synch_time timestamp with time zone,
    last_history_start_date timestamp with time zone,
    pre_offline_synch_time timestamp with time zone,
    offline_sync_split_millis numeric(20,0),
    sync_split_millis numeric(20,0),
    sync_end_buffer_millis numeric(20,0),
    max_running_no_update_millis numeric(20,0),
    target_service_name character varying(255),
    target_delegator_name character varying(255),
    keep_remove_info_hours double precision,
    for_pull_only character(1),
    for_push_only character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_sync OWNER TO ofbiz;

--
-- Name: entity_sync pk_entity_sync; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync
    ADD CONSTRAINT pk_entity_sync PRIMARY KEY (entity_sync_id);


--
-- Name: entity_sync_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entity_sync_txcrts ON entity_sync USING btree (created_tx_stamp);


--
-- Name: entity_sync_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entity_sync_txstmp ON entity_sync USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

