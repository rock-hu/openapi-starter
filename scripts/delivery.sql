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
-- Name: delivery; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE delivery (
    delivery_id character varying(20) NOT NULL,
    origin_facility_id character varying(20),
    dest_facility_id character varying(20),
    actual_start_date timestamp with time zone,
    actual_arrival_date timestamp with time zone,
    estimated_start_date timestamp with time zone,
    estimated_arrival_date timestamp with time zone,
    fixed_asset_id character varying(20),
    start_mileage numeric(18,6),
    end_mileage numeric(18,6),
    fuel_used numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.delivery OWNER TO ofbiz;

--
-- Name: delivery pk_delivery; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT pk_delivery PRIMARY KEY (delivery_id);


--
-- Name: deliv_dfac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliv_dfac ON delivery USING btree (dest_facility_id);


--
-- Name: deliv_fxas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliv_fxas ON delivery USING btree (fixed_asset_id);


--
-- Name: deliv_ofac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deliv_ofac ON delivery USING btree (origin_facility_id);


--
-- Name: delivery_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX delivery_txcrts ON delivery USING btree (created_tx_stamp);


--
-- Name: delivery_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX delivery_txstmp ON delivery USING btree (last_updated_tx_stamp);


--
-- Name: delivery deliv_dfac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT deliv_dfac FOREIGN KEY (dest_facility_id) REFERENCES facility(facility_id);


--
-- Name: delivery deliv_fxas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT deliv_fxas FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: delivery deliv_ofac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY delivery
    ADD CONSTRAINT deliv_ofac FOREIGN KEY (origin_facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

