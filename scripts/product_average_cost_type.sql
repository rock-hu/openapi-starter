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
-- Name: product_average_cost_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_average_cost_type (
    product_average_cost_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_average_cost_type OWNER TO ofbiz;

--
-- Name: product_average_cost_type pk_product_average_cost_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost_type
    ADD CONSTRAINT pk_product_average_cost_type PRIMARY KEY (product_average_cost_type_id);


--
-- Name: avgcost_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX avgcost_type_par ON product_average_cost_type USING btree (parent_type_id);


--
-- Name: prt_avg_cst_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_avg_cst_tp_txp ON product_average_cost_type USING btree (last_updated_tx_stamp);


--
-- Name: prt_avg_cst_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_avg_cst_tp_txs ON product_average_cost_type USING btree (created_tx_stamp);


--
-- Name: product_average_cost_type avgcost_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_average_cost_type
    ADD CONSTRAINT avgcost_type_par FOREIGN KEY (parent_type_id) REFERENCES product_average_cost_type(product_average_cost_type_id);


--
-- PostgreSQL database dump complete
--

