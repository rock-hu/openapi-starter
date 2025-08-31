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
-- Name: role_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE role_type (
    role_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.role_type OWNER TO ofbiz;

--
-- Name: role_type pk_role_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY role_type
    ADD CONSTRAINT pk_role_type PRIMARY KEY (role_type_id);


--
-- Name: role_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX role_type_par ON role_type USING btree (parent_type_id);


--
-- Name: role_type_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX role_type_txcrts ON role_type USING btree (created_tx_stamp);


--
-- Name: role_type_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX role_type_txstmp ON role_type USING btree (last_updated_tx_stamp);


--
-- Name: role_type role_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY role_type
    ADD CONSTRAINT role_type_par FOREIGN KEY (parent_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

