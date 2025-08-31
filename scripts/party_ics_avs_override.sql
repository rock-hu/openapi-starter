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
-- Name: party_ics_avs_override; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_ics_avs_override (
    party_id character varying(20) NOT NULL,
    avs_decline_string character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_ics_avs_override OWNER TO ofbiz;

--
-- Name: party_ics_avs_override pk_party_ics_avs_override; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_ics_avs_override
    ADD CONSTRAINT pk_party_ics_avs_override PRIMARY KEY (party_id);


--
-- Name: party_icsavs_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_icsavs_party ON party_ics_avs_override USING btree (party_id);


--
-- Name: prt_ics_avs_ovd_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ics_avs_ovd_tp ON party_ics_avs_override USING btree (last_updated_tx_stamp);


--
-- Name: prt_ics_avs_ovd_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ics_avs_ovd_ts ON party_ics_avs_override USING btree (created_tx_stamp);


--
-- Name: party_ics_avs_override party_icsavs_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_ics_avs_override
    ADD CONSTRAINT party_icsavs_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

