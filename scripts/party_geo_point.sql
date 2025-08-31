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
-- Name: party_geo_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_geo_point (
    party_id character varying(20) NOT NULL,
    geo_point_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_geo_point OWNER TO ofbiz;

--
-- Name: party_geo_point pk_party_geo_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_geo_point
    ADD CONSTRAINT pk_party_geo_point PRIMARY KEY (party_id, geo_point_id, from_date);


--
-- Name: partygeopt_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX partygeopt_geopt ON party_geo_point USING btree (geo_point_id);


--
-- Name: partygeopt_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX partygeopt_party ON party_geo_point USING btree (party_id);


--
-- Name: prt_g_pnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_g_pnt_txcrts ON party_geo_point USING btree (created_tx_stamp);


--
-- Name: prt_g_pnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_g_pnt_txstmp ON party_geo_point USING btree (last_updated_tx_stamp);


--
-- Name: party_geo_point partygeopt_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_geo_point
    ADD CONSTRAINT partygeopt_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- Name: party_geo_point partygeopt_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_geo_point
    ADD CONSTRAINT partygeopt_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

