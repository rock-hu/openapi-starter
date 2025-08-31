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
-- Name: party_skill; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_skill (
    party_id character varying(20) NOT NULL,
    skill_type_id character varying(20) NOT NULL,
    years_experience numeric(20,0),
    rating numeric(20,0),
    skill_level numeric(20,0),
    started_using_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_skill OWNER TO ofbiz;

--
-- Name: party_skill pk_party_skill; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_skill
    ADD CONSTRAINT pk_party_skill PRIMARY KEY (party_id, skill_type_id);


--
-- Name: party_skill_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_skill_txcrts ON party_skill USING btree (created_tx_stamp);


--
-- Name: party_skill_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_skill_txstmp ON party_skill USING btree (last_updated_tx_stamp);


--
-- Name: party_skll_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_skll_prty ON party_skill USING btree (party_id);


--
-- Name: party_skll_sktp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_skll_sktp ON party_skill USING btree (skill_type_id);


--
-- Name: party_skill party_skll_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_skill
    ADD CONSTRAINT party_skll_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_skill party_skll_sktp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_skill
    ADD CONSTRAINT party_skll_sktp FOREIGN KEY (skill_type_id) REFERENCES skill_type(skill_type_id);


--
-- PostgreSQL database dump complete
--

