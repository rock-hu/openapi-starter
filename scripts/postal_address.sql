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
-- Name: postal_address; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE postal_address (
    contact_mech_id character varying(20) NOT NULL,
    to_name character varying(100),
    attn_name character varying(100),
    address1 character varying(255),
    address2 character varying(255),
    house_number numeric(20,0),
    house_number_ext character varying(60),
    directions character varying(255),
    city character varying(100),
    city_geo_id character varying(20),
    postal_code character varying(60),
    postal_code_ext character varying(60),
    country_geo_id character varying(20),
    state_province_geo_id character varying(20),
    county_geo_id character varying(20),
    municipality_geo_id character varying(20),
    postal_code_geo_id character varying(20),
    geo_point_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.postal_address OWNER TO ofbiz;

--
-- Name: postal_address pk_postal_address; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT pk_postal_address PRIMARY KEY (contact_mech_id);


--
-- Name: address1_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX address1_idx ON postal_address USING btree (address1);


--
-- Name: address2_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX address2_idx ON postal_address USING btree (address2);


--
-- Name: city_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX city_idx ON postal_address USING btree (city);


--
-- Name: post_addr_cgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_cgeo ON postal_address USING btree (country_geo_id);


--
-- Name: post_addr_city; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_city ON postal_address USING btree (city_geo_id);


--
-- Name: post_addr_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_cmech ON postal_address USING btree (contact_mech_id);


--
-- Name: post_addr_cntg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_cntg ON postal_address USING btree (county_geo_id);


--
-- Name: post_addr_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_geopt ON postal_address USING btree (geo_point_id);


--
-- Name: post_addr_mncp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_mncp ON postal_address USING btree (municipality_geo_id);


--
-- Name: post_addr_pcgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_pcgeo ON postal_address USING btree (postal_code_geo_id);


--
-- Name: post_addr_spgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_spgeo ON postal_address USING btree (state_province_geo_id);


--
-- Name: postal_code_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX postal_code_idx ON postal_address USING btree (postal_code);


--
-- Name: pstl_addrss_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pstl_addrss_txcrts ON postal_address USING btree (created_tx_stamp);


--
-- Name: pstl_addrss_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pstl_addrss_txstmp ON postal_address USING btree (last_updated_tx_stamp);


--
-- Name: postal_address post_addr_cgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_cgeo FOREIGN KEY (country_geo_id) REFERENCES geo(geo_id);


--
-- Name: postal_address post_addr_city; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_city FOREIGN KEY (city_geo_id) REFERENCES geo(geo_id);


--
-- Name: postal_address post_addr_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: postal_address post_addr_cntg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_cntg FOREIGN KEY (county_geo_id) REFERENCES geo(geo_id);


--
-- Name: postal_address post_addr_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- Name: postal_address post_addr_mncp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_mncp FOREIGN KEY (municipality_geo_id) REFERENCES geo(geo_id);


--
-- Name: postal_address post_addr_pcgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_pcgeo FOREIGN KEY (postal_code_geo_id) REFERENCES geo(geo_id);


--
-- Name: postal_address post_addr_spgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address
    ADD CONSTRAINT post_addr_spgeo FOREIGN KEY (state_province_geo_id) REFERENCES geo(geo_id);


--
-- PostgreSQL database dump complete
--

