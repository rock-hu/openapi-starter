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
-- Name: testing_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing_item (
    testing_id character varying(20) NOT NULL,
    testing_seq_id character varying(20) NOT NULL,
    testing_history text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing_item OWNER TO ofbiz;

--
-- Name: testing_item pk_testing_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_item
    ADD CONSTRAINT pk_testing_item PRIMARY KEY (testing_id, testing_seq_id);


--
-- Name: testing_it_test; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX testing_it_test ON testing_item USING btree (testing_id);


--
-- Name: tstng_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_itm_txcrts ON testing_item USING btree (created_tx_stamp);


--
-- Name: tstng_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_itm_txstmp ON testing_item USING btree (last_updated_tx_stamp);


--
-- Name: testing_item testing_it_test; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_item
    ADD CONSTRAINT testing_it_test FOREIGN KEY (testing_id) REFERENCES testing(testing_id);


--
-- PostgreSQL database dump complete
--

