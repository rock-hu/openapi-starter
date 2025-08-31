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
-- Name: entity_sync_include; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_sync_include (
    entity_sync_id character varying(20) NOT NULL,
    entity_or_package character varying(255) NOT NULL,
    appl_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_sync_include OWNER TO ofbiz;

--
-- Name: entity_sync_include pk_entity_sync_include; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_include
    ADD CONSTRAINT pk_entity_sync_include PRIMARY KEY (entity_sync_id, entity_or_package);


--
-- Name: ent_snc_incd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_incd_txcrs ON entity_sync_include USING btree (created_tx_stamp);


--
-- Name: ent_snc_incd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_incd_txstp ON entity_sync_include USING btree (last_updated_tx_stamp);


--
-- Name: entsync_incsnc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entsync_incsnc ON entity_sync_include USING btree (entity_sync_id);


--
-- Name: entity_sync_include entsync_incsnc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_include
    ADD CONSTRAINT entsync_incsnc FOREIGN KEY (entity_sync_id) REFERENCES entity_sync(entity_sync_id);


--
-- PostgreSQL database dump complete
--

