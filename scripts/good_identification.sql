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
-- Name: good_identification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE good_identification (
    good_identification_type_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    id_value character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.good_identification OWNER TO ofbiz;

--
-- Name: good_identification pk_good_identification; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY good_identification
    ADD CONSTRAINT pk_good_identification PRIMARY KEY (good_identification_type_id, product_id);


--
-- Name: gd_idntfctn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gd_idntfctn_txcrts ON good_identification USING btree (created_tx_stamp);


--
-- Name: gd_idntfctn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gd_idntfctn_txstmp ON good_identification USING btree (last_updated_tx_stamp);


--
-- Name: good_id_prodict; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX good_id_prodict ON good_identification USING btree (product_id);


--
-- Name: good_id_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX good_id_type ON good_identification USING btree (good_identification_type_id);


--
-- Name: good_id_validx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX good_id_validx ON good_identification USING btree (id_value);


--
-- Name: good_identification good_id_prodict; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY good_identification
    ADD CONSTRAINT good_id_prodict FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: good_identification good_id_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY good_identification
    ADD CONSTRAINT good_id_type FOREIGN KEY (good_identification_type_id) REFERENCES good_identification_type(good_identification_type_id);


--
-- PostgreSQL database dump complete
--

