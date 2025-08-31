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
-- Name: return_header; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_header (
    return_id character varying(20) NOT NULL,
    return_header_type_id character varying(20),
    status_id character varying(20),
    created_by character varying(255),
    from_party_id character varying(20),
    to_party_id character varying(20),
    payment_method_id character varying(20),
    fin_account_id character varying(20),
    billing_account_id character varying(20),
    entry_date timestamp with time zone,
    origin_contact_mech_id character varying(20),
    destination_facility_id character varying(20),
    needs_inventory_receive character(1),
    currency_uom_id character varying(20),
    supplier_rma_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_header OWNER TO ofbiz;

--
-- Name: return_header pk_return_header; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT pk_return_header PRIMARY KEY (return_id);


--
-- Name: rtn_from_ctm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_from_ctm ON return_header USING btree (origin_contact_mech_id);


--
-- Name: rtn_from_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_from_party ON return_header USING btree (from_party_id);


--
-- Name: rtn_hdr_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_hdr_cuom ON return_header USING btree (currency_uom_id);


--
-- Name: rtn_head_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_head_type ON return_header USING btree (return_header_type_id);


--
-- Name: rtn_stts_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_stts_item ON return_header USING btree (status_id);


--
-- Name: rtn_to_bact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_to_bact ON return_header USING btree (billing_account_id);


--
-- Name: rtn_to_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_to_facility ON return_header USING btree (destination_facility_id);


--
-- Name: rtn_to_fact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_to_fact ON return_header USING btree (fin_account_id);


--
-- Name: rtn_to_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_to_party ON return_header USING btree (to_party_id);


--
-- Name: rtn_to_paymeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_to_paymeth ON return_header USING btree (payment_method_id);


--
-- Name: rtrn_hdr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_hdr_txcrts ON return_header USING btree (created_tx_stamp);


--
-- Name: rtrn_hdr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_hdr_txstmp ON return_header USING btree (last_updated_tx_stamp);


--
-- Name: return_header rtn_from_ctm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_from_ctm FOREIGN KEY (origin_contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: return_header rtn_from_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_from_party FOREIGN KEY (from_party_id) REFERENCES party(party_id);


--
-- Name: return_header rtn_hdr_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_hdr_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: return_header rtn_head_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_head_type FOREIGN KEY (return_header_type_id) REFERENCES return_header_type(return_header_type_id);


--
-- Name: return_header rtn_stts_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_stts_item FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: return_header rtn_to_bact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_to_bact FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: return_header rtn_to_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_to_facility FOREIGN KEY (destination_facility_id) REFERENCES facility(facility_id);


--
-- Name: return_header rtn_to_fact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_to_fact FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: return_header rtn_to_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_to_party FOREIGN KEY (to_party_id) REFERENCES party(party_id);


--
-- Name: return_header rtn_to_paymeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header
    ADD CONSTRAINT rtn_to_paymeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

