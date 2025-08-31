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
-- Name: entity_group_entry; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_group_entry (
    entity_group_id character varying(20) NOT NULL,
    entity_or_package character varying(255) NOT NULL,
    appl_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_group_entry OWNER TO ofbiz;

--
-- Name: entity_group_entry pk_entity_group_entry; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_group_entry
    ADD CONSTRAINT pk_entity_group_entry PRIMARY KEY (entity_group_id, entity_or_package);


--
-- Name: ent_grp_enr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_grp_enr_txcrts ON entity_group_entry USING btree (created_tx_stamp);


--
-- Name: ent_grp_enr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ent_grp_enr_txstmp ON entity_group_entry USING btree (last_updated_tx_stamp);


--
-- Name: entgrp_grp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entgrp_grp ON entity_group_entry USING btree (entity_group_id);


--
-- Name: entity_group_entry entgrp_grp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_group_entry
    ADD CONSTRAINT entgrp_grp FOREIGN KEY (entity_group_id) REFERENCES entity_group(entity_group_id);


--
-- PostgreSQL database dump complete
--

