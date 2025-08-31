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
-- Name: party_relationship_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_relationship_type (
    party_relationship_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    party_relationship_name character varying(100),
    description character varying(255),
    role_type_id_valid_from character varying(20),
    role_type_id_valid_to character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_relationship_type OWNER TO ofbiz;

--
-- Name: party_relationship_type pk_party_relationship_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship_type
    ADD CONSTRAINT pk_party_relationship_type PRIMARY KEY (party_relationship_type_id);


--
-- Name: party_reltyp_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_reltyp_par ON party_relationship_type USING btree (parent_type_id);


--
-- Name: party_reltyp_vfrt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_reltyp_vfrt ON party_relationship_type USING btree (role_type_id_valid_from);


--
-- Name: party_reltyp_vtrt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_reltyp_vtrt ON party_relationship_type USING btree (role_type_id_valid_to);


--
-- Name: prt_rltnp_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rltnp_tp_txcrs ON party_relationship_type USING btree (created_tx_stamp);


--
-- Name: prt_rltnp_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rltnp_tp_txstp ON party_relationship_type USING btree (last_updated_tx_stamp);


--
-- Name: party_relationship_type party_reltyp_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship_type
    ADD CONSTRAINT party_reltyp_par FOREIGN KEY (parent_type_id) REFERENCES party_relationship_type(party_relationship_type_id);


--
-- Name: party_relationship_type party_reltyp_vfrt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship_type
    ADD CONSTRAINT party_reltyp_vfrt FOREIGN KEY (role_type_id_valid_from) REFERENCES role_type(role_type_id);


--
-- Name: party_relationship_type party_reltyp_vtrt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_relationship_type
    ADD CONSTRAINT party_reltyp_vtrt FOREIGN KEY (role_type_id_valid_to) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

