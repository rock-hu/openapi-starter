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
-- Name: uom_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE uom_group (
    uom_group_id character varying(20) NOT NULL,
    uom_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.uom_group OWNER TO ofbiz;

--
-- Name: uom_group pk_uom_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_group
    ADD CONSTRAINT pk_uom_group PRIMARY KEY (uom_group_id, uom_id);


--
-- Name: uom_group_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_group_txcrts ON uom_group USING btree (created_tx_stamp);


--
-- Name: uom_group_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_group_txstmp ON uom_group USING btree (last_updated_tx_stamp);


--
-- Name: uom_group_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_group_uom ON uom_group USING btree (uom_id);


--
-- Name: uom_group uom_group_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom_group
    ADD CONSTRAINT uom_group_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

