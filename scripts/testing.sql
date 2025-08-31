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
-- Name: testing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing (
    testing_id character varying(20) NOT NULL,
    testing_type_id character varying(20),
    testing_name character varying(100),
    description character varying(255),
    comments character varying(255),
    testing_size numeric(20,0),
    testing_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing OWNER TO ofbiz;

--
-- Name: testing pk_testing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing
    ADD CONSTRAINT pk_testing PRIMARY KEY (testing_id);


--
-- Name: entity_enty_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX entity_enty_typ ON testing USING btree (testing_type_id);


--
-- Name: testing_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX testing_txcrts ON testing USING btree (created_tx_stamp);


--
-- Name: testing_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX testing_txstmp ON testing USING btree (last_updated_tx_stamp);


--
-- Name: testing entity_enty_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing
    ADD CONSTRAINT entity_enty_typ FOREIGN KEY (testing_type_id) REFERENCES testing_type(testing_type_id);


--
-- PostgreSQL database dump complete
--

