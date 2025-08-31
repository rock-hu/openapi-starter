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
-- Name: sales_opportunity_competitor; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_competitor (
    sales_opportunity_id character varying(20) NOT NULL,
    competitor_party_id character varying(20) NOT NULL,
    position_enum_id character varying(20),
    strengths text,
    weaknesses text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_competitor OWNER TO ofbiz;

--
-- Name: sales_opportunity_competitor pk_sales_opportunity_competito; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_competitor
    ADD CONSTRAINT pk_sales_opportunity_competito PRIMARY KEY (sales_opportunity_id, competitor_party_id);


--
-- Name: sls_opprt_cmr_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_cmr_txcs ON sales_opportunity_competitor USING btree (created_tx_stamp);


--
-- Name: sls_opprt_cmr_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_cmr_txsp ON sales_opportunity_competitor USING btree (last_updated_tx_stamp);


--
-- Name: soppcomp_sopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX soppcomp_sopp ON sales_opportunity_competitor USING btree (sales_opportunity_id);


--
-- Name: sales_opportunity_competitor soppcomp_sopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_competitor
    ADD CONSTRAINT soppcomp_sopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- PostgreSQL database dump complete
--

