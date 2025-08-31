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
-- Name: segment_group_classification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE segment_group_classification (
    segment_group_id character varying(20) NOT NULL,
    party_classification_group_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.segment_group_classification OWNER TO ofbiz;

--
-- Name: segment_group_classification pk_segment_group_classificatio; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_classification
    ADD CONSTRAINT pk_segment_group_classificatio PRIMARY KEY (segment_group_id, party_classification_group_id);


--
-- Name: sgmtgrpcls_pcgp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrpcls_pcgp ON segment_group_classification USING btree (party_classification_group_id);


--
-- Name: sgmtgrpcls_sggp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrpcls_sggp ON segment_group_classification USING btree (segment_group_id);


--
-- Name: sgt_grp_clssn_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgt_grp_clssn_txcs ON segment_group_classification USING btree (created_tx_stamp);


--
-- Name: sgt_grp_clssn_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgt_grp_clssn_txsp ON segment_group_classification USING btree (last_updated_tx_stamp);


--
-- Name: segment_group_classification sgmtgrpcls_pcgp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_classification
    ADD CONSTRAINT sgmtgrpcls_pcgp FOREIGN KEY (party_classification_group_id) REFERENCES party_classification_group(party_classification_group_id);


--
-- Name: segment_group_classification sgmtgrpcls_sggp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_classification
    ADD CONSTRAINT sgmtgrpcls_sggp FOREIGN KEY (segment_group_id) REFERENCES segment_group(segment_group_id);


--
-- PostgreSQL database dump complete
--

