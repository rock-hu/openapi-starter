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
-- Name: party_classification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_classification (
    party_id character varying(20) NOT NULL,
    party_classification_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_classification OWNER TO ofbiz;

--
-- Name: party_classification pk_party_classification; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification
    ADD CONSTRAINT pk_party_classification PRIMARY KEY (party_id, party_classification_group_id, from_date);


--
-- Name: party_class_grp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_class_grp ON party_classification USING btree (party_classification_group_id);


--
-- Name: party_class_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_class_party ON party_classification USING btree (party_id);


--
-- Name: prt_clssfcn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssfcn_txcrts ON party_classification USING btree (created_tx_stamp);


--
-- Name: prt_clssfcn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssfcn_txstmp ON party_classification USING btree (last_updated_tx_stamp);


--
-- Name: party_classification party_class_grp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification
    ADD CONSTRAINT party_class_grp FOREIGN KEY (party_classification_group_id) REFERENCES party_classification_group(party_classification_group_id);


--
-- Name: party_classification party_class_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification
    ADD CONSTRAINT party_class_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

