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
-- Name: status_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE status_item (
    status_id character varying(20) NOT NULL,
    status_type_id character varying(20),
    status_code character varying(60),
    sequence_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.status_item OWNER TO ofbiz;

--
-- Name: status_item pk_status_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY status_item
    ADD CONSTRAINT pk_status_item PRIMARY KEY (status_id);


--
-- Name: status_item_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX status_item_txcrts ON status_item USING btree (created_tx_stamp);


--
-- Name: status_item_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX status_item_txstmp ON status_item USING btree (last_updated_tx_stamp);


--
-- Name: status_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX status_to_type ON status_item USING btree (status_type_id);


--
-- Name: status_item status_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY status_item
    ADD CONSTRAINT status_to_type FOREIGN KEY (status_type_id) REFERENCES status_type(status_type_id);


--
-- PostgreSQL database dump complete
--

