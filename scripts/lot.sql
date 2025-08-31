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
-- Name: lot; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE lot (
    lot_id character varying(20) NOT NULL,
    creation_date timestamp with time zone,
    quantity numeric(18,6),
    expiration_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.lot OWNER TO ofbiz;

--
-- Name: lot pk_lot; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY lot
    ADD CONSTRAINT pk_lot PRIMARY KEY (lot_id);


--
-- Name: lot_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX lot_txcrts ON lot USING btree (created_tx_stamp);


--
-- Name: lot_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX lot_txstmp ON lot USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

