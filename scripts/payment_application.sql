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
-- Name: payment_application; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_application (
    payment_application_id character varying(20) NOT NULL,
    payment_id character varying(20),
    invoice_id character varying(20),
    invoice_item_seq_id character varying(20),
    billing_account_id character varying(20),
    override_gl_account_id character varying(20),
    to_payment_id character varying(20),
    tax_auth_geo_id character varying(20),
    amount_applied numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_application OWNER TO ofbiz;

--
-- Name: payment_application pk_payment_application; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT pk_payment_application PRIMARY KEY (payment_application_id);


--
-- Name: payment_app_bact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_bact ON payment_application USING btree (billing_account_id);


--
-- Name: payment_app_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_geo ON payment_application USING btree (tax_auth_geo_id);


--
-- Name: payment_app_inv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_inv ON payment_application USING btree (invoice_id);


--
-- Name: payment_app_orgla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_orgla ON payment_application USING btree (override_gl_account_id);


--
-- Name: payment_app_pmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_pmt ON payment_application USING btree (payment_id);


--
-- Name: payment_app_tpmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_app_tpmt ON payment_application USING btree (to_payment_id);


--
-- Name: pmnt_applcn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_applcn_txcrts ON payment_application USING btree (created_tx_stamp);


--
-- Name: pmnt_applcn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_applcn_txstmp ON payment_application USING btree (last_updated_tx_stamp);


--
-- Name: payment_application payment_app_bact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_bact FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: payment_application payment_app_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_geo FOREIGN KEY (tax_auth_geo_id) REFERENCES geo(geo_id);


--
-- Name: payment_application payment_app_inv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_inv FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: payment_application payment_app_orgla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_orgla FOREIGN KEY (override_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: payment_application payment_app_pmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_pmt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: payment_application payment_app_tpmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_application
    ADD CONSTRAINT payment_app_tpmt FOREIGN KEY (to_payment_id) REFERENCES payment(payment_id);


--
-- PostgreSQL database dump complete
--

