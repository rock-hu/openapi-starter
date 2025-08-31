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
-- Name: communication_event_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_product (
    product_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_product OWNER TO ofbiz;

--
-- Name: communication_event_product pk_communication_event_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_product
    ADD CONSTRAINT pk_communication_event_product PRIMARY KEY (product_id, communication_event_id);


--
-- Name: cmmnn_evt_prt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_prt_txcs ON communication_event_product USING btree (created_tx_stamp);


--
-- Name: cmmnn_evt_prt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_prt_txsp ON communication_event_product USING btree (last_updated_tx_stamp);


--
-- Name: comev_prod_cmev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_prod_cmev ON communication_event_product USING btree (communication_event_id);


--
-- Name: comev_prod_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_prod_prod ON communication_event_product USING btree (product_id);


--
-- Name: communication_event_product comev_prod_cmev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_product
    ADD CONSTRAINT comev_prod_cmev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: communication_event_product comev_prod_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_product
    ADD CONSTRAINT comev_prod_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

