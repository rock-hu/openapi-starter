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
-- Name: postal_address_boundary; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE postal_address_boundary (
    contact_mech_id character varying(20) NOT NULL,
    geo_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.postal_address_boundary OWNER TO ofbiz;

--
-- Name: postal_address_boundary pk_postal_address_boundary; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address_boundary
    ADD CONSTRAINT pk_postal_address_boundary PRIMARY KEY (contact_mech_id, geo_id);


--
-- Name: post_addr_bndry; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_bndry ON postal_address_boundary USING btree (contact_mech_id);


--
-- Name: post_addr_bndrygeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX post_addr_bndrygeo ON postal_address_boundary USING btree (geo_id);


--
-- Name: psl_adds_bnr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psl_adds_bnr_txcrs ON postal_address_boundary USING btree (created_tx_stamp);


--
-- Name: psl_adds_bnr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX psl_adds_bnr_txstp ON postal_address_boundary USING btree (last_updated_tx_stamp);


--
-- Name: postal_address_boundary post_addr_bndry; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address_boundary
    ADD CONSTRAINT post_addr_bndry FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: postal_address_boundary post_addr_bndrygeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY postal_address_boundary
    ADD CONSTRAINT post_addr_bndrygeo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- PostgreSQL database dump complete
--

