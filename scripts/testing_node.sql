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
-- Name: testing_node; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing_node (
    testing_node_id character varying(20) NOT NULL,
    primary_parent_node_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing_node OWNER TO ofbiz;

--
-- Name: testing_node pk_testing_node; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_node
    ADD CONSTRAINT pk_testing_node PRIMARY KEY (testing_node_id);


--
-- Name: testng_nde_parnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX testng_nde_parnt ON testing_node USING btree (primary_parent_node_id);


--
-- Name: tstng_nd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_nd_txcrts ON testing_node USING btree (created_tx_stamp);


--
-- Name: tstng_nd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_nd_txstmp ON testing_node USING btree (last_updated_tx_stamp);


--
-- Name: testing_node testng_nde_parnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_node
    ADD CONSTRAINT testng_nde_parnt FOREIGN KEY (primary_parent_node_id) REFERENCES testing_node(testing_node_id);


--
-- PostgreSQL database dump complete
--

