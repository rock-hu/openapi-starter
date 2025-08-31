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
-- Name: accommodation_spot; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE accommodation_spot (
    accommodation_spot_id character varying(20) NOT NULL,
    accommodation_class_id character varying(20),
    fixed_asset_id character varying(20),
    number_of_spaces numeric(20,0),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.accommodation_spot OWNER TO ofbiz;

--
-- Name: accommodation_spot pk_accommodation_spot; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_spot
    ADD CONSTRAINT pk_accommodation_spot PRIMARY KEY (accommodation_spot_id);


--
-- Name: accmmdn_spt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdn_spt_txcrts ON accommodation_spot USING btree (created_tx_stamp);


--
-- Name: accmmdn_spt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdn_spt_txstmp ON accommodation_spot USING btree (last_updated_tx_stamp);


--
-- Name: accom_class; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accom_class ON accommodation_spot USING btree (accommodation_class_id);


--
-- Name: spot_fa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX spot_fa ON accommodation_spot USING btree (fixed_asset_id);


--
-- Name: accommodation_spot accom_class; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_spot
    ADD CONSTRAINT accom_class FOREIGN KEY (accommodation_class_id) REFERENCES accommodation_class(accommodation_class_id);


--
-- Name: accommodation_spot spot_fa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_spot
    ADD CONSTRAINT spot_fa FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- PostgreSQL database dump complete
--

