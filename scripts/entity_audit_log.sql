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
-- Name: entity_audit_log; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE entity_audit_log (
    audit_history_seq_id character varying(20) NOT NULL,
    changed_entity_name character varying(255),
    changed_field_name character varying(255),
    pk_combined_value_text character varying(255),
    old_value_text character varying(255),
    new_value_text character varying(255),
    changed_date timestamp with time zone,
    changed_by_info character varying(255),
    changed_session_info character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.entity_audit_log OWNER TO ofbiz;

--
-- Name: entity_audit_log pk_entity_audit_log; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY entity_audit_log
    ADD CONSTRAINT pk_entity_audit_log PRIMARY KEY (audit_history_seq_id);


--
-- Name: entt_adt_lg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_adt_lg_txcrts ON entity_audit_log USING btree (created_tx_stamp);


--
-- Name: entt_adt_lg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entt_adt_lg_txstmp ON entity_audit_log USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

