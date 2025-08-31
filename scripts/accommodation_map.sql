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
-- Name: accommodation_map; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE accommodation_map (
    accommodation_map_id character varying(20) NOT NULL,
    accommodation_class_id character varying(20),
    fixed_asset_id character varying(20),
    accommodation_map_type_id character varying(20),
    number_of_spaces numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.accommodation_map OWNER TO ofbiz;

--
-- Name: accommodation_map pk_accommodation_map; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_map
    ADD CONSTRAINT pk_accommodation_map PRIMARY KEY (accommodation_map_id);


--
-- Name: accmmdtn_mp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdtn_mp_txcrts ON accommodation_map USING btree (created_tx_stamp);


--
-- Name: accmmdtn_mp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accmmdtn_mp_txstmp ON accommodation_map USING btree (last_updated_tx_stamp);


--
-- Name: acmd_map_class; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acmd_map_class ON accommodation_map USING btree (accommodation_class_id);


--
-- Name: acmd_map_fa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acmd_map_fa ON accommodation_map USING btree (fixed_asset_id);


--
-- Name: acmd_map_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acmd_map_type ON accommodation_map USING btree (accommodation_map_type_id);


--
-- Name: accommodation_map acmd_map_class; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_map
    ADD CONSTRAINT acmd_map_class FOREIGN KEY (accommodation_class_id) REFERENCES accommodation_class(accommodation_class_id);


--
-- Name: accommodation_map acmd_map_fa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_map
    ADD CONSTRAINT acmd_map_fa FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: accommodation_map acmd_map_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY accommodation_map
    ADD CONSTRAINT acmd_map_type FOREIGN KEY (accommodation_map_type_id) REFERENCES accommodation_map_type(accommodation_map_type_id);


--
-- PostgreSQL database dump complete
--

