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
-- Name: content_purpose; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_purpose (
    content_id character varying(20) NOT NULL,
    content_purpose_type_id character varying(20) NOT NULL,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_purpose OWNER TO ofbiz;

--
-- Name: content_purpose pk_content_purpose; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose
    ADD CONSTRAINT pk_content_purpose PRIMARY KEY (content_id, content_purpose_type_id);


--
-- Name: cntnt_prps_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_prps_txcrts ON content_purpose USING btree (created_tx_stamp);


--
-- Name: cntnt_prps_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_prps_txstmp ON content_purpose USING btree (last_updated_tx_stamp);


--
-- Name: content_prp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_prp ON content_purpose USING btree (content_id);


--
-- Name: content_prp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX content_prp_type ON content_purpose USING btree (content_purpose_type_id);


--
-- Name: content_purpose content_prp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose
    ADD CONSTRAINT content_prp FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: content_purpose content_prp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_purpose
    ADD CONSTRAINT content_prp_type FOREIGN KEY (content_purpose_type_id) REFERENCES content_purpose_type(content_purpose_type_id);


--
-- PostgreSQL database dump complete
--

