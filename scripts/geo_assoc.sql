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
-- Name: geo_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE geo_assoc (
    geo_id character varying(20) NOT NULL,
    geo_id_to character varying(20) NOT NULL,
    geo_assoc_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.geo_assoc OWNER TO ofbiz;

--
-- Name: geo_assoc pk_geo_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_assoc
    ADD CONSTRAINT pk_geo_assoc PRIMARY KEY (geo_id, geo_id_to);


--
-- Name: geo_assc_to_assc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_assc_to_assc ON geo_assoc USING btree (geo_id_to);


--
-- Name: geo_assc_to_main; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_assc_to_main ON geo_assoc USING btree (geo_id);


--
-- Name: geo_assc_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_assc_to_type ON geo_assoc USING btree (geo_assoc_type_id);


--
-- Name: geo_assoc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_assoc_txcrts ON geo_assoc USING btree (created_tx_stamp);


--
-- Name: geo_assoc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_assoc_txstmp ON geo_assoc USING btree (last_updated_tx_stamp);


--
-- Name: geo_assoc geo_assc_to_assc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_assoc
    ADD CONSTRAINT geo_assc_to_assc FOREIGN KEY (geo_id_to) REFERENCES geo(geo_id);


--
-- Name: geo_assoc geo_assc_to_main; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_assoc
    ADD CONSTRAINT geo_assc_to_main FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: geo_assoc geo_assc_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_assoc
    ADD CONSTRAINT geo_assc_to_type FOREIGN KEY (geo_assoc_type_id) REFERENCES geo_assoc_type(geo_assoc_type_id);


--
-- PostgreSQL database dump complete
--

