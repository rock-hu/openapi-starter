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
-- Name: invoice_item_type_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item_type_gl_account (
    invoice_item_type_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item_type_gl_account OWNER TO ofbiz;

--
-- Name: invoice_item_type_gl_account pk_invoice_item_type_gl_accoun; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_gl_account
    ADD CONSTRAINT pk_invoice_item_type_gl_accoun PRIMARY KEY (invoice_item_type_id, organization_party_id);


--
-- Name: inc_tp_gl_act_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_tp_gl_act_tp ON invoice_item_type_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: inc_tp_gl_act_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_tp_gl_act_ts ON invoice_item_type_gl_account USING btree (created_tx_stamp);


--
-- Name: invoice_itga_glac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_itga_glac ON invoice_item_type_gl_account USING btree (gl_account_id);


--
-- Name: invoice_itga_iit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_itga_iit ON invoice_item_type_gl_account USING btree (invoice_item_type_id);


--
-- Name: invoice_itga_opty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_itga_opty ON invoice_item_type_gl_account USING btree (organization_party_id);


--
-- Name: invoice_item_type_gl_account invoice_itga_glac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_gl_account
    ADD CONSTRAINT invoice_itga_glac FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: invoice_item_type_gl_account invoice_itga_iit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_gl_account
    ADD CONSTRAINT invoice_itga_iit FOREIGN KEY (invoice_item_type_id) REFERENCES invoice_item_type(invoice_item_type_id);


--
-- Name: invoice_item_type_gl_account invoice_itga_opty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_type_gl_account
    ADD CONSTRAINT invoice_itga_opty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

