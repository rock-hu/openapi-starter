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
-- Name: facility_contact_mech_purpose; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_contact_mech_purpose (
    facility_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_contact_mech_purpose OWNER TO ofbiz;

--
-- Name: facility_contact_mech_purpose pk_facility_contact_mech_purpo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech_purpose
    ADD CONSTRAINT pk_facility_contact_mech_purpo PRIMARY KEY (facility_id, contact_mech_id, contact_mech_purpose_type_id, from_date);


--
-- Name: facil_cmprp_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facil_cmprp_cmech ON facility_contact_mech_purpose USING btree (contact_mech_id);


--
-- Name: facil_cmprp_facil; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facil_cmprp_facil ON facility_contact_mech_purpose USING btree (facility_id);


--
-- Name: facil_cmprp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facil_cmprp_type ON facility_contact_mech_purpose USING btree (contact_mech_purpose_type_id);


--
-- Name: fct_cnt_mch_prs_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_cnt_mch_prs_tp ON facility_contact_mech_purpose USING btree (last_updated_tx_stamp);


--
-- Name: fct_cnt_mch_prs_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_cnt_mch_prs_ts ON facility_contact_mech_purpose USING btree (created_tx_stamp);


--
-- Name: facility_contact_mech_purpose facil_cmprp_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech_purpose
    ADD CONSTRAINT facil_cmprp_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: facility_contact_mech_purpose facil_cmprp_facil; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech_purpose
    ADD CONSTRAINT facil_cmprp_facil FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_contact_mech_purpose facil_cmprp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech_purpose
    ADD CONSTRAINT facil_cmprp_type FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- PostgreSQL database dump complete
--

