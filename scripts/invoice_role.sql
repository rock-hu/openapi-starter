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
-- Name: invoice_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_role (
    invoice_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    datetime_performed timestamp with time zone,
    percentage numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_role OWNER TO ofbiz;

--
-- Name: invoice_role pk_invoice_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_role
    ADD CONSTRAINT pk_invoice_role PRIMARY KEY (invoice_id, party_id, role_type_id);


--
-- Name: invc_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_rl_txcrts ON invoice_role USING btree (created_tx_stamp);


--
-- Name: invc_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_rl_txstmp ON invoice_role USING btree (last_updated_tx_stamp);


--
-- Name: invce_rle_invce; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_rle_invce ON invoice_role USING btree (invoice_id);


--
-- Name: invce_rle_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_rle_party ON invoice_role USING btree (party_id);


--
-- Name: invce_rle_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_rle_ptrl ON invoice_role USING btree (party_id, role_type_id);


--
-- Name: invoice_role invce_rle_invce; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_role
    ADD CONSTRAINT invce_rle_invce FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_role invce_rle_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_role
    ADD CONSTRAINT invce_rle_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: invoice_role invce_rle_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_role
    ADD CONSTRAINT invce_rle_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

