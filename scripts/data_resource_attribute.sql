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
-- Name: data_resource_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE data_resource_attribute (
    data_resource_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.data_resource_attribute OWNER TO ofbiz;

--
-- Name: data_resource_attribute pk_data_resource_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_attribute
    ADD CONSTRAINT pk_data_resource_attribute PRIMARY KEY (data_resource_id, attr_name);


--
-- Name: data_rec_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_attr ON data_resource_attribute USING btree (data_resource_id);


--
-- Name: dt_rsc_attrt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_attrt_txcrs ON data_resource_attribute USING btree (created_tx_stamp);


--
-- Name: dt_rsc_attrt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dt_rsc_attrt_txstp ON data_resource_attribute USING btree (last_updated_tx_stamp);


--
-- Name: data_resource_attribute data_rec_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY data_resource_attribute
    ADD CONSTRAINT data_rec_attr FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- PostgreSQL database dump complete
--

