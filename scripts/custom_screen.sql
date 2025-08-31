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
-- Name: custom_screen; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE custom_screen (
    custom_screen_id character varying(20) NOT NULL,
    custom_screen_type_id character varying(20),
    custom_screen_name character varying(255),
    custom_screen_location character varying(255),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.custom_screen OWNER TO ofbiz;

--
-- Name: custom_screen pk_custom_screen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_screen
    ADD CONSTRAINT pk_custom_screen PRIMARY KEY (custom_screen_id);


--
-- Name: cscr_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cscr_to_type ON custom_screen USING btree (custom_screen_type_id);


--
-- Name: cstm_scrn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_scrn_txcrts ON custom_screen USING btree (created_tx_stamp);


--
-- Name: cstm_scrn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_scrn_txstmp ON custom_screen USING btree (last_updated_tx_stamp);


--
-- Name: custom_screen cscr_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_screen
    ADD CONSTRAINT cscr_to_type FOREIGN KEY (custom_screen_type_id) REFERENCES custom_screen_type(custom_screen_type_id);


--
-- PostgreSQL database dump complete
--

