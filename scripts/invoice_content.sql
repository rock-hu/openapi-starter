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
-- Name: invoice_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_content (
    invoice_id character varying(20) NOT NULL,
    invoice_content_type_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_content OWNER TO ofbiz;

--
-- Name: invoice_content pk_invoice_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_content
    ADD CONSTRAINT pk_invoice_content PRIMARY KEY (content_id, invoice_id, invoice_content_type_id, from_date);


--
-- Name: inv_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_cnt_cnt ON invoice_content USING btree (content_id);


--
-- Name: inv_cnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_cnt_prod ON invoice_content USING btree (invoice_id);


--
-- Name: inv_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_cnt_type ON invoice_content USING btree (invoice_content_type_id);


--
-- Name: invc_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_cntnt_txcrts ON invoice_content USING btree (created_tx_stamp);


--
-- Name: invc_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_cntnt_txstmp ON invoice_content USING btree (last_updated_tx_stamp);


--
-- Name: invoice_content inv_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_content
    ADD CONSTRAINT inv_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: invoice_content inv_cnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_content
    ADD CONSTRAINT inv_cnt_prod FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_content inv_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_content
    ADD CONSTRAINT inv_cnt_type FOREIGN KEY (invoice_content_type_id) REFERENCES invoice_content_type(invoice_content_type_id);


--
-- PostgreSQL database dump complete
--

