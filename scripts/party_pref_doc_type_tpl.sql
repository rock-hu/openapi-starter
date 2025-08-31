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
-- Name: party_pref_doc_type_tpl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_pref_doc_type_tpl (
    party_pref_doc_type_tpl_id character varying(20) NOT NULL,
    party_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    invoice_type_id character varying(20),
    order_type_id character varying(20),
    quote_type_id character varying(20),
    custom_screen_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_pref_doc_type_tpl OWNER TO ofbiz;

--
-- Name: party_pref_doc_type_tpl pk_party_pref_doc_type_tpl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT pk_party_pref_doc_type_tpl PRIMARY KEY (party_pref_doc_type_tpl_id);


--
-- Name: papdtt_to_invt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX papdtt_to_invt ON party_pref_doc_type_tpl USING btree (invoice_type_id);


--
-- Name: papdtt_to_ordt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX papdtt_to_ordt ON party_pref_doc_type_tpl USING btree (order_type_id);


--
-- Name: papdtt_to_pap; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX papdtt_to_pap ON party_pref_doc_type_tpl USING btree (party_id);


--
-- Name: papdtt_to_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX papdtt_to_pty ON party_pref_doc_type_tpl USING btree (party_id);


--
-- Name: papdtt_to_quot; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX papdtt_to_quot ON party_pref_doc_type_tpl USING btree (quote_type_id);


--
-- Name: prt_dc_tp_tpl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_dc_tp_tpl_tp ON party_pref_doc_type_tpl USING btree (last_updated_tx_stamp);


--
-- Name: prt_dc_tp_tpl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_dc_tp_tpl_ts ON party_pref_doc_type_tpl USING btree (created_tx_stamp);


--
-- Name: party_pref_doc_type_tpl papdtt_to_invt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT papdtt_to_invt FOREIGN KEY (invoice_type_id) REFERENCES invoice_type(invoice_type_id);


--
-- Name: party_pref_doc_type_tpl papdtt_to_ordt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT papdtt_to_ordt FOREIGN KEY (order_type_id) REFERENCES order_type(order_type_id);


--
-- Name: party_pref_doc_type_tpl papdtt_to_pap; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT papdtt_to_pap FOREIGN KEY (party_id) REFERENCES party_acctg_preference(party_id);


--
-- Name: party_pref_doc_type_tpl papdtt_to_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT papdtt_to_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_pref_doc_type_tpl papdtt_to_quot; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_pref_doc_type_tpl
    ADD CONSTRAINT papdtt_to_quot FOREIGN KEY (quote_type_id) REFERENCES quote_type(quote_type_id);


--
-- PostgreSQL database dump complete
--

