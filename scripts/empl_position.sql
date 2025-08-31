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
-- Name: empl_position; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position (
    empl_position_id character varying(20) NOT NULL,
    status_id character varying(20),
    party_id character varying(20),
    budget_id character varying(20),
    budget_item_seq_id character varying(20),
    empl_position_type_id character varying(20),
    estimated_from_date timestamp with time zone,
    estimated_thru_date timestamp with time zone,
    salary_flag character(1),
    exempt_flag character(1),
    fulltime_flag character(1),
    temporary_flag character(1),
    actual_from_date timestamp with time zone,
    actual_thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position OWNER TO ofbiz;

--
-- Name: empl_position pk_empl_position; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position
    ADD CONSTRAINT pk_empl_position PRIMARY KEY (empl_position_id);


--
-- Name: empl_pos_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pos_prty ON empl_position USING btree (party_id);


--
-- Name: empl_pos_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pos_stts ON empl_position USING btree (status_id);


--
-- Name: empl_pstn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pstn_txcrts ON empl_position USING btree (created_tx_stamp);


--
-- Name: empl_pstn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pstn_txstmp ON empl_position USING btree (last_updated_tx_stamp);


--
-- Name: empl_position empl_pos_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position
    ADD CONSTRAINT empl_pos_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: empl_position empl_pos_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position
    ADD CONSTRAINT empl_pos_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

