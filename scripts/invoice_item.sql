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
-- Name: invoice_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item (
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    invoice_item_type_id character varying(20),
    override_gl_account_id character varying(20),
    override_org_party_id character varying(20),
    inventory_item_id character varying(20),
    product_id character varying(20),
    product_feature_id character varying(20),
    parent_invoice_id character varying(20),
    parent_invoice_item_seq_id character varying(20),
    uom_id character varying(20),
    taxable_flag character(1),
    quantity numeric(18,6),
    amount numeric(18,3),
    description character varying(255),
    tax_auth_party_id character varying(20),
    tax_auth_geo_id character varying(20),
    tax_authority_rate_seq_id character varying(20),
    sales_opportunity_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item OWNER TO ofbiz;

--
-- Name: invoice_item pk_invoice_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT pk_invoice_item PRIMARY KEY (invoice_id, invoice_item_seq_id);


--
-- Name: invc_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_itm_txcrts ON invoice_item USING btree (created_tx_stamp);


--
-- Name: invc_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_itm_txstmp ON invoice_item USING btree (last_updated_tx_stamp);


--
-- Name: invce_itm_invce; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_invce ON invoice_item USING btree (invoice_id);


--
-- Name: invce_itm_invitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_invitm ON invoice_item USING btree (inventory_item_id);


--
-- Name: invce_itm_orgla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_orgla ON invoice_item USING btree (override_gl_account_id);


--
-- Name: invce_itm_ovrpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_ovrpty ON invoice_item USING btree (override_org_party_id);


--
-- Name: invce_itm_pinvit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_pinvit ON invoice_item USING btree (parent_invoice_id, parent_invoice_item_seq_id);


--
-- Name: invce_itm_prdft; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_prdft ON invoice_item USING btree (product_feature_id);


--
-- Name: invce_itm_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_prod ON invoice_item USING btree (product_id);


--
-- Name: invce_itm_slsopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_slsopp ON invoice_item USING btree (sales_opportunity_id);


--
-- Name: invce_itm_taxgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_taxgeo ON invoice_item USING btree (tax_auth_geo_id);


--
-- Name: invce_itm_taxpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_taxpty ON invoice_item USING btree (tax_auth_party_id);


--
-- Name: invce_itm_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_itm_uom ON invoice_item USING btree (uom_id);


--
-- Name: invoice_itm_tarp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_itm_tarp ON invoice_item USING btree (tax_authority_rate_seq_id);


--
-- Name: invoice_itmityp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_itmityp ON invoice_item USING btree (invoice_item_type_id);


--
-- Name: invoice_item invce_itm_invce; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_invce FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_item invce_itm_invitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_invitm FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: invoice_item invce_itm_orgla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_orgla FOREIGN KEY (override_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: invoice_item invce_itm_ovrpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_ovrpty FOREIGN KEY (override_org_party_id) REFERENCES party(party_id);


--
-- Name: invoice_item invce_itm_pinvit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_pinvit FOREIGN KEY (parent_invoice_id, parent_invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: invoice_item invce_itm_prdft; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_prdft FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: invoice_item invce_itm_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: invoice_item invce_itm_slsopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_slsopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- Name: invoice_item invce_itm_taxgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_taxgeo FOREIGN KEY (tax_auth_geo_id) REFERENCES geo(geo_id);


--
-- Name: invoice_item invce_itm_taxpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_taxpty FOREIGN KEY (tax_auth_party_id) REFERENCES party(party_id);


--
-- Name: invoice_item invce_itm_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invce_itm_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- Name: invoice_item invoice_itm_tarp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invoice_itm_tarp FOREIGN KEY (tax_authority_rate_seq_id) REFERENCES tax_authority_rate_product(tax_authority_rate_seq_id);


--
-- Name: invoice_item invoice_itmityp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item
    ADD CONSTRAINT invoice_itmityp FOREIGN KEY (invoice_item_type_id) REFERENCES invoice_item_type(invoice_item_type_id);


--
-- PostgreSQL database dump complete
--

