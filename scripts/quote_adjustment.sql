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
-- Name: quote_adjustment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_adjustment (
    quote_adjustment_id character varying(20) NOT NULL,
    quote_adjustment_type_id character varying(20),
    quote_id character varying(20),
    quote_item_seq_id character varying(20),
    comments character varying(255),
    description character varying(255),
    amount numeric(18,2),
    product_promo_id character varying(20),
    product_promo_rule_id character varying(20),
    product_promo_action_seq_id character varying(20),
    product_feature_id character varying(20),
    corresponding_product_id character varying(20),
    source_reference_id character varying(60),
    source_percentage numeric(18,6),
    customer_reference_id character varying(60),
    primary_geo_id character varying(20),
    secondary_geo_id character varying(20),
    exempt_amount numeric(18,2),
    tax_auth_geo_id character varying(20),
    tax_auth_party_id character varying(20),
    override_gl_account_id character varying(20),
    include_in_tax character(1),
    include_in_shipping character(1),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_adjustment OWNER TO ofbiz;

--
-- Name: quote_adjustment pk_quote_adjustment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT pk_quote_adjustment PRIMARY KEY (quote_adjustment_id);


--
-- Name: qt_adjstmnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_adjstmnt_txcrts ON quote_adjustment USING btree (created_tx_stamp);


--
-- Name: qt_adjstmnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_adjstmnt_txstmp ON quote_adjustment USING btree (last_updated_tx_stamp);


--
-- Name: quote_adj_ogla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_ogla ON quote_adjustment USING btree (override_gl_account_id);


--
-- Name: quote_adj_ohead; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_ohead ON quote_adjustment USING btree (quote_id);


--
-- Name: quote_adj_prgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_prgeo ON quote_adjustment USING btree (primary_geo_id);


--
-- Name: quote_adj_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_promo ON quote_adjustment USING btree (product_promo_id);


--
-- Name: quote_adj_scgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_scgeo ON quote_adjustment USING btree (secondary_geo_id);


--
-- Name: quote_adj_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_txa ON quote_adjustment USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: quote_adj_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_type ON quote_adjustment USING btree (quote_adjustment_type_id);


--
-- Name: quote_adj_userl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_adj_userl ON quote_adjustment USING btree (created_by_user_login);


--
-- Name: quote_adjustment quote_adj_ogla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_ogla FOREIGN KEY (override_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: quote_adjustment quote_adj_ohead; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_ohead FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- Name: quote_adjustment quote_adj_prgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_prgeo FOREIGN KEY (primary_geo_id) REFERENCES geo(geo_id);


--
-- Name: quote_adjustment quote_adj_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- Name: quote_adjustment quote_adj_scgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_scgeo FOREIGN KEY (secondary_geo_id) REFERENCES geo(geo_id);


--
-- Name: quote_adjustment quote_adj_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- Name: quote_adjustment quote_adj_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_type FOREIGN KEY (quote_adjustment_type_id) REFERENCES order_adjustment_type(order_adjustment_type_id);


--
-- Name: quote_adjustment quote_adj_userl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_adjustment
    ADD CONSTRAINT quote_adj_userl FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

