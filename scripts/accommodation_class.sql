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
-- Name: accommodation_class; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE accommodation_class (
    accommodation_class_id character varying(20) NOT NULL,
    parent_class_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.accommodation_class OWNER TO ofbiz;

--
-- Name: accommodation_class pk_accommodation_class; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_class
    ADD CONSTRAINT pk_accommodation_class PRIMARY KEY (accommodation_class_id);


--
-- Name: accmmdn_cls_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdn_cls_txcrts ON accommodation_class USING btree (created_tx_stamp);


--
-- Name: accmmdn_cls_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdn_cls_txstmp ON accommodation_class USING btree (last_updated_tx_stamp);


--
-- Name: accomm_class_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accomm_class_par ON accommodation_class USING btree (parent_class_id);


--
-- Name: accommodation_class accomm_class_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_class
    ADD CONSTRAINT accomm_class_par FOREIGN KEY (parent_class_id) REFERENCES accommodation_class(accommodation_class_id);


--
-- PostgreSQL database dump complete
--

