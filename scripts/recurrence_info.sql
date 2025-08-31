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
-- Name: recurrence_info; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE recurrence_info (
    recurrence_info_id character varying(20) NOT NULL,
    start_date_time timestamp with time zone,
    exception_date_times text,
    recurrence_date_times text,
    exception_rule_id character varying(20),
    recurrence_rule_id character varying(20),
    recurrence_count numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.recurrence_info OWNER TO ofbiz;

--
-- Name: recurrence_info pk_recurrence_info; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY recurrence_info
    ADD CONSTRAINT pk_recurrence_info PRIMARY KEY (recurrence_info_id);


--
-- Name: rcrrnc_inf_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rcrrnc_inf_txcrts ON recurrence_info USING btree (created_tx_stamp);


--
-- Name: rcrrnc_inf_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rcrrnc_inf_txstmp ON recurrence_info USING btree (last_updated_tx_stamp);


--
-- Name: rec_info_ex_rcrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rec_info_ex_rcrle ON recurrence_info USING btree (exception_rule_id);


--
-- Name: rec_info_rcrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rec_info_rcrle ON recurrence_info USING btree (recurrence_rule_id);


--
-- Name: recurrence_info rec_info_ex_rcrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY recurrence_info
    ADD CONSTRAINT rec_info_ex_rcrle FOREIGN KEY (exception_rule_id) REFERENCES recurrence_rule(recurrence_rule_id);


--
-- Name: recurrence_info rec_info_rcrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY recurrence_info
    ADD CONSTRAINT rec_info_rcrle FOREIGN KEY (recurrence_rule_id) REFERENCES recurrence_rule(recurrence_rule_id);


--
-- PostgreSQL database dump complete
--

