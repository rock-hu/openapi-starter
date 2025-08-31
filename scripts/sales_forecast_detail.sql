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
-- Name: sales_forecast_detail; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_forecast_detail (
    sales_forecast_id character varying(20) NOT NULL,
    sales_forecast_detail_id character varying(20) NOT NULL,
    amount numeric(18,2),
    quantity_uom_id character varying(20),
    quantity numeric(18,6),
    product_id character varying(20),
    product_category_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_forecast_detail OWNER TO ofbiz;

--
-- Name: sales_forecast_detail pk_sales_forecast_detail; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast_detail
    ADD CONSTRAINT pk_sales_forecast_detail PRIMARY KEY (sales_forecast_id, sales_forecast_detail_id);


--
-- Name: sales4cdtl_pctgry; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4cdtl_pctgry ON sales_forecast_detail USING btree (product_category_id);


--
-- Name: sales4cdtl_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4cdtl_prod ON sales_forecast_detail USING btree (product_id);


--
-- Name: sales4cdtl_qty_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4cdtl_qty_uom ON sales_forecast_detail USING btree (quantity_uom_id);


--
-- Name: sales4cdtl_sales4c; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sales4cdtl_sales4c ON sales_forecast_detail USING btree (sales_forecast_id);


--
-- Name: sls_frct_dtl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_frct_dtl_txcrs ON sales_forecast_detail USING btree (created_tx_stamp);


--
-- Name: sls_frct_dtl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_frct_dtl_txstp ON sales_forecast_detail USING btree (last_updated_tx_stamp);


--
-- Name: sales_forecast_detail sales4cdtl_pctgry; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast_detail
    ADD CONSTRAINT sales4cdtl_pctgry FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: sales_forecast_detail sales4cdtl_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast_detail
    ADD CONSTRAINT sales4cdtl_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: sales_forecast_detail sales4cdtl_qty_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast_detail
    ADD CONSTRAINT sales4cdtl_qty_uom FOREIGN KEY (quantity_uom_id) REFERENCES uom(uom_id);


--
-- Name: sales_forecast_detail sales4cdtl_sales4c; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_forecast_detail
    ADD CONSTRAINT sales4cdtl_sales4c FOREIGN KEY (sales_forecast_id) REFERENCES sales_forecast(sales_forecast_id);


--
-- PostgreSQL database dump complete
--

