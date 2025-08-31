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
-- Name: return_item_response; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_item_response (
    return_item_response_id character varying(20) NOT NULL,
    order_payment_preference_id character varying(20),
    replacement_order_id character varying(20),
    payment_id character varying(20),
    billing_account_id character varying(20),
    fin_account_trans_id character varying(20),
    response_amount numeric(18,2),
    response_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_item_response OWNER TO ofbiz;

--
-- Name: return_item_response pk_return_item_response; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT pk_return_item_response PRIMARY KEY (return_item_response_id);


--
-- Name: rtn_itm_rsps_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_rsps_txcrs ON return_item_response USING btree (created_tx_stamp);


--
-- Name: rtn_itm_rsps_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_rsps_txstp ON return_item_response USING btree (last_updated_tx_stamp);


--
-- Name: rtn_pay_bact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_pay_bact ON return_item_response USING btree (billing_account_id);


--
-- Name: rtn_pay_finacttx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_pay_finacttx ON return_item_response USING btree (fin_account_trans_id);


--
-- Name: rtn_pay_ordpaypf; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_pay_ordpaypf ON return_item_response USING btree (order_payment_preference_id);


--
-- Name: rtn_pay_payment; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_pay_payment ON return_item_response USING btree (payment_id);


--
-- Name: rtn_resp_neword; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_resp_neword ON return_item_response USING btree (replacement_order_id);


--
-- Name: return_item_response rtn_pay_bact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT rtn_pay_bact FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: return_item_response rtn_pay_finacttx; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT rtn_pay_finacttx FOREIGN KEY (fin_account_trans_id) REFERENCES fin_account_trans(fin_account_trans_id);


--
-- Name: return_item_response rtn_pay_ordpaypf; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT rtn_pay_ordpaypf FOREIGN KEY (order_payment_preference_id) REFERENCES order_payment_preference(order_payment_preference_id);


--
-- Name: return_item_response rtn_pay_payment; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT rtn_pay_payment FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: return_item_response rtn_resp_neword; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_response
    ADD CONSTRAINT rtn_resp_neword FOREIGN KEY (replacement_order_id) REFERENCES order_header(order_id);


--
-- PostgreSQL database dump complete
--

