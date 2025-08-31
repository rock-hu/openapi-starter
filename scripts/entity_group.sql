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
-- Name: entity_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_group (
    entity_group_id character varying(20) NOT NULL,
    entity_group_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_group OWNER TO ofbiz;

--
-- Name: entity_group pk_entity_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_group
    ADD CONSTRAINT pk_entity_group PRIMARY KEY (entity_group_id);


--
-- Name: entt_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_grp_txcrts ON entity_group USING btree (created_tx_stamp);


--
-- Name: entt_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_grp_txstmp ON entity_group USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

