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
-- Name: quote_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_item (
    quote_id character varying(20) NOT NULL,
    quote_item_seq_id character varying(20) NOT NULL,
    product_id character varying(20),
    product_feature_id character varying(20),
    deliverable_type_id character varying(20),
    skill_type_id character varying(20),
    uom_id character varying(20),
    work_effort_id character varying(20),
    cust_request_id character varying(20),
    cust_request_item_seq_id character varying(20),
    quantity numeric(18,6),
    selected_amount numeric(18,6),
    quote_unit_price numeric(18,2),
    reserv_start timestamp with time zone,
    reserv_length numeric(18,6),
    reserv_persons numeric(18,6),
    config_id character varying(20),
    estimated_delivery_date timestamp with time zone,
    comments character varying(255),
    is_promo character(1),
    lead_time_days numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_item OWNER TO ofbiz;

--
-- Name: quote_item pk_quote_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT pk_quote_item PRIMARY KEY (quote_id, quote_item_seq_id);


--
-- Name: quote_item_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_item_txcrts ON quote_item USING btree (created_tx_stamp);


--
-- Name: quote_item_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_item_txstmp ON quote_item USING btree (last_updated_tx_stamp);


--
-- Name: quote_itm_csritm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_csritm ON quote_item USING btree (cust_request_id, cust_request_item_seq_id);


--
-- Name: quote_itm_csrq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_csrq ON quote_item USING btree (cust_request_id);


--
-- Name: quote_itm_delt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_delt ON quote_item USING btree (deliverable_type_id);


--
-- Name: quote_itm_pfeat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_pfeat ON quote_item USING btree (product_feature_id);


--
-- Name: quote_itm_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_prod ON quote_item USING btree (product_id);


--
-- Name: quote_itm_qte; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_qte ON quote_item USING btree (quote_id);


--
-- Name: quote_itm_sklt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_sklt ON quote_item USING btree (skill_type_id);


--
-- Name: quote_itm_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_uom ON quote_item USING btree (uom_id);


--
-- Name: quote_itm_wkeff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_itm_wkeff ON quote_item USING btree (work_effort_id);


--
-- Name: quote_item quote_itm_csritm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_csritm FOREIGN KEY (cust_request_id, cust_request_item_seq_id) REFERENCES cust_request_item(cust_request_id, cust_request_item_seq_id);


--
-- Name: quote_item quote_itm_csrq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_csrq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: quote_item quote_itm_delt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_delt FOREIGN KEY (deliverable_type_id) REFERENCES deliverable_type(deliverable_type_id);


--
-- Name: quote_item quote_itm_pfeat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_pfeat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: quote_item quote_itm_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: quote_item quote_itm_qte; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_qte FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- Name: quote_item quote_itm_sklt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_sklt FOREIGN KEY (skill_type_id) REFERENCES skill_type(skill_type_id);


--
-- Name: quote_item quote_itm_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- Name: quote_item quote_itm_wkeff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_item
    ADD CONSTRAINT quote_itm_wkeff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

