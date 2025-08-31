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
-- Name: payment_gateway_response; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_response (
    payment_gateway_response_id character varying(20) NOT NULL,
    payment_service_type_enum_id character varying(20),
    order_payment_preference_id character varying(20),
    payment_method_type_id character varying(20),
    payment_method_id character varying(20),
    trans_code_enum_id character varying(20),
    amount numeric(18,2),
    currency_uom_id character varying(20),
    reference_num character varying(60),
    alt_reference character varying(60),
    sub_reference character varying(60),
    gateway_code character varying(60),
    gateway_flag character varying(60),
    gateway_avs_result character varying(60),
    gateway_cv_result character varying(60),
    gateway_score_result character varying(60),
    gateway_message character varying(255),
    transaction_date timestamp with time zone,
    result_declined character(1),
    result_nsf character(1),
    result_bad_expire character(1),
    result_bad_card_number character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_response OWNER TO ofbiz;

--
-- Name: payment_gateway_response pk_payment_gateway_response; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT pk_payment_gateway_response PRIMARY KEY (payment_gateway_response_id);


--
-- Name: paygatr_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_cuom ON payment_gateway_response USING btree (currency_uom_id);


--
-- Name: paygatr_ordpmprf; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_ordpmprf ON payment_gateway_response USING btree (order_payment_preference_id);


--
-- Name: paygatr_pmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_pmeth ON payment_gateway_response USING btree (payment_method_id);


--
-- Name: paygatr_pmtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_pmtp ON payment_gateway_response USING btree (payment_method_type_id);


--
-- Name: paygatr_pstenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_pstenum ON payment_gateway_response USING btree (payment_service_type_enum_id);


--
-- Name: paygatr_txcode; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paygatr_txcode ON payment_gateway_response USING btree (trans_code_enum_id);


--
-- Name: pmt_gtw_rsps_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_rsps_txcrs ON payment_gateway_response USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_rsps_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_rsps_txstp ON payment_gateway_response USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_response paygatr_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: payment_gateway_response paygatr_ordpmprf; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_ordpmprf FOREIGN KEY (order_payment_preference_id) REFERENCES order_payment_preference(order_payment_preference_id);


--
-- Name: payment_gateway_response paygatr_pmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_pmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- Name: payment_gateway_response paygatr_pmtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_pmtp FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: payment_gateway_response paygatr_pstenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_pstenum FOREIGN KEY (payment_service_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: payment_gateway_response paygatr_txcode; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_response
    ADD CONSTRAINT paygatr_txcode FOREIGN KEY (trans_code_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

