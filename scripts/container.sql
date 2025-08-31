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
-- Name: container; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE container (
    container_id character varying(20) NOT NULL,
    container_type_id character varying(20),
    facility_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.container OWNER TO ofbiz;

--
-- Name: container pk_container; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container
    ADD CONSTRAINT pk_container PRIMARY KEY (container_id);


--
-- Name: container_cttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX container_cttyp ON container USING btree (container_type_id);


--
-- Name: container_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX container_facility ON container USING btree (facility_id);


--
-- Name: container_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX container_txcrts ON container USING btree (created_tx_stamp);


--
-- Name: container_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX container_txstmp ON container USING btree (last_updated_tx_stamp);


--
-- Name: container container_cttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container
    ADD CONSTRAINT container_cttyp FOREIGN KEY (container_type_id) REFERENCES container_type(container_type_id);


--
-- Name: container container_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container
    ADD CONSTRAINT container_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

