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
-- Name: party_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_role (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_role OWNER TO ofbiz;

--
-- Name: party_role pk_party_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_role
    ADD CONSTRAINT pk_party_role PRIMARY KEY (party_id, role_type_id);


--
-- Name: party_rle_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rle_party ON party_role USING btree (party_id);


--
-- Name: party_rle_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rle_role ON party_role USING btree (role_type_id);


--
-- Name: party_role_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_role_txcrts ON party_role USING btree (created_tx_stamp);


--
-- Name: party_role_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_role_txstmp ON party_role USING btree (last_updated_tx_stamp);


--
-- Name: party_role party_rle_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_role
    ADD CONSTRAINT party_rle_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_role party_rle_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_role
    ADD CONSTRAINT party_rle_role FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

