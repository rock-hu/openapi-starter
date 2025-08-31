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
-- Name: character_set; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE character_set (
    character_set_id character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.character_set OWNER TO ofbiz;

--
-- Name: character_set pk_character_set; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY character_set
    ADD CONSTRAINT pk_character_set PRIMARY KEY (character_set_id);


--
-- Name: chrctr_st_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX chrctr_st_txcrts ON character_set USING btree (created_tx_stamp);


--
-- Name: chrctr_st_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX chrctr_st_txstmp ON character_set USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

