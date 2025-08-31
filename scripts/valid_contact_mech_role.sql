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
-- Name: valid_contact_mech_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE valid_contact_mech_role (
    role_type_id character varying(20) NOT NULL,
    contact_mech_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.valid_contact_mech_role OWNER TO ofbiz;

--
-- Name: valid_contact_mech_role pk_valid_contact_mech_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_contact_mech_role
    ADD CONSTRAINT pk_valid_contact_mech_role PRIMARY KEY (role_type_id, contact_mech_type_id);


--
-- Name: val_cmrle_cmtype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX val_cmrle_cmtype ON valid_contact_mech_role USING btree (contact_mech_type_id);


--
-- Name: val_cmrle_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX val_cmrle_role ON valid_contact_mech_role USING btree (role_type_id);


--
-- Name: vld_cnt_mch_rl_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vld_cnt_mch_rl_txp ON valid_contact_mech_role USING btree (last_updated_tx_stamp);


--
-- Name: vld_cnt_mch_rl_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vld_cnt_mch_rl_txs ON valid_contact_mech_role USING btree (created_tx_stamp);


--
-- Name: valid_contact_mech_role val_cmrle_cmtype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_contact_mech_role
    ADD CONSTRAINT val_cmrle_cmtype FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- Name: valid_contact_mech_role val_cmrle_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY valid_contact_mech_role
    ADD CONSTRAINT val_cmrle_role FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

