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
-- Name: sales_opportunity_trck_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_trck_code (
    sales_opportunity_id character varying(20) NOT NULL,
    tracking_code_id character varying(20) NOT NULL,
    received_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_trck_code OWNER TO ofbiz;

--
-- Name: sales_opportunity_trck_code pk_sales_opportunity_trck_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_trck_code
    ADD CONSTRAINT pk_sales_opportunity_trck_code PRIMARY KEY (sales_opportunity_id, tracking_code_id);


--
-- Name: sls_opt_trk_cd_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opt_trk_cd_txp ON sales_opportunity_trck_code USING btree (last_updated_tx_stamp);


--
-- Name: sls_opt_trk_cd_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opt_trk_cd_txs ON sales_opportunity_trck_code USING btree (created_tx_stamp);


--
-- Name: sopptrkcd_sopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sopptrkcd_sopp ON sales_opportunity_trck_code USING btree (sales_opportunity_id);


--
-- Name: sales_opportunity_trck_code sopptrkcd_sopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_trck_code
    ADD CONSTRAINT sopptrkcd_sopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- PostgreSQL database dump complete
--

