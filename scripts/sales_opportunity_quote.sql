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
-- Name: sales_opportunity_quote; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_quote (
    sales_opportunity_id character varying(20) NOT NULL,
    quote_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_quote OWNER TO ofbiz;

--
-- Name: sales_opportunity_quote pk_sales_opportunity_quote; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_quote
    ADD CONSTRAINT pk_sales_opportunity_quote PRIMARY KEY (sales_opportunity_id, quote_id);


--
-- Name: sls_opprt_qt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_qt_txcrs ON sales_opportunity_quote USING btree (created_tx_stamp);


--
-- Name: sls_opprt_qt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_qt_txstp ON sales_opportunity_quote USING btree (last_updated_tx_stamp);


--
-- Name: soppqte_qte; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX soppqte_qte ON sales_opportunity_quote USING btree (quote_id);


--
-- Name: soppqte_sopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX soppqte_sopp ON sales_opportunity_quote USING btree (sales_opportunity_id);


--
-- Name: sales_opportunity_quote soppqte_qte; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_quote
    ADD CONSTRAINT soppqte_qte FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- Name: sales_opportunity_quote soppqte_sopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_quote
    ADD CONSTRAINT soppqte_sopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- PostgreSQL database dump complete
--

