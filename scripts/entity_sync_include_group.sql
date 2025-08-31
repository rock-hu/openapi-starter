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
-- Name: entity_sync_include_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_sync_include_group (
    entity_sync_id character varying(20) NOT NULL,
    entity_group_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_sync_include_group OWNER TO ofbiz;

--
-- Name: entity_sync_include_group pk_entity_sync_include_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_include_group
    ADD CONSTRAINT pk_entity_sync_include_group PRIMARY KEY (entity_sync_id, entity_group_id);


--
-- Name: ent_snc_ind_grp_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_ind_grp_tp ON entity_sync_include_group USING btree (last_updated_tx_stamp);


--
-- Name: ent_snc_ind_grp_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_snc_ind_grp_ts ON entity_sync_include_group USING btree (created_tx_stamp);


--
-- Name: entsncgu_grp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entsncgu_grp ON entity_sync_include_group USING btree (entity_group_id);


--
-- Name: entsncgu_snc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entsncgu_snc ON entity_sync_include_group USING btree (entity_sync_id);


--
-- Name: entity_sync_include_group entsncgu_grp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_include_group
    ADD CONSTRAINT entsncgu_grp FOREIGN KEY (entity_group_id) REFERENCES entity_group(entity_group_id);


--
-- Name: entity_sync_include_group entsncgu_snc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_sync_include_group
    ADD CONSTRAINT entsncgu_snc FOREIGN KEY (entity_sync_id) REFERENCES entity_sync(entity_sync_id);


--
-- PostgreSQL database dump complete
--

