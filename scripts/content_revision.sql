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
-- Name: content_revision; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_revision (
    content_id character varying(20) NOT NULL,
    content_revision_seq_id character varying(20) NOT NULL,
    committed_by_party_id character varying(20),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_revision OWNER TO ofbiz;

--
-- Name: content_revision pk_content_revision; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision
    ADD CONSTRAINT pk_content_revision PRIMARY KEY (content_id, content_revision_seq_id);


--
-- Name: cntnt_rvsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rvsn_txcrts ON content_revision USING btree (created_tx_stamp);


--
-- Name: cntnt_rvsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_rvsn_txstmp ON content_revision USING btree (last_updated_tx_stamp);


--
-- Name: cntntrev_cbpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntrev_cbpty ON content_revision USING btree (committed_by_party_id);


--
-- Name: cntntrev_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntntrev_cnt ON content_revision USING btree (content_id);


--
-- Name: content_revision cntntrev_cbpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision
    ADD CONSTRAINT cntntrev_cbpty FOREIGN KEY (committed_by_party_id) REFERENCES party(party_id);


--
-- Name: content_revision cntntrev_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_revision
    ADD CONSTRAINT cntntrev_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- PostgreSQL database dump complete
--

