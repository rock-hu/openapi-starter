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
-- Name: party_identification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_identification (
    party_id character varying(20) NOT NULL,
    party_identification_type_id character varying(20) NOT NULL,
    id_value character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_identification OWNER TO ofbiz;

--
-- Name: party_identification pk_party_identification; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_identification
    ADD CONSTRAINT pk_party_identification PRIMARY KEY (party_id, party_identification_type_id);


--
-- Name: party_id_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_id_product ON party_identification USING btree (party_id);


--
-- Name: party_id_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_id_type ON party_identification USING btree (party_identification_type_id);


--
-- Name: party_id_validx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_id_validx ON party_identification USING btree (id_value);


--
-- Name: prt_idntfcn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_idntfcn_txcrts ON party_identification USING btree (created_tx_stamp);


--
-- Name: prt_idntfcn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_idntfcn_txstmp ON party_identification USING btree (last_updated_tx_stamp);


--
-- Name: party_identification party_id_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_identification
    ADD CONSTRAINT party_id_product FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_identification party_id_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_identification
    ADD CONSTRAINT party_id_type FOREIGN KEY (party_identification_type_id) REFERENCES party_identification_type(party_identification_type_id);


--
-- PostgreSQL database dump complete
--

