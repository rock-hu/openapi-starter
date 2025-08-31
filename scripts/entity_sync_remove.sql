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
-- Name: entity_sync_remove; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_sync_remove (
    entity_sync_remove_id character varying(20) NOT NULL,
    primary_key_removed text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_sync_remove OWNER TO ofbiz;

--
-- Name: entity_sync_remove pk_entity_sync_remove; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_remove
    ADD CONSTRAINT pk_entity_sync_remove PRIMARY KEY (entity_sync_remove_id);


--
-- Name: ent_snc_rmv_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_rmv_txcrts ON entity_sync_remove USING btree (created_tx_stamp);


--
-- Name: ent_snc_rmv_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_rmv_txstmp ON entity_sync_remove USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

