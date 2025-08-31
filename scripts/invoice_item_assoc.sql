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
-- Name: invoice_item_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item_assoc (
    invoice_id_from character varying(20) NOT NULL,
    invoice_item_seq_id_from character varying(20) NOT NULL,
    invoice_id_to character varying(20) NOT NULL,
    invoice_item_seq_id_to character varying(20) NOT NULL,
    invoice_item_assoc_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    party_id_from character varying(20),
    party_id_to character varying(20),
    quantity numeric(18,6),
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item_assoc OWNER TO ofbiz;

--
-- Name: invoice_item_assoc pk_invoice_item_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc
    ADD CONSTRAINT pk_invoice_item_assoc PRIMARY KEY (invoice_id_from, invoice_item_seq_id_from, invoice_id_to, invoice_item_seq_id_to, invoice_item_assoc_type_id, from_date);


--
-- Name: inc_itm_asc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_asc_txcrts ON invoice_item_assoc USING btree (created_tx_stamp);


--
-- Name: inc_itm_asc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_asc_txstmp ON invoice_item_assoc USING btree (last_updated_tx_stamp);


--
-- Name: initmasc_fiitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX initmasc_fiitm ON invoice_item_assoc USING btree (invoice_id_from, invoice_item_seq_id_from);


--
-- Name: initmasc_tiitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX initmasc_tiitm ON invoice_item_assoc USING btree (invoice_id_to, invoice_item_seq_id_to);


--
-- Name: initmasctyp_iiasc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX initmasctyp_iiasc ON invoice_item_assoc USING btree (invoice_item_assoc_type_id);


--
-- Name: invoice_item_assoc initmasc_fiitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc
    ADD CONSTRAINT initmasc_fiitm FOREIGN KEY (invoice_id_from, invoice_item_seq_id_from) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: invoice_item_assoc initmasc_tiitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc
    ADD CONSTRAINT initmasc_tiitm FOREIGN KEY (invoice_id_to, invoice_item_seq_id_to) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: invoice_item_assoc initmasctyp_iiasc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc
    ADD CONSTRAINT initmasctyp_iiasc FOREIGN KEY (invoice_item_assoc_type_id) REFERENCES invoice_item_assoc_type(invoice_item_assoc_type_id);


--
-- PostgreSQL database dump complete
--

