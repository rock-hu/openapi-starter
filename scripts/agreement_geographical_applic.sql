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
-- Name: agreement_geographical_applic; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_geographical_applic (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    geo_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_geographical_applic OWNER TO ofbiz;

--
-- Name: agreement_geographical_applic pk_agreement_geographical_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_geographical_applic
    ADD CONSTRAINT pk_agreement_geographical_appl PRIMARY KEY (agreement_id, agreement_item_seq_id, geo_id);


--
-- Name: agrmnt_geoap_agr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_geoap_agr ON agreement_geographical_applic USING btree (agreement_id);


--
-- Name: agrmnt_geoap_agri; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_geoap_agri ON agreement_geographical_applic USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_geoap_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_geoap_geo ON agreement_geographical_applic USING btree (geo_id);


--
-- Name: agrt_ggrl_apc_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_ggrl_apc_txcs ON agreement_geographical_applic USING btree (created_tx_stamp);


--
-- Name: agrt_ggrl_apc_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_ggrl_apc_txsp ON agreement_geographical_applic USING btree (last_updated_tx_stamp);


--
-- Name: agreement_geographical_applic agrmnt_geoap_agr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_geographical_applic
    ADD CONSTRAINT agrmnt_geoap_agr FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_geographical_applic agrmnt_geoap_agri; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_geographical_applic
    ADD CONSTRAINT agrmnt_geoap_agri FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: agreement_geographical_applic agrmnt_geoap_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_geographical_applic
    ADD CONSTRAINT agrmnt_geoap_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- PostgreSQL database dump complete
--

