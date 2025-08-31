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
-- Name: keyword_thesaurus; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE keyword_thesaurus (
    entered_keyword character varying(255) NOT NULL,
    alternate_keyword character varying(255) NOT NULL,
    relationship_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.keyword_thesaurus OWNER TO ofbiz;

--
-- Name: keyword_thesaurus pk_keyword_thesaurus; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY keyword_thesaurus
    ADD CONSTRAINT pk_keyword_thesaurus PRIMARY KEY (entered_keyword, alternate_keyword);


--
-- Name: kw_thrs_rlenm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX kw_thrs_rlenm ON keyword_thesaurus USING btree (relationship_enum_id);


--
-- Name: kwrd_thsrs_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX kwrd_thsrs_txcrts ON keyword_thesaurus USING btree (created_tx_stamp);


--
-- Name: kwrd_thsrs_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX kwrd_thsrs_txstmp ON keyword_thesaurus USING btree (last_updated_tx_stamp);


--
-- Name: keyword_thesaurus kw_thrs_rlenm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY keyword_thesaurus
    ADD CONSTRAINT kw_thrs_rlenm FOREIGN KEY (relationship_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

