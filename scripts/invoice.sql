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
-- Name: invoice; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice (
    invoice_id character varying(20) NOT NULL,
    invoice_type_id character varying(20),
    party_id_from character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    status_id character varying(20),
    billing_account_id character varying(20),
    contact_mech_id character varying(20),
    invoice_date timestamp with time zone,
    due_date timestamp with time zone,
    paid_date timestamp with time zone,
    invoice_message character varying(255),
    reference_number character varying(60),
    description character varying(255),
    currency_uom_id character varying(20),
    recurrence_info_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice OWNER TO ofbiz;

--
-- Name: invoice pk_invoice; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT pk_invoice PRIMARY KEY (invoice_id);


--
-- Name: invoice_billacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_billacct ON invoice USING btree (billing_account_id);


--
-- Name: invoice_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_cmech ON invoice USING btree (contact_mech_id);


--
-- Name: invoice_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_cuom ON invoice USING btree (currency_uom_id);


--
-- Name: invoice_invtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_invtyp ON invoice USING btree (invoice_type_id);


--
-- Name: invoice_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_party ON invoice USING btree (party_id);


--
-- Name: invoice_party_frm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_party_frm ON invoice USING btree (party_id_from);


--
-- Name: invoice_recinfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_recinfo ON invoice USING btree (recurrence_info_id);


--
-- Name: invoice_roletyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_roletyp ON invoice USING btree (role_type_id);


--
-- Name: invoice_sttsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_sttsitm ON invoice USING btree (status_id);


--
-- Name: invoice_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_txcrts ON invoice USING btree (created_tx_stamp);


--
-- Name: invoice_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_txstmp ON invoice USING btree (last_updated_tx_stamp);


--
-- Name: invoice invoice_billacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_billacct FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: invoice invoice_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: invoice invoice_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: invoice invoice_invtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_invtyp FOREIGN KEY (invoice_type_id) REFERENCES invoice_type(invoice_type_id);


--
-- Name: invoice invoice_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: invoice invoice_party_frm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_party_frm FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: invoice invoice_recinfo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_recinfo FOREIGN KEY (recurrence_info_id) REFERENCES recurrence_info(recurrence_info_id);


--
-- Name: invoice invoice_roletyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_roletyp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: invoice invoice_sttsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice
    ADD CONSTRAINT invoice_sttsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

