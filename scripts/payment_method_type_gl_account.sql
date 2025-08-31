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
-- Name: payment_method_type_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_method_type_gl_account (
    payment_method_type_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_method_type_gl_account OWNER TO ofbiz;

--
-- Name: payment_method_type_gl_account pk_payment_method_type_gl_acco; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method_type_gl_account
    ADD CONSTRAINT pk_payment_method_type_gl_acco PRIMARY KEY (payment_method_type_id, organization_party_id);


--
-- Name: payment_mtga_glac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_mtga_glac ON payment_method_type_gl_account USING btree (gl_account_id);


--
-- Name: payment_mtga_opty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_mtga_opty ON payment_method_type_gl_account USING btree (organization_party_id);


--
-- Name: payment_mtga_pmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_mtga_pmt ON payment_method_type_gl_account USING btree (payment_method_type_id);


--
-- Name: pmt_tp_gl_act_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_tp_gl_act_tp ON payment_method_type_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: pmt_tp_gl_act_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_tp_gl_act_ts ON payment_method_type_gl_account USING btree (created_tx_stamp);


--
-- Name: payment_method_type_gl_account payment_mtga_glac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method_type_gl_account
    ADD CONSTRAINT payment_mtga_glac FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: payment_method_type_gl_account payment_mtga_opty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method_type_gl_account
    ADD CONSTRAINT payment_mtga_opty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: payment_method_type_gl_account payment_mtga_pmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_method_type_gl_account
    ADD CONSTRAINT payment_mtga_pmt FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- PostgreSQL database dump complete
--

