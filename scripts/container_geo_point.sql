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
-- Name: container_geo_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE container_geo_point (
    container_id character varying(20) NOT NULL,
    geo_point_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.container_geo_point OWNER TO ofbiz;

--
-- Name: container_geo_point pk_container_geo_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container_geo_point
    ADD CONSTRAINT pk_container_geo_point PRIMARY KEY (container_id, geo_point_id, from_date);


--
-- Name: cntnr_g_pnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnr_g_pnt_txcrts ON container_geo_point USING btree (created_tx_stamp);


--
-- Name: cntnr_g_pnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnr_g_pnt_txstmp ON container_geo_point USING btree (last_updated_tx_stamp);


--
-- Name: contnrgeopt_contnr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contnrgeopt_contnr ON container_geo_point USING btree (container_id);


--
-- Name: contnrgeopt_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX contnrgeopt_geopt ON container_geo_point USING btree (geo_point_id);


--
-- Name: container_geo_point contnrgeopt_contnr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container_geo_point
    ADD CONSTRAINT contnrgeopt_contnr FOREIGN KEY (container_id) REFERENCES container(container_id);


--
-- Name: container_geo_point contnrgeopt_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY container_geo_point
    ADD CONSTRAINT contnrgeopt_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- PostgreSQL database dump complete
--

