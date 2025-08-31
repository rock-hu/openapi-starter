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
-- Name: order_payment_preference; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_payment_preference (
    order_payment_preference_id character varying(20) NOT NULL,
    order_id character varying(20),
    order_item_seq_id character varying(20),
    ship_group_seq_id character varying(20),
    product_price_purpose_id character varying(20),
    payment_method_type_id character varying(20),
    payment_method_id character varying(20),
    fin_account_id character varying(20),
    security_code character varying(255),
    track2 character varying(255),
    present_flag character(1),
    swiped_flag character(1),
    overflow_flag character(1),
    max_amount numeric(18,2),
    process_attempt numeric(20,0),
    billing_postal_code character varying(60),
    manual_auth_code character varying(60),
    manual_ref_num character varying(60),
    status_id character varying(20),
    needs_nsf_retry character(1),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_payment_preference OWNER TO ofbiz;

--
-- Name: order_payment_preference pk_order_payment_preference; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT pk_order_payment_preference PRIMARY KEY (order_payment_preference_id);


--
-- Name: nsf_retry_check; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX nsf_retry_check ON order_payment_preference USING btree (needs_nsf_retry);


--
-- Name: order_pmprf_finact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_finact ON order_payment_preference USING btree (fin_account_id);


--
-- Name: order_pmprf_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_ohdr ON order_payment_preference USING btree (order_id);


--
-- Name: order_pmprf_pmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_pmeth ON order_payment_preference USING btree (payment_method_id);


--
-- Name: order_pmprf_pmtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_pmtp ON order_payment_preference USING btree (payment_method_type_id);


--
-- Name: order_pmprf_pprp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_pprp ON order_payment_preference USING btree (product_price_purpose_id);


--
-- Name: order_pmprf_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_stts ON order_payment_preference USING btree (status_id);


--
-- Name: order_pmprf_usrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_pmprf_usrl ON order_payment_preference USING btree (created_by_user_login);


--
-- Name: orr_pmt_prfc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_pmt_prfc_txcrs ON order_payment_preference USING btree (created_tx_stamp);


--
-- Name: orr_pmt_prfc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_pmt_prfc_txstp ON order_payment_preference USING btree (last_updated_tx_stamp);


--
-- Name: order_payment_preference order_pmprf_finact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_finact FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: order_payment_preference order_pmprf_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_payment_preference order_pmprf_pmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_pmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- Name: order_payment_preference order_pmprf_pmtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_pmtp FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: order_payment_preference order_pmprf_pprp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_pprp FOREIGN KEY (product_price_purpose_id) REFERENCES product_price_purpose(product_price_purpose_id);


--
-- Name: order_payment_preference order_pmprf_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: order_payment_preference order_pmprf_usrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_payment_preference
    ADD CONSTRAINT order_pmprf_usrl FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

