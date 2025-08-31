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
-- Name: quote; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote (
    quote_id character varying(20) NOT NULL,
    quote_type_id character varying(20),
    party_id character varying(20),
    issue_date timestamp with time zone,
    status_id character varying(20),
    currency_uom_id character varying(20),
    product_store_id character varying(20),
    sales_channel_enum_id character varying(20),
    valid_from_date timestamp with time zone,
    valid_thru_date timestamp with time zone,
    quote_name character varying(100),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote OWNER TO ofbiz;

--
-- Name: quote pk_quote; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT pk_quote PRIMARY KEY (quote_id);


--
-- Name: quote_channel; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_channel ON quote USING btree (sales_channel_enum_id);


--
-- Name: quote_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_cuom ON quote USING btree (currency_uom_id);


--
-- Name: quote_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_prds ON quote USING btree (product_store_id);


--
-- Name: quote_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_prty ON quote USING btree (party_id);


--
-- Name: quote_qttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_qttyp ON quote USING btree (quote_type_id);


--
-- Name: quote_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_status ON quote USING btree (status_id);


--
-- Name: quote_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_txcrts ON quote USING btree (created_tx_stamp);


--
-- Name: quote_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_txstmp ON quote USING btree (last_updated_tx_stamp);


--
-- Name: quote quote_channel; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_channel FOREIGN KEY (sales_channel_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: quote quote_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: quote quote_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: quote quote_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: quote quote_qttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_qttyp FOREIGN KEY (quote_type_id) REFERENCES quote_type(quote_type_id);


--
-- Name: quote quote_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote
    ADD CONSTRAINT quote_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

