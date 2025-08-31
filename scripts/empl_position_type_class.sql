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
-- Name: empl_position_type_class; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position_type_class (
    empl_position_type_id character varying(20) NOT NULL,
    empl_position_class_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    standard_hours_per_week double precision,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position_type_class OWNER TO ofbiz;

--
-- Name: empl_position_type_class pk_empl_position_type_class; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_type_class
    ADD CONSTRAINT pk_empl_position_type_class PRIMARY KEY (empl_position_type_id, empl_position_class_type_id, from_date);


--
-- Name: eml_psn_tp_cls_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_tp_cls_txp ON empl_position_type_class USING btree (last_updated_tx_stamp);


--
-- Name: eml_psn_tp_cls_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_tp_cls_txs ON empl_position_type_class USING btree (created_tx_stamp);


--
-- Name: empl_pstpcs_epctp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pstpcs_epctp ON empl_position_type_class USING btree (empl_position_class_type_id);


--
-- Name: empl_pstpcs_eptp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_pstpcs_eptp ON empl_position_type_class USING btree (empl_position_type_id);


--
-- Name: empl_position_type_class empl_pstpcs_epctp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_type_class
    ADD CONSTRAINT empl_pstpcs_epctp FOREIGN KEY (empl_position_class_type_id) REFERENCES empl_position_class_type(empl_position_class_type_id);


--
-- Name: empl_position_type_class empl_pstpcs_eptp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_type_class
    ADD CONSTRAINT empl_pstpcs_eptp FOREIGN KEY (empl_position_type_id) REFERENCES empl_position_type(empl_position_type_id);


--
-- PostgreSQL database dump complete
--

