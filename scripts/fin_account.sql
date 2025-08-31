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
-- Name: fin_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fin_account (
    fin_account_id character varying(20) NOT NULL,
    fin_account_type_id character varying(20),
    status_id character varying(20),
    fin_account_name character varying(100),
    fin_account_code character varying(255),
    fin_account_pin character varying(255),
    currency_uom_id character varying(20),
    organization_party_id character varying(20),
    owner_party_id character varying(20),
    post_to_gl_account_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    is_refundable character(1),
    replenish_payment_id character varying(20),
    replenish_level numeric(18,2),
    actual_balance numeric(18,2),
    available_balance numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fin_account OWNER TO ofbiz;

--
-- Name: fin_account pk_fin_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT pk_fin_account PRIMARY KEY (fin_account_id);


--
-- Name: fin_account_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_account_txcrts ON fin_account USING btree (created_tx_stamp);


--
-- Name: fin_account_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_account_txstmp ON fin_account USING btree (last_updated_tx_stamp);


--
-- Name: finacct_curuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_curuom ON fin_account USING btree (currency_uom_id);


--
-- Name: finacct_glac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_glac ON fin_account USING btree (post_to_gl_account_id);


--
-- Name: finacct_orgpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_orgpty ON fin_account USING btree (organization_party_id);


--
-- Name: finacct_ownpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_ownpty ON fin_account USING btree (owner_party_id);


--
-- Name: finacct_paymeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_paymeth ON fin_account USING btree (replenish_payment_id);


--
-- Name: finacct_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_type ON fin_account USING btree (fin_account_type_id);


--
-- Name: fin_account finacct_curuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_curuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: fin_account finacct_glac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_glac FOREIGN KEY (post_to_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: fin_account finacct_orgpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_orgpty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: fin_account finacct_ownpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_ownpty FOREIGN KEY (owner_party_id) REFERENCES party(party_id);


--
-- Name: fin_account finacct_paymeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_paymeth FOREIGN KEY (replenish_payment_id) REFERENCES payment_method(payment_method_id);


--
-- Name: fin_account finacct_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account
    ADD CONSTRAINT finacct_type FOREIGN KEY (fin_account_type_id) REFERENCES fin_account_type(fin_account_type_id);


--
-- PostgreSQL database dump complete
--

