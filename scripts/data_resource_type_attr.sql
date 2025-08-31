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
-- Name: data_resource_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource_type_attr (
    data_resource_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource_type_attr OWNER TO ofbiz;

--
-- Name: data_resource_type_attr pk_data_resource_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_type_attr
    ADD CONSTRAINT pk_data_resource_type_attr PRIMARY KEY (data_resource_type_id, attr_name);


--
-- Name: data_obtype_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_obtype_attr ON data_resource_type_attr USING btree (data_resource_type_id);


--
-- Name: dt_rsc_tp_atr_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_tp_atr_txcs ON data_resource_type_attr USING btree (created_tx_stamp);


--
-- Name: dt_rsc_tp_atr_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_tp_atr_txsp ON data_resource_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: data_resource_type_attr data_obtype_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_type_attr
    ADD CONSTRAINT data_obtype_attr FOREIGN KEY (data_resource_type_id) REFERENCES data_resource_type(data_resource_type_id);


--
-- PostgreSQL database dump complete
--

