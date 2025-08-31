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
-- Name: deliverable; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE deliverable (
    deliverable_id character varying(20) NOT NULL,
    deliverable_type_id character varying(20),
    deliverable_name character varying(100),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.deliverable OWNER TO ofbiz;

--
-- Name: deliverable pk_deliverable; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deliverable
    ADD CONSTRAINT pk_deliverable PRIMARY KEY (deliverable_id);


--
-- Name: deliverable_dltyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliverable_dltyp ON deliverable USING btree (deliverable_type_id);


--
-- Name: deliverable_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliverable_txcrts ON deliverable USING btree (created_tx_stamp);


--
-- Name: deliverable_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliverable_txstmp ON deliverable USING btree (last_updated_tx_stamp);


--
-- Name: deliverable deliverable_dltyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deliverable
    ADD CONSTRAINT deliverable_dltyp FOREIGN KEY (deliverable_type_id) REFERENCES deliverable_type(deliverable_type_id);


--
-- PostgreSQL database dump complete
--

