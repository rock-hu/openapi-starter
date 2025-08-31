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
-- Name: addendum; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE addendum (
    addendum_id character varying(20) NOT NULL,
    agreement_id character varying(20),
    agreement_item_seq_id character varying(20),
    addendum_creation_date timestamp with time zone,
    addendum_effective_date timestamp with time zone,
    addendum_text character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.addendum OWNER TO ofbiz;

--
-- Name: addendum pk_addendum; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY addendum
    ADD CONSTRAINT pk_addendum PRIMARY KEY (addendum_id);


--
-- Name: addendum_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addendum_txcrts ON addendum USING btree (created_tx_stamp);


--
-- Name: addendum_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addendum_txstmp ON addendum USING btree (last_updated_tx_stamp);


--
-- Name: addndm_agrmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addndm_agrmnt ON addendum USING btree (agreement_id);


--
-- Name: addndm_agrmnt_itm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addndm_agrmnt_itm ON addendum USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: addendum addndm_agrmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY addendum
    ADD CONSTRAINT addndm_agrmnt FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: addendum addndm_agrmnt_itm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY addendum
    ADD CONSTRAINT addndm_agrmnt_itm FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- PostgreSQL database dump complete
--

