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
-- Name: testing_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing_status (
    testing_status_id character varying(20) NOT NULL,
    testing_id character varying(20),
    status_id character varying(20),
    status_date timestamp with time zone,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing_status OWNER TO ofbiz;

--
-- Name: testing_status pk_testing_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_status
    ADD CONSTRAINT pk_testing_status PRIMARY KEY (testing_status_id);


--
-- Name: test_sta_stsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX test_sta_stsitm ON testing_status USING btree (status_id);


--
-- Name: test_sta_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX test_sta_usrlgn ON testing_status USING btree (change_by_user_login_id);


--
-- Name: tstng_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_stts_txcrts ON testing_status USING btree (created_tx_stamp);


--
-- Name: tstng_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_stts_txstmp ON testing_status USING btree (last_updated_tx_stamp);


--
-- Name: testing_status test_sta_stsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_status
    ADD CONSTRAINT test_sta_stsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: testing_status test_sta_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_status
    ADD CONSTRAINT test_sta_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

