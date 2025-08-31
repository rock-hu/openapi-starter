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
-- Name: payment_method; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_method (
    payment_method_id character varying(20) NOT NULL,
    payment_method_type_id character varying(20),
    party_id character varying(20),
    gl_account_id character varying(20),
    fin_account_id character varying(20),
    description character varying(255),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_method OWNER TO ofbiz;

--
-- Name: payment_method pk_payment_method; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method
    ADD CONSTRAINT pk_payment_method PRIMARY KEY (payment_method_id);


--
-- Name: paymeth_finacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymeth_finacct ON payment_method USING btree (fin_account_id);


--
-- Name: paymeth_glacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymeth_glacct ON payment_method USING btree (gl_account_id);


--
-- Name: paymeth_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymeth_party ON payment_method USING btree (party_id);


--
-- Name: paymeth_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymeth_type ON payment_method USING btree (payment_method_type_id);


--
-- Name: pmnt_mthd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_mthd_txcrts ON payment_method USING btree (created_tx_stamp);


--
-- Name: pmnt_mthd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_mthd_txstmp ON payment_method USING btree (last_updated_tx_stamp);


--
-- Name: payment_method paymeth_finacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method
    ADD CONSTRAINT paymeth_finacct FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: payment_method paymeth_glacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method
    ADD CONSTRAINT paymeth_glacct FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: payment_method paymeth_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method
    ADD CONSTRAINT paymeth_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: payment_method paymeth_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method
    ADD CONSTRAINT paymeth_type FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- PostgreSQL database dump complete
--

