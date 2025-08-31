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
-- Name: payment_gateway_resp_msg; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_resp_msg (
    payment_gateway_resp_msg_id character varying(20) NOT NULL,
    payment_gateway_response_id character varying(20),
    pgr_message text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_resp_msg OWNER TO ofbiz;

--
-- Name: payment_gateway_resp_msg pk_payment_gateway_resp_msg; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_resp_msg
    ADD CONSTRAINT pk_payment_gateway_resp_msg PRIMARY KEY (payment_gateway_resp_msg_id);


--
-- Name: paygatrm_paygr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatrm_paygr ON payment_gateway_resp_msg USING btree (payment_gateway_response_id);


--
-- Name: pmt_gtw_rsp_msg_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_rsp_msg_tp ON payment_gateway_resp_msg USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_rsp_msg_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_rsp_msg_ts ON payment_gateway_resp_msg USING btree (created_tx_stamp);


--
-- Name: payment_gateway_resp_msg paygatrm_paygr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_resp_msg
    ADD CONSTRAINT paygatrm_paygr FOREIGN KEY (payment_gateway_response_id) REFERENCES payment_gateway_response(payment_gateway_response_id);


--
-- PostgreSQL database dump complete
--

