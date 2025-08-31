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
-- Name: ftp_address; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE ftp_address (
    contact_mech_id character varying(20) NOT NULL,
    hostname character varying(255),
    port numeric(20,0),
    username character varying(255),
    ftp_password character varying(255),
    binary_transfer character(1),
    file_path character varying(255),
    zip_file character(1),
    passive_mode character(1),
    default_timeout numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.ftp_address OWNER TO ofbiz;

--
-- Name: ftp_address pk_ftp_address; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY ftp_address
    ADD CONSTRAINT pk_ftp_address PRIMARY KEY (contact_mech_id);


--
-- Name: ftp_address_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ftp_address_txcrts ON ftp_address USING btree (created_tx_stamp);


--
-- Name: ftp_address_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ftp_address_txstmp ON ftp_address USING btree (last_updated_tx_stamp);


--
-- Name: ftp_srv_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ftp_srv_cmech ON ftp_address USING btree (contact_mech_id);


--
-- Name: ftp_address ftp_srv_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY ftp_address
    ADD CONSTRAINT ftp_srv_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- PostgreSQL database dump complete
--

