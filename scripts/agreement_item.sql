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
-- Name: agreement_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_item (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    agreement_item_type_id character varying(20),
    currency_uom_id character varying(20),
    agreement_text text,
    agreement_image bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_item OWNER TO ofbiz;

--
-- Name: agreement_item pk_agreement_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item
    ADD CONSTRAINT pk_agreement_item PRIMARY KEY (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_item_agr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_item_agr ON agreement_item USING btree (agreement_id);


--
-- Name: agrmnt_item_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_item_type ON agreement_item USING btree (agreement_item_type_id);


--
-- Name: agrmnt_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_itm_txcrts ON agreement_item USING btree (created_tx_stamp);


--
-- Name: agrmnt_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_itm_txstmp ON agreement_item USING btree (last_updated_tx_stamp);


--
-- Name: agreement_item agrmnt_item_agr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item
    ADD CONSTRAINT agrmnt_item_agr FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_item agrmnt_item_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item
    ADD CONSTRAINT agrmnt_item_type FOREIGN KEY (agreement_item_type_id) REFERENCES agreement_item_type(agreement_item_type_id);


--
-- PostgreSQL database dump complete
--

