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
-- Name: product_geo; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_geo (
    product_id character varying(20) NOT NULL,
    geo_id character varying(20) NOT NULL,
    product_geo_enum_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_geo OWNER TO ofbiz;

--
-- Name: product_geo pk_product_geo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_geo
    ADD CONSTRAINT pk_product_geo PRIMARY KEY (product_id, geo_id);


--
-- Name: prdgeo_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdgeo_enum ON product_geo USING btree (product_geo_enum_id);


--
-- Name: prdgeo_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdgeo_geo ON product_geo USING btree (geo_id);


--
-- Name: prdgeo_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdgeo_product ON product_geo USING btree (product_id);


--
-- Name: product_geo_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_geo_txcrts ON product_geo USING btree (created_tx_stamp);


--
-- Name: product_geo_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_geo_txstmp ON product_geo USING btree (last_updated_tx_stamp);


--
-- Name: product_geo prdgeo_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_geo
    ADD CONSTRAINT prdgeo_enum FOREIGN KEY (product_geo_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_geo prdgeo_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_geo
    ADD CONSTRAINT prdgeo_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: product_geo prdgeo_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_geo
    ADD CONSTRAINT prdgeo_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

