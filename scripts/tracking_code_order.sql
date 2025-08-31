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
-- Name: tracking_code_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tracking_code_order (
    order_id character varying(20) NOT NULL,
    tracking_code_type_id character varying(20) NOT NULL,
    tracking_code_id character varying(20),
    is_billable character(1),
    site_id character varying(255),
    has_exported character(1),
    affiliate_referred_time_stamp timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tracking_code_order OWNER TO ofbiz;

--
-- Name: tracking_code_order pk_tracking_code_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order
    ADD CONSTRAINT pk_tracking_code_order PRIMARY KEY (order_id, tracking_code_type_id);


--
-- Name: tkng_cododr_odr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_odr ON tracking_code_order USING btree (order_id);


--
-- Name: tkng_cododr_tkcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_tkcd ON tracking_code_order USING btree (tracking_code_id);


--
-- Name: tkng_cododr_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_typ ON tracking_code_order USING btree (tracking_code_type_id);


--
-- Name: trckg_cd_orr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckg_cd_orr_txcrs ON tracking_code_order USING btree (created_tx_stamp);


--
-- Name: trckg_cd_orr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckg_cd_orr_txstp ON tracking_code_order USING btree (last_updated_tx_stamp);


--
-- Name: tracking_code_order tkng_cododr_odr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order
    ADD CONSTRAINT tkng_cododr_odr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: tracking_code_order tkng_cododr_tkcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order
    ADD CONSTRAINT tkng_cododr_tkcd FOREIGN KEY (tracking_code_id) REFERENCES tracking_code(tracking_code_id);


--
-- Name: tracking_code_order tkng_cododr_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order
    ADD CONSTRAINT tkng_cododr_typ FOREIGN KEY (tracking_code_type_id) REFERENCES tracking_code_type(tracking_code_type_id);


--
-- PostgreSQL database dump complete
--

