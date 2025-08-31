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
-- Name: facility_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_content (
    facility_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_content OWNER TO ofbiz;

--
-- Name: facility_content pk_facility_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_content
    ADD CONSTRAINT pk_facility_content PRIMARY KEY (facility_id, content_id, from_date);


--
-- Name: fac_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fac_cnt_cnt ON facility_content USING btree (content_id);


--
-- Name: fac_cnt_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fac_cnt_fac ON facility_content USING btree (facility_id);


--
-- Name: fclt_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_cntnt_txcrts ON facility_content USING btree (created_tx_stamp);


--
-- Name: fclt_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_cntnt_txstmp ON facility_content USING btree (last_updated_tx_stamp);


--
-- Name: facility_content fac_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_content
    ADD CONSTRAINT fac_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: facility_content fac_cnt_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_content
    ADD CONSTRAINT fac_cnt_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

