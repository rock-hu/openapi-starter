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
-- Name: product_price_auto_notice; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_price_auto_notice (
    product_price_notice_id character varying(20) NOT NULL,
    facility_id character varying(20),
    run_date timestamp with time zone,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_price_auto_notice OWNER TO ofbiz;

--
-- Name: product_price_auto_notice pk_product_price_auto_notice; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_auto_notice
    ADD CONSTRAINT pk_product_price_auto_notice PRIMARY KEY (product_price_notice_id);


--
-- Name: prt_prc_at_ntc_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prc_at_ntc_txp ON product_price_auto_notice USING btree (last_updated_tx_stamp);


--
-- Name: prt_prc_at_ntc_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prc_at_ntc_txs ON product_price_auto_notice USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

