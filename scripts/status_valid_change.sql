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
-- Name: status_valid_change; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE status_valid_change (
    status_id character varying(20) NOT NULL,
    status_id_to character varying(20) NOT NULL,
    condition_expression character varying(255),
    transition_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.status_valid_change OWNER TO ofbiz;

--
-- Name: status_valid_change pk_status_valid_change; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY status_valid_change
    ADD CONSTRAINT pk_status_valid_change PRIMARY KEY (status_id, status_id_to);


--
-- Name: status_chg_main; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX status_chg_main ON status_valid_change USING btree (status_id);


--
-- Name: status_chg_to; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX status_chg_to ON status_valid_change USING btree (status_id_to);


--
-- Name: sts_vld_chg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sts_vld_chg_txcrts ON status_valid_change USING btree (created_tx_stamp);


--
-- Name: sts_vld_chg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sts_vld_chg_txstmp ON status_valid_change USING btree (last_updated_tx_stamp);


--
-- Name: status_valid_change status_chg_main; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY status_valid_change
    ADD CONSTRAINT status_chg_main FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: status_valid_change status_chg_to; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY status_valid_change
    ADD CONSTRAINT status_chg_to FOREIGN KEY (status_id_to) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

