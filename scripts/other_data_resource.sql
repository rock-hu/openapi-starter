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
-- Name: other_data_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE other_data_resource (
    data_resource_id character varying(20) NOT NULL,
    data_resource_content bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.other_data_resource OWNER TO ofbiz;

--
-- Name: other_data_resource pk_other_data_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY other_data_resource
    ADD CONSTRAINT pk_other_data_resource PRIMARY KEY (data_resource_id);


--
-- Name: data_rec_other; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_other ON other_data_resource USING btree (data_resource_id);


--
-- Name: othr_dt_rsc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX othr_dt_rsc_txcrts ON other_data_resource USING btree (created_tx_stamp);


--
-- Name: othr_dt_rsc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX othr_dt_rsc_txstmp ON other_data_resource USING btree (last_updated_tx_stamp);


--
-- Name: other_data_resource data_rec_other; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY other_data_resource
    ADD CONSTRAINT data_rec_other FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- PostgreSQL database dump complete
--

