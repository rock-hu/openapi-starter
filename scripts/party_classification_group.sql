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
-- Name: party_classification_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_classification_group (
    party_classification_group_id character varying(20) NOT NULL,
    party_classification_type_id character varying(20),
    parent_group_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_classification_group OWNER TO ofbiz;

--
-- Name: party_classification_group pk_party_classification_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification_group
    ADD CONSTRAINT pk_party_classification_group PRIMARY KEY (party_classification_group_id);


--
-- Name: party_class_grppar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_class_grppar ON party_classification_group USING btree (parent_group_id);


--
-- Name: party_clsgrp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_clsgrp_type ON party_classification_group USING btree (party_classification_type_id);


--
-- Name: prt_clssn_grp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssn_grp_txcs ON party_classification_group USING btree (created_tx_stamp);


--
-- Name: prt_clssn_grp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssn_grp_txsp ON party_classification_group USING btree (last_updated_tx_stamp);


--
-- Name: party_classification_group party_class_grppar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification_group
    ADD CONSTRAINT party_class_grppar FOREIGN KEY (parent_group_id) REFERENCES party_classification_group(party_classification_group_id);


--
-- Name: party_classification_group party_clsgrp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification_group
    ADD CONSTRAINT party_clsgrp_type FOREIGN KEY (party_classification_type_id) REFERENCES party_classification_type(party_classification_type_id);


--
-- PostgreSQL database dump complete
--

