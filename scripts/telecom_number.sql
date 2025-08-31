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
-- Name: telecom_number; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE telecom_number (
    contact_mech_id character varying(20) NOT NULL,
    country_code character varying(10),
    area_code character varying(10),
    contact_number character varying(60),
    ask_for_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.telecom_number OWNER TO ofbiz;

--
-- Name: telecom_number pk_telecom_number; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY telecom_number
    ADD CONSTRAINT pk_telecom_number PRIMARY KEY (contact_mech_id);


--
-- Name: area_code_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX area_code_idx ON telecom_number USING btree (area_code);


--
-- Name: contact_number_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contact_number_idx ON telecom_number USING btree (contact_number);


--
-- Name: country_code_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX country_code_idx ON telecom_number USING btree (country_code);


--
-- Name: tel_num_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tel_num_cmech ON telecom_number USING btree (contact_mech_id);


--
-- Name: tlcm_nmbr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tlcm_nmbr_txcrts ON telecom_number USING btree (created_tx_stamp);


--
-- Name: tlcm_nmbr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tlcm_nmbr_txstmp ON telecom_number USING btree (last_updated_tx_stamp);


--
-- Name: telecom_number tel_num_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY telecom_number
    ADD CONSTRAINT tel_num_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- PostgreSQL database dump complete
--

