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
-- Name: testing_node_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing_node_member (
    testing_node_id character varying(20) NOT NULL,
    testing_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    extend_from_date timestamp with time zone,
    extend_thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing_node_member OWNER TO ofbiz;

--
-- Name: testing_node_member pk_testing_node_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_node_member
    ADD CONSTRAINT pk_testing_node_member PRIMARY KEY (testing_node_id, testing_id, from_date);


--
-- Name: test_nmbr_node; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX test_nmbr_node ON testing_node_member USING btree (testing_node_id);


--
-- Name: testing_nmbr_test; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX testing_nmbr_test ON testing_node_member USING btree (testing_id);


--
-- Name: tstg_nd_mmr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstg_nd_mmr_txcrts ON testing_node_member USING btree (created_tx_stamp);


--
-- Name: tstg_nd_mmr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstg_nd_mmr_txstmp ON testing_node_member USING btree (last_updated_tx_stamp);


--
-- Name: testing_node_member test_nmbr_node; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_node_member
    ADD CONSTRAINT test_nmbr_node FOREIGN KEY (testing_node_id) REFERENCES testing_node(testing_node_id);


--
-- Name: testing_node_member testing_nmbr_test; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_node_member
    ADD CONSTRAINT testing_nmbr_test FOREIGN KEY (testing_id) REFERENCES testing(testing_id);


--
-- PostgreSQL database dump complete
--

