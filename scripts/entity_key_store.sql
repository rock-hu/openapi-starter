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
-- Name: entity_key_store; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_key_store (
    key_name character varying(255) NOT NULL,
    key_text character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_key_store OWNER TO ofbiz;

--
-- Name: entity_key_store pk_entity_key_store; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_key_store
    ADD CONSTRAINT pk_entity_key_store PRIMARY KEY (key_name);


--
-- Name: entt_k_str_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_k_str_txcrts ON entity_key_store USING btree (created_tx_stamp);


--
-- Name: entt_k_str_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_k_str_txstmp ON entity_key_store USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

