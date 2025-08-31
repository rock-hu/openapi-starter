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
-- Name: facility_party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_party (
    facility_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_party OWNER TO ofbiz;

--
-- Name: facility_party pk_facility_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_party
    ADD CONSTRAINT pk_facility_party PRIMARY KEY (facility_id, party_id, role_type_id, from_date);


--
-- Name: facility_prty_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_prty_role ON facility_party USING btree (party_id, role_type_id);


--
-- Name: facility_rle_faci; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_rle_faci ON facility_party USING btree (facility_id);


--
-- Name: facility_rle_prt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_rle_prt ON facility_party USING btree (party_id);


--
-- Name: facility_rle_rol; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_rle_rol ON facility_party USING btree (role_type_id);


--
-- Name: fclt_prt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_prt_txcrts ON facility_party USING btree (created_tx_stamp);


--
-- Name: fclt_prt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_prt_txstmp ON facility_party USING btree (last_updated_tx_stamp);


--
-- Name: facility_party facility_prty_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_party
    ADD CONSTRAINT facility_prty_role FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: facility_party facility_rle_faci; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_party
    ADD CONSTRAINT facility_rle_faci FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_party facility_rle_prt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_party
    ADD CONSTRAINT facility_rle_prt FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: facility_party facility_rle_rol; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_party
    ADD CONSTRAINT facility_rle_rol FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

