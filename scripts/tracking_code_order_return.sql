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
-- Name: tracking_code_order_return; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tracking_code_order_return (
    return_id character varying(20) NOT NULL,
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20),
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


-- ALTER TABLE public.tracking_code_order_return OWNER TO ofbiz;

--
-- Name: tracking_code_order_return pk_tracking_code_order_return; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order_return
    ADD CONSTRAINT pk_tracking_code_order_return PRIMARY KEY (return_id, order_id, tracking_code_type_id);


--
-- Name: tkng_cododr_odrtn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_odrtn ON tracking_code_order_return USING btree (order_id);


--
-- Name: tkng_cododr_rtn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_rtn ON tracking_code_order_return USING btree (return_id);


--
-- Name: tkng_cododr_rtntcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_rtntcd ON tracking_code_order_return USING btree (tracking_code_id);


--
-- Name: tkng_cododr_rtntyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_cododr_rtntyp ON tracking_code_order_return USING btree (tracking_code_type_id);


--
-- Name: trg_cd_orr_rtn_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trg_cd_orr_rtn_txp ON tracking_code_order_return USING btree (last_updated_tx_stamp);


--
-- Name: trg_cd_orr_rtn_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trg_cd_orr_rtn_txs ON tracking_code_order_return USING btree (created_tx_stamp);


--
-- Name: tracking_code_order_return tkng_cododr_odrtn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order_return
    ADD CONSTRAINT tkng_cododr_odrtn FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: tracking_code_order_return tkng_cododr_rtn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order_return
    ADD CONSTRAINT tkng_cododr_rtn FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- Name: tracking_code_order_return tkng_cododr_rtntcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order_return
    ADD CONSTRAINT tkng_cododr_rtntcd FOREIGN KEY (tracking_code_id) REFERENCES tracking_code(tracking_code_id);


--
-- Name: tracking_code_order_return tkng_cododr_rtntyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_order_return
    ADD CONSTRAINT tkng_cododr_rtntyp FOREIGN KEY (tracking_code_type_id) REFERENCES tracking_code_type(tracking_code_type_id);


--
-- PostgreSQL database dump complete
--

