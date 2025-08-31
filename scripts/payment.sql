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
-- Name: payment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment (
    payment_id character varying(20) NOT NULL,
    payment_type_id character varying(20),
    payment_method_type_id character varying(20),
    payment_method_id character varying(20),
    payment_gateway_response_id character varying(20),
    payment_preference_id character varying(20),
    party_id_from character varying(20),
    party_id_to character varying(20),
    role_type_id_to character varying(20),
    status_id character varying(20),
    effective_date timestamp with time zone,
    payment_ref_num character varying(60),
    amount numeric(18,2),
    currency_uom_id character varying(20),
    comments character varying(255),
    fin_account_trans_id character varying(20),
    override_gl_account_id character varying(20),
    actual_currency_amount numeric(18,2),
    actual_currency_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment OWNER TO ofbiz;

--
-- Name: payment pk_payment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT pk_payment PRIMARY KEY (payment_id);


--
-- Name: payment_acuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_acuom ON payment USING btree (actual_currency_uom_id);


--
-- Name: payment_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_cuom ON payment USING btree (currency_uom_id);


--
-- Name: payment_factx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_factx ON payment USING btree (fin_account_trans_id);


--
-- Name: payment_fpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_fpty ON payment USING btree (party_id_from);


--
-- Name: payment_ordpmprf; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_ordpmprf ON payment USING btree (payment_preference_id);


--
-- Name: payment_orgla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_orgla ON payment USING btree (override_gl_account_id);


--
-- Name: payment_paygatr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_paygatr ON payment USING btree (payment_gateway_response_id);


--
-- Name: payment_pmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_pmeth ON payment USING btree (payment_method_id);


--
-- Name: payment_pmeth_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_pmeth_tp ON payment USING btree (payment_method_type_id);


--
-- Name: payment_pmtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_pmtyp ON payment USING btree (payment_type_id);


--
-- Name: payment_sttsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_sttsitm ON payment USING btree (status_id);


--
-- Name: payment_tpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_tpty ON payment USING btree (party_id_to);


--
-- Name: payment_trtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_trtp ON payment USING btree (role_type_id_to);


--
-- Name: payment_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_txcrts ON payment USING btree (created_tx_stamp);


--
-- Name: payment_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_txstmp ON payment USING btree (last_updated_tx_stamp);


--
-- Name: payment payment_acuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_acuom FOREIGN KEY (actual_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: payment payment_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: payment payment_factx; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_factx FOREIGN KEY (fin_account_trans_id) REFERENCES fin_account_trans(fin_account_trans_id);


--
-- Name: payment payment_fpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_fpty FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: payment payment_ordpmprf; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_ordpmprf FOREIGN KEY (payment_preference_id) REFERENCES order_payment_preference(order_payment_preference_id);


--
-- Name: payment payment_orgla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_orgla FOREIGN KEY (override_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: payment payment_paygatr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_paygatr FOREIGN KEY (payment_gateway_response_id) REFERENCES payment_gateway_response(payment_gateway_response_id);


--
-- Name: payment payment_pmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- Name: payment payment_pmeth_tp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pmeth_tp FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: payment payment_pmtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pmtyp FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id);


--
-- Name: payment payment_sttsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_sttsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: payment payment_tpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_tpty FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- Name: payment payment_trtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_trtp FOREIGN KEY (role_type_id_to) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

