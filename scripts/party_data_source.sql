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
-- Name: party_data_source; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_data_source (
    party_id character varying(20) NOT NULL,
    data_source_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    visit_id character varying(20),
    comments character varying(255),
    is_create character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_data_source OWNER TO ofbiz;

--
-- Name: party_data_source pk_party_data_source; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_data_source
    ADD CONSTRAINT pk_party_data_source PRIMARY KEY (party_id, data_source_id, from_date);


--
-- Name: party_datsrc_dsc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_datsrc_dsc ON party_data_source USING btree (data_source_id);


--
-- Name: party_datsrc_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_datsrc_pty ON party_data_source USING btree (party_id);


--
-- Name: prt_dt_src_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_dt_src_txcrts ON party_data_source USING btree (created_tx_stamp);


--
-- Name: prt_dt_src_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_dt_src_txstmp ON party_data_source USING btree (last_updated_tx_stamp);


--
-- Name: party_data_source party_datsrc_dsc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_data_source
    ADD CONSTRAINT party_datsrc_dsc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: party_data_source party_datsrc_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_data_source
    ADD CONSTRAINT party_datsrc_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

