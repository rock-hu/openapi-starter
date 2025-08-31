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
-- Name: empl_position_fulfillment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position_fulfillment (
    empl_position_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position_fulfillment OWNER TO ofbiz;

--
-- Name: empl_position_fulfillment pk_empl_position_fulfillment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_fulfillment
    ADD CONSTRAINT pk_empl_position_fulfillment PRIMARY KEY (empl_position_id, party_id, from_date);


--
-- Name: eml_psn_flflt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_flflt_txcs ON empl_position_fulfillment USING btree (created_tx_stamp);


--
-- Name: eml_psn_flflt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_flflt_txsp ON empl_position_fulfillment USING btree (last_updated_tx_stamp);


--
-- Name: empl_psflmt_emps; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psflmt_emps ON empl_position_fulfillment USING btree (empl_position_id);


--
-- Name: empl_psflmt_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psflmt_prty ON empl_position_fulfillment USING btree (party_id);


--
-- Name: empl_position_fulfillment empl_psflmt_emps; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_fulfillment
    ADD CONSTRAINT empl_psflmt_emps FOREIGN KEY (empl_position_id) REFERENCES empl_position(empl_position_id);


--
-- Name: empl_position_fulfillment empl_psflmt_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_fulfillment
    ADD CONSTRAINT empl_psflmt_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

